/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package combinesoldtop;

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

public class CombineSoldTop {

    static class MapDistinctTask extends Mapper<LongWritable, Text, Text, Text> {

        @Override
        protected void map(LongWritable key, Text value, Context context)
                throws IOException, InterruptedException {
            String[] s = value.toString().split(",");
            if ("1".equals(s[3])) { // buy
                context.write(new Text(s[1]), new Text(s[6]));
            }
        }
    }

    static class ReduceDistinctTask extends Reducer<Text, Text, Text, Text> {

        TreeMap<Integer, String> tree = new TreeMap<Integer, String>();
        
        @Override
        protected void cleanup(Context context) throws IOException, InterruptedException{
            Iterator<Integer> it1 = tree.keySet().iterator();
            while (it1.hasNext()) {
                Integer kk = it1.next();
                String vv = tree.get(kk);
                context.write(new Text(vv), new Text(kk.toString()));
            }
        }
        
        @Override
        protected void reduce(Text key, Iterable<Text> values, Context context)
                throws IOException, InterruptedException {
            List<String> ls = new ArrayList();
            List<String> res = new ArrayList();
            // tree.clear();
            for (Text t : values) {
                ls.add(t.toString());
            }
            int tot = ls.size();
            for (int i = 0; i < tot; i++) {
                for (int j = i + 1; j < tot; j++) {
                    String ss = ls.get(i) + "+" + ls.get(j);
                    if (ls.get(i).compareTo(ls.get(j)) > 0) {
                        ss = ls.get(j) + "+" + ls.get(i);
                    }
                    res.add(ss);
                }
            }
            Collections.sort(ls);
            for (int i = 0; i < res.size(); i++) {
                int j;
                for (j = i; j < res.size() && res.get(i).equals(res.get(j)); j++) ;
                tree.put(j - i + 1, res.get(i));
                if (tree.size() > 5) {
                    tree.remove(tree.firstKey());
                } i=j-1;
            }
        }
    }

    public static void main(String[] args) throws IOException, InterruptedException, ClassNotFoundException {
        // TODO Auto-generated method stub
        Configuration conf = new Configuration();
        Job job = null;
        String[] otherArgs = null;
        otherArgs = new GenericOptionsParser(conf, args).getRemainingArgs();
        if (otherArgs.length != 2) {
            System.err.println("Usage: wordcount <in> <out>");
            System.exit(2);
        }
        job = Job.getInstance();

        job.setJobName("CombineSoldTop");
        job.setJarByClass(CombineSoldTop.class);
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
