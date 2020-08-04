# 依赖软件环境
- NetBeans 8.2
- JDK8
- Hadoop2.5.0
- MySQL Server 8.0
- HBase 1.2.2
- Hive 1.2.2

# 必要的配置步骤
## 文件配置
1. 修改`WebApplication/src/java/properties/database.properties`中的第7行的`username`和第8行的`password`属性为本地数据库用户名和密码。
2. 修改`WebApplication/src/java/log4j.properties`中的`log4j.appender.file.File`属性，将其改为要存放日志的目录
3. 修改`dbc.HBUtil`中的HBase相关设置，包括第45行的`hbase.rootdir`，和第46行的`hbase.zookeeper.quorum`属性

## 导入依赖Jar包
1. 把`libs`添加到`WebApplication/web/WEB-INF/lib`中
2. 用NetBeans打开`WebApplication`，把`libs`添加到库文件中

## 导入必要数据库表格
1. 在MySQL中运行`shoppingdatabase.sql`


## HBase & Hive
1. 在HBase中建立网络日志表和生成日志表
```sql
create 'Intel_input', 'info_intelInput'
create 'Person_input', 'info_personInput'
```

2. 在Hive中建议依赖Hbase的外部表
```sql
create external table Intel_input(useid int, iteid int, catid int, actid int, time int) 
    stored by 'org.apache.hadoop.hive.hbase.HBaseStorageHandler' with serdeproperties
    ("hbase.columns.mapping"=":key, info_intelInput:iteid, info_intelInput:catid, info_intelInput:catid, info_intelInput:time") 
    tblproperties("hbase.table.name"="Intel_input");

create external table Person_input(useid string, iteid int, catid string, actid int, time string) 
    stored by 'org.apache.hadoop.hive.hbase.HBaseStorageHandler' with serdeproperties
    ("hbase.columns.mapping"="info_personInput:time, info_personInput:iteid, info_personInput:catid, info_personInput:actid, :key") 
    tblproperties("hbase.table.name"="Person_input");
```

3. 将网络日志数据导入Hive - 通过新建表load data在插入表格
```sql
create table Intel_input_temp(useid int, iteid int, catid int, actid int, time int) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';

load data local inpath '/home/hadoop/misc/taobao.csv' into table Intel_input_temp;

insert overwrite table Intel_input select * from Intel_input_temp;
```

3. 在Hive建立输出表到HBase - 每个日志3个分析结果的表
```sql
create table Intel_outputClick(id string, val int, num int) stored by 'org.apache.hadoop.hive.hbase.HBaseStorageHandler' with serdeproperties ("hbase.columns.mapping"="info_outputIC:id, info_outputIC:val,:key");
create table Intel_outputSale(id string, val int, num int) stored by 'org.apache.hadoop.hive.hbase.HBaseStorageHandler' with serdeproperties ("hbase.columns.mapping"="info_outputIS:id, info_outputIS:val, :key");
create table Intel_outputBuy(id string, val float, num int) stored by 'org.apache.hadoop.hive.hbase.HBaseStorageHandler' with serdeproperties ("hbase.columns.mapping"="info_outputIB:id, info_outputIB:val, :key");

create table person_outputClick(id string, val int, num int) stored by 'org.apache.hadoop.hive.hbase.HBaseStorageHandler' with serdeproperties ("hbase.columns.mapping"="info_outputPC:id, info_outputPC:val, :key");
create table person_outputSale(id string, val int, num int) stored by 'org.apache.hadoop.hive.hbase.HBaseStorageHandler' with serdeproperties ("hbase.columns.mapping"="info_outputPS:id, info_outputPS:val, :key");
create table person_outputBuy(id string, val float, num int) stored by 'org.apache.hadoop.hive.hbase.HBaseStorageHandler' with serdeproperties ("hbase.columns.mapping"="info_outputPB:id, info_outputPC:val, :key");
```

4. 命令分析日志
在hive中运行下面的命令即可获得分析结果，此结果存放在hbase中
```sql
# intel
# 点击量：
insert into table intel_outputclick select ff.*, row_number() over(partition by 1) from (select f.* from (select iteid, count(*) c from intel_input group by iteid order by c desc limit 5)f order by f.c)ff;

# 销售量：
insert into table intel_outputsale select ff.*, row_number() over(partition by 1) from (select f.* from(select iteid, count(actid) c from intel_input where actid=1 group by iteid order by c desc limit 5)f order by f.c)ff;

# 购买率：
insert into table intel_outputBuy select ff.*, row_number() over(partition by 1) from(select f.iteid, f.rate from (select iteid, sum(actid)/count(actid) rate from Intel_input group by iteid order by rate desc limit 5)f order by f.rate) ff;

# person
# 点击量：
insert into table person_outputclick select ff.*, row_number() over(partition by 1) from (select f.* from (select iteid, count(*) c from person_input group by iteid order by c desc limit 5)f order by f.c)ff;

# 销售量：
insert into table person_outputsale select ff.*, row_number() over(partition by 1) from (select f.* from(select iteid, count(actid) c from person_input where actid=1 group by iteid order by c desc limit 5)f order by f.c)ff;

# 购买率：
insert into table person_outputBuy select ff.*, row_number() over(partition by 1) from(select f.iteid, f.rate from (select iteid, sum(actid)/count(actid) rate from person_input group by iteid order by rate desc limit 5)f order by f.rate) ff;
```

5. jar包分析日志
将文件中的jar包编译，利用SFTP传输文件，将文件存放在`$HIVE_HOME$/auxlib/combine.jar`下。随后在hive中运行下面的命令即可获得分析结果，此结果存放在hbase中
```sql
# create table
create table intel_outputCombiner(num int, one string, two string, val int) stored by 'org.apache.hadoop.hive.hbase.HBaseStorageHandler' with serdeproperties("hbase.columns.mapping"="key, info_outputIT:one, info_outputIT:two, info_outputIT:val");

# add jar to hive
add jar auxlib/combine.jar;
create temporary function combineF as 'test3.Test3';
create temporary function combineS as 'test3.combine';

# using function to analysis
insert into table intel_outputCombiner select row_number() over(partition by 1), ff.* from (select f.* from (select combineS(combineF(concat_ws('-', cast(useid as string), cast(iteid as string), cast(time as string)))) from intel_input_temp limit 5)f order by f.count)ff;
insert into table person_outputCombiner select row_number() over(partition by 1), ff.* from (select f.* from (select combineS(combineF(concat_ws('-', cast(useid as string), cast(iteid as string), cast(time as string)))) from person_input_temp limit 5)f order by f.count)ff;
```

## 运行WebApplication
到此步为止，所有配置已经完成
1. 右键项目名-清理并构建，再通过右键`WebApplication/web/first/pages/HomePage.jsp`运行文件打开项目主页
2. 通过点击下方的Analysis可以通过ajax从HBase中获取到分析结果的数据，并用Echart进行展示

## 清理
```sql
drop table person_input;
drop table person_outputbuy;
drop table person_outputsale;
drop table person_outputclick;
drop table person_outputcombiner;

drop table intel_input;
drop table intel_outputbuy;
drop table intel_outputsale;
drop table intel_outputclick;
drop table intel_outputcombiner;
drop table intel_input_temp;

disable 'Intel_input'
drop 'Intel_input'
disable 'Person_input'
drop 'Person_input'

select * from intel_outputbuy;
select * from intel_outputsale;
select * from intel_outputclick;
select * from person_outputbuy;
select * from person_outputsale;
select * from person_outputclick;
```