DROP DATABASE if exists `shoppingwebsite`;
create database shoppingwebsite;
use shoppingwebsite;
create table if not exists user(
user_no varchar(20) not null primary key,
user_id varchar(50) not null,
user_passwd varchar(16) not null,
user_phone varchar(16),
user_addr varchar(50)
);/*用户表*/
create table if not exists firstclothesclass(
first_no varchar(10) not null primary key,
first_id varchar(50) not null,
unique (first_id)
);/*第一层类别表————受众*/
create table if not exists secondclothesclass(
second_secondno varchar(10) not null primary key,
second_firstno varchar(10) not null,
foreign key(second_firstno) references firstclothesclass(first_no),
second_secondid varchar(50) not null
);/*第二层类别表————衣物种类*/
create table if not exists store(
store_no varchar(20) not null primary key, 
store_id varchar(50) not null,
store_passwd varchar(16) not null, 
store_phone varchar(16),
store_addr varchar(50)
);/*商户表*/
create table if not exists item(
item_no varchar(20) not null primary key,
item_id varchar(50) not null,
item_price varchar(20),
item_pic varchar(80),
store_no varchar(20) not null,
foreign key(store_no) references store(store_no),
item_audienceno varchar(10) not null,
foreign key(item_audienceno) references secondclothesclass(second_firstno),
item_typeno varchar(10) not null,
foreign key(item_typeno) references secondclothesclass(second_secondno)
);/*商品表*/
create table if not exists cart(
cart_no varchar(20) not null primary key,
item_amount varchar(20) not null,
item_no varchar(20) not null,
foreign key(item_no) references item(item_no),
user_no varchar(20) not null,
foreign key(user_no) references user(user_no),
item_size varchar(10),
item_color varchar(10)
);/*购物车表*/
create table if not exists trade(
trade_no varchar(20) not null primary key,
item_amount varchar(20) not null,
item_no varchar(20) not null,
foreign key(item_no) references item(item_no),
user_no varchar(20) not null,
foreign key(user_no) references user(user_no),
item_size varchar(10),
item_color varchar(10),
trade_status varchar(30)
);/*订单表*/
insert into firstclothesclass (first_no,first_id) values ('1','woman');
insert into firstclothesclass (first_no,first_id) values ('2','man');
insert into firstclothesclass (first_no,first_id) values ('3','boy');
insert into firstclothesclass (first_no,first_id) values ('4','girl');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('1','1','down jacket');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('1','2','jacket');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('1','3','sweater');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('1','4','sweatershirt');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('1','5','shirt');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('1','6','T-shirt');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('1','7','suit');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('1','8','dress');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('1','9','skirt');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('1','10','short sleeve');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('1','11','shorts');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('1','12','trousers');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('1','13','sportswear');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('1','14','pajamas');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('2','15','down jacket');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('2','16','jacket');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('2','17','sweater');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('2','18','sweatershirt');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('2','19','leisure shirt');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('2','20','business shirt');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('2','21','T-shirt');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('2','22','short sleeve');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('2','23','suit');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('2','24','sportswear');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('2','25','shorts');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('2','26','trousers');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('2','27','pajamas');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('3','28','coat');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('3','29','Autumn&winter sweater');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('3','30','sweater');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('3','31','shirt');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('3','32','T-shirt');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('3','33','short sleeve');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('3','34','suit');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('3','35','pants');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('3','36','cartoon');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('4','37','coat');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('4','38','Autumn&winter sweater');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('4','39','sweater');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('4','40','shirt');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('4','41','T-shirt');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('4','42','short sleeve');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('4','43','frocks');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('4','44','pants');
insert into secondclothesclass (second_firstno,second_secondno,second_secondid) values ('4','45','cartoon');
insert into store (store_no,store_id,store_passwd,store_phone,store_addr) values ('1','Uniqlos official flagship store','qwerqwer','0123456789','Shanghai');
insert into store (store_no,store_id,store_passwd,store_phone,store_addr) values ('2','ZARA official flagship store','qwerqwer','0123456789','Beijing');
insert into store (store_no,store_id,store_passwd,store_phone,store_addr) values ('3','H&M official flagship store','qwerqwer','0123456789','Guangzhou');
insert into store (store_no,store_id,store_passwd,store_phone,store_addr) values ('4','adidas official flagship store','qwerqwer','0123456789','Dongguan');
insert into store (store_no,store_id,store_passwd,store_phone,store_addr) values ('5','Yishion official flagship store','qwerqwer','0123456789','Haikou');
insert into store (store_no,store_id,store_passwd,store_phone,store_addr) values ('6','NIKE official flagship store','qwerqwer','0123456789','Shanghai');
insert into store (store_no,store_id,store_passwd,store_phone,store_addr) values ('7','BOY LONDON official flagship store','qwerqwer','0123456789','Beijing');
insert into store (store_no,store_id,store_passwd,store_phone,store_addr) values ('8','MLB official flagship store','qwerqwer','0123456789','Haikou');
insert into store (store_no,store_id,store_passwd,store_phone,store_addr) values ('9','PUMA official flagship store','qwerqwer','0123456789','Guangzhou');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('1','cartoon1','80','/image/girl/cartoon/cartoon1.jpg','1','4','45');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('2','downjacket1','120','/image/woman/downjacket/downjacket1.jpg','2','1','1');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('3','jacket1','100','/image/woman/jacket/jacket1.jpg','3','1','2');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('4','sweater1','80','/image/woman/sweater/sweater1.jpg','4','1','3');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('5','sweatershirt1','90','/image/woman/sweatershirt/sweatershirt1.jpg','5','1','4');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('6','shirt','100','/image/woman/shirt/shirt1.jpg','6','1','5');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('7','T-shirt1','70','/image/woman/T-shirt/T-shirt1.jpg','7','1','6');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('8','suit1','200','/image/woman/suit/suit1.jpg','8','1','7');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('9','dress1','95','/image/woman/dress/dress1.jpg','9','1','8');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('10','skirt1','150','/image/woman/skirt/skirt1.jpg','1','1','9');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('11','shortsleeve1','60','/image/woman/shortsleeve/shortsleeve1.jpg','2','1','10');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('12','shorts1','40','/image/woman/shorts/shorts1.jpg','3','1','11');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('13','trousers1','85','/image/woman/trousers/trousers1.jpg','4','1','12');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('14','sportswear1','125','/image/woman/sportswear/sportswear1.jpg','5','1','13');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('15','pajamas1','180','/image/woman/pajamas/pajamas1.jpg','6','1','14');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('16','downjacket1','300','/image/man/downjacket/downjacket1.jpg','7','2','15');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('17','jacket1','150','/image/man/jacket/jacket1.jpg','8','2','16');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('18','sweater1','110','/image/man/sweater/sweater1.jpg','9','2','17');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('19','sweatershirt1','120','/image/man/sweatershirt/sweatershirt1.jpg','1','2','18');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('20','leisureshirt1','120','/image/man/leisureshirt/leisureshirt1.jpg','2','2','19');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('21','businessshirt1','150','/image/man/businessshirt/businessshirt1.jpg','2','2','20');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('22','T-shirt1','70','/image/man/T-shirt/T-shirt1.jpg','3','2','21');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('23','shortsleeve1','100','/image/man/shortsleeve/shortsleeve1.jpg','3','2','22');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('24','suit1','210','/image/man/suit/suit1.jpg','4','2','23');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('25','sportswear1','210','/image/man/sportswear/sportswear1.jpg','5','2','24');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('26','shorts1','45','/image/man/shorts/shorts1.jpg','6','2','25');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('27','trousers1','90','/image/man/trousers/trousers1.jpg','7','2','26');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('28','pajamas1','140','/image/man/pajamas/pajamas1.jpg','8','2','27');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('29','coat1','89','/image/boy/coat/coat1.jpg','9','3','28');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('30','Autumn&wintersweater1','129','/image/boy/Autumn&wintersweater/Autumn&wintersweater1.jpg','1','3','29');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('31','sweater1','69','/image/boy/sweater/sweater1.jpg','2','3','30');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('32','shirt1','89','/image/boy/shirt/shirt1.jpg','3','3','31');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('33','T-shirt1','79','/image/boy/T-shirt/T-shirt1.jpg','4','3','32');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('34','shortsleeve1','59','/image/boy/shortsleeve/shortsleeve1.jpg','5','3','33');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('35','suit1','99','/image/boy/suit/suit1.jpg','6','3','34');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('36','pants1','79','/image/boy/pant/pants1.jpg','7','3','35');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('37','cartoon1','69','/image/boy/cartoon/cartoon1.jpg','8','3','36');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('38','coat1','75','/image/boy/coat/coat1.jpg','9','4','37');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('39','Autumn&wintersweater1','119','/image/girl/Autumn&wintersweater/Autumn&wintersweater1.jpg','1','4','38');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('40','sweater1','99','/image/girl/sweater/sweater1.jpg','2','4','39');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('41','shirt1','69','/image/girl/shirt/shirt1.jpg','3','4','40');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('42','T-shirt1','49','/image/girl/T-shirt/T-shirt1.jpg','4','4','41');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('43','shortsleeve1','65','/image/girl/shortsleeve/shortsleeve1.jpg','5','4','42');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('44','frocks1','89','/image/girl/frocks/frocks1.jpg','6','4','43');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('45','pants1','72','/image/girl/pants/pants1.jpg','7','4','44');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('46','businessshirt2','160','/image/man/businessshirt/businessshirt2.jpg','8','2','20');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('47','downjacket2','400','/image/man/downjacket/downjacket2.jpg','9','2','15');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('48','downjacket3','500','/image/man/downjacket/downjacket3.jpg','1','2','15');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('49','jacket2','180','/image/man/jacket/jacket2.jpg','2','2','16');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('50','jacket3','200','/image/man/jacket/jacket3.jpg','3','2','16');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('51','leisureshirt2','150','/image/man/leisureshirt/leisureshirt2.jpg','4','2','19');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('52','leisureshirt3','160','/image/man/leisureshirt/leisureshirt3.jpg','5','2','19');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('53','pajamas2','100','/image/man/pajamas/pajamas2.jpg','6','2','27');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('54','pajamas3','110','/image/man/pajamas/pajamas3.jpg','7','2','27');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('55','shorts2','50','/image/man/shorts/shorts2.jpg','8','2','25');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('56','shorts3','60','/image/man/shorts/shorts3.jpg','9','2','25');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('57','shortsleeve2','105','/image/man/shortsleeve/shortsleeve2.jpg','1','2','22');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('58','shortsleeve3','115','/image/man/shortsleeve/shortsleeve3.jpg','2','2','22');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('59','sportswear2','200','/image/man/sportswear/sportswear2.jpg','3','2','24');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('60','sportswear3','195','/image/man/sportswear/sportswear3.jpg','4','2','24');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('61','suit2','210','/image/man/suit/suit2.jpg','5','2','23');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('62','sweater2','115','/image/man/sweater/sweater2.jpg','6','2','17');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('63','sweater3','125','/image/man/sweater/sweater3.jpg','7','2','17');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('64','sweatershirt2','120','/image/man/sweatershirt/sweatershirt2.jpg','8','2','18');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('65','sweatershirt3','125','/image/man/sweatershirt/sweatershirt3.jpg','8','2','18');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('66','sweatershirt4','130','/image/man/sweatershirt/sweatershirt4.jpg','9','2','18');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('67','trousers2','95','/image/man/trousers/trousers2.jpg','1','2','26');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('68','trousers3','100','/image/man/trousers/trousers3.jpg','2','2','26');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('69','trousers4','90','/image/man/trousers/trousers4.jpg','3','2','26');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('70','T-shirt2','80','/image/man/T-shirt/T-shirt2.jpg','4','2','21');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('71','T-shirt3','80','/image/man/T-shirt/T-shirt3.jpg','5','2','21');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('72','Autumn&wintersweater2','139','/image/boy/Autumn&wintersweater/Autumn&wintersweater2.jpg','6','3','29');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('73','cartoon2','79','/image/boy/cartoon/cartoon2.jpg','7','3','36');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('74','cartoon3','85','/image/boy/cartoon/cartoon3.jpg','8','3','36');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('75','coat2','95','/image/boy/coat/coat2.jpg','9','3','28');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('76','pants2','89','/image/boy/pant/pants2.jpg','1','3','35');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('77','shirt2','99','/image/boy/shirt/shirt2.jpg','2','3','31');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('78','shortsleeve2','69','/image/boy/shortsleeve/shortsleeve2.jpg','3','3','33');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('79','shortsleeve3','75','/image/boy/shortsleeve/shortsleeve3.jpg','4','3','33');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('80','suit2','109','/image/boy/suit/suit2.jpg','5','3','34');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('81','T-shirt2','89','/image/boy/T-shirt/T-shirt2.jpg','6','3','32');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('82','T-shirt3','99','/image/boy/T-shirt/T-shirt3.jpg','7','3','32');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('83','T-shirt4','90','/image/boy/T-shirt/T-shirt4.jpg','8','3','32');
insert into item (item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values ('84','T-shirt5','109','/image/boy/T-shirt/T-shirt5.jpg','9','3','32');