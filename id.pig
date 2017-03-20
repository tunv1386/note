A = load 'hdfs://hadoop-master:54310/user/hadoop/vantu/vantu.txt' using PigStorage(':'); 
B = foreach A generate $0 as id; 
dump B; 
store B into 'hdfs://hadoop-master:54310/user/hadoop/vantu/vantu_output' using PigStorage(';');