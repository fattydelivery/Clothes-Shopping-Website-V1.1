/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bestselltop;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.TreeMap;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.util.GenericOptionsParser;

public class BestSellTop {

    static class MapDistinctTask extends Mapper<LongWritable, Text, Text, Text> {

        @Override
        protected void map(LongWritable key, Text value, Context context)
                throws IOException, InterruptedException {
            String[] ss = value.toString().split(",");
            // 3 action_id    6 item_id 7 store_id
            if ("buy".equals(ss[3])) { // buy
                context.write(new Text("1"), new Text(ss[1]));
            }
        }
    }

    static class ReduceDistinctTask extends Reducer<Text, Text, Text, Text> {

        TreeMap<Integer, String> tree = new TreeMap<Integer, String>();

        @Override
        protected void cleanup(Context context) throws IOException, InterruptedException {
            
        }

        @Override
        protected void reduce(Text key, Iterable<Text> values, Context context)
                throws IOException, InterruptedException {
            int sum = 0;
            // tree.clear();
            List<String> s = new ArrayList();
            for (Text val : values) {
                String ss = val.toString();
                s.add(ss);
//                context.write(new Text("???"), new Text(ss));
            }
            Collections.sort(s);
            for (int i = 0; i < s.size(); i++) {
                int j = i + 1;
                for (; j < s.size() && s.get(j).equals(s.get(i)); j++) ;
                if(j-i==2) context.write(new Text(Integer.toString(j - i)), new Text(s.get(i)));
                tree.put(j - i, s.get(i));
//                if (tree.size() > 5) {
//                    tree.remove(tree.firstKey());
//                }
                i = j - 1;
            }
//            Iterator<Integer> it1 = tree.keySet().iterator();
//            while (it1.hasNext()) {
//                Integer kk = it1.next();
//                String vv = tree.get(kk);
//                context.write(new Text(vv), new Text(kk.toString()));
//            }
        }
    }

    public static void main(String[] args) throws IOException, InterruptedException, ClassNotFoundException {
        // TODO Auto-generated method stub
        Configuration conf = new Configuration();
        Job job = null;
        String[] otherArgs = null;
        otherArgs = new GenericOptionsParser(conf, args).getRemainingArgs();
        if (otherArgs.length != 2) {
            System.err.println("Usage: Jarname <in> <out>");
            System.exit(2);
        }
        job = Job.getInstance();

        job.setJobName("BestSellTop");
        job.setJarByClass(BestSellTop.class);
        job.setMapperClass(MapDistinctTask.class);
        job.setReducerClass(ReduceDistinctTask.class);
        job.setMapOutputKeyClass(Text.class);
        job.setMapOutputValueClass(Text.class);
        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(Text.class);
        FileInputFormat.addInputPath(job, new Path(otherArgs[0]));
        FileOutputFormat.setOutputPath(job, new Path(otherArgs[1]));
        System.exit(job.waitForCompletion(true) ? 0 : 1);
    }
}
