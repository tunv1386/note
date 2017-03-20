A= Load '${input}'  using PigStorage('\t');
B= Limit A 10;
DUMP B;

-- /ge/warehouse/ica/login/2016-09-26