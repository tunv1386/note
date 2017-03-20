A = Load 'jxmpg1.test_login_orc' Using org.apache.hive.hcatalog.pig.HCatLoader();
B = LIMIT A 10;
DUMP B;