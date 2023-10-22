DROP TABLE if exists SQL_13;
CREATE TABLE SQL_13(
   user_id INT,
   live_id INT,
   in_time DATETIME NOT NULL,
   out_time DATETIME NOT NULL
);
insert into SQL_13(user_id,live_id,in_time,out_time)
values (0001,1,'2023-01-01 10:00:00','2023-01-01 11:00:00');
insert into SQL_13(user_id,live_id,in_time,out_time)
values (0002,2,'2023-01-01 15:00:00','2023-01-01 16:30:00');
insert into SQL_13(user_id,live_id,in_time,out_time)
values (0003,1,'2023-01-01 10:20:00','2023-01-01 10:30:00');
insert into SQL_13(user_id,live_id,in_time,out_time)
values (0004,1,'2023-01-01 09:20:00','2023-01-01 11:30:00');
insert into SQL_13(user_id,live_id,in_time,out_time)
values (0005,2,'2023-01-01 11:20:00','2023-01-01 14:30:00');
insert into SQL_13(user_id,live_id,in_time,out_time)
values (0006,2,'2023-01-01 12:20:00','2023-01-01 15:30:00');
insert into SQL_13(user_id,live_id,in_time,out_time)
values (0007,1,'2023-01-01 08:20:00','2023-01-01 09:30:00');
insert into SQL_13(user_id,live_id,in_time,out_time)
values (0008,2,'2023-01-01 08:20:00','2023-01-01 12:30:00');
insert into SQL_13(user_id,live_id,in_time,out_time)
values (0009,1,'2023-01-01 15:20:00','2023-01-01 19:30:00');
insert into SQL_13(user_id,live_id,in_time,out_time)
values (0010,2,'2023-01-01 09:20:00','2023-01-01 13:30:00');
select * from SQL_13;

计算每个直播间最大在线人数
求各场直播的最大在线人数。

| 直播间 | 最大在线人数 |
| ------ | ------------ |
| ？     | ？           |



with t1 as(
    SELECT live_id,user_id,in_time dt,1 AS cnt FROM SQL_13
    UNION ALL
    SELECT live_id,user_id,out_time dt,-1 AS cnt FROM SQL_13
		),
		t2 as(
    SELECT live_id,dt,sum(cnt) over(partition by live_id ORDER BY dt ) as people 
		from t1)
		SELECT DISTINCT live_id as 直播间,max(people) over(PARTITION by live_id) as 直播间最大人数  from t2 

with t1 as(
    SELECT live_id,user_id,in_time dt,1 AS cnt FROM SQL_13
    UNION ALL
    SELECT live_id,user_id,out_time dt,-1 AS cnt FROM SQL_13
		),
		t2 as(
    SELECT live_id,dt,sum(cnt) over(partition by live_id ORDER BY dt ) as people 
		from t1)
		SELECT  live_id as 直播间,max(people) 直播间最大人数  from t2 GROUP BY live_id