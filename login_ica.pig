A= Load '/ge/warehouse/ica/login/2016-09-26'  using PigStorage('\t') as (LogTime:chararray,UserID:chararray,ServerID:chararray,RoleID:chararray,RoleName:chararray,GameClientVersion:chararray,OSPlatform:chararray,OSVersion:chararray,DeviceName:chararray,ConnectionType:chararray,Level:chararray,Exp:chararray,CoinBalance:chararray,CashCoinBalance:chararray,BonusCoinBalance:chararray,SessionID:chararray,Result:chararray,DeviceID:chararray,DownloadSource:chararray);
B= Load '/ge/warehouse/ica/login/2016-09-25'  using PigStorage('\t') as (LogTime:chararray,UserID:chararray,ServerID:chararray,RoleID:chararray,RoleName:chararray,GameClientVersion:chararray,OSPlatform:chararray,OSVersion:chararray,DeviceName:chararray,ConnectionType:chararray,Level:chararray,Exp:chararray,CoinBalance:chararray,CashCoinBalance:chararray,BonusCoinBalance:chararray,SessionID:chararray,Result:chararray,DeviceID:chararray,DownloadSource:chararray);
C= Union A,B;
D= Filter C By (LogTime matches '2016-09-26.*');
E= Group D By UserID;
F= FOREACH E{
    order_asc = ORDER D BY LogTime ASC;
    first_rec = LIMIT order_asc 1;
	GENERATE first_rec;
    -- as(LogTime,UserID,ServerID,RoleID,RoleName,GameClientVersion,OSPlatform,OSVersion,DeviceName,ConnectionType,Level,Exp,CoinBalance,CashCoinBalance,BonusCoinBalance,SessionID,Result,DeviceID,DownloadSource);
};
Result= Limit F 10;
DUMP Result;
