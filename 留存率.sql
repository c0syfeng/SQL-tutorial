DROP TABLE if exists SQL_11_REG;
CREATE TABLE SQL_11_REG(
    uid INT AUTO_INCREMENT PRIMARY KEY,
    register_time DATETIME NOT NULL
);
insert into SQL_11_REG(register_time) values ('2020-01-01 00:01:00');
insert into SQL_11_REG(register_time) values ('2020-01-01 00:01:00');
insert into SQL_11_REG(register_time) values ('2020-01-01 00:01:00');
insert into SQL_11_REG(register_time) values ('2020-01-01 00:01:00');
insert into SQL_11_REG(register_time) values ('2020-01-02 00:01:00');
insert into SQL_11_REG(register_time) values ('2020-01-02 00:01:00');
insert into SQL_11_REG(register_time) values ('2020-01-02 00:01:00');
insert into SQL_11_REG(register_time) values ('2020-01-03 00:01:00');
insert into SQL_11_REG(register_time) values ('2020-01-03 00:01:00');
insert into SQL_11_REG(register_time) values ('2020-01-03 00:01:00');
insert into SQL_11_REG(register_time) values ('2020-01-03 00:01:00');
insert into SQL_11_REG(register_time) values ('2020-01-03 00:01:00');
select * from SQL_11_REG;

DROP TABLE if exists SQL_11_LOGIN;
CREATE TABLE SQL_11_LOGIN(
     id INT AUTO_INCREMENT PRIMARY KEY,
     uid INT NOT NULL,
     login_time DATETIME NOT NULL
);
insert into SQL_11_LOGIN(uid, login_time) values (1, '2020-01-02 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (2, '2020-01-02 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (3, '2020-01-02 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (1, '2020-01-03 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (3, '2020-01-03 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (4, '2020-01-03 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (6, '2020-01-03 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (2, '2020-01-04 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (3, '2020-01-04 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (5, '2020-01-04 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (6, '2020-01-04 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (7, '2020-01-04 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (9, '2020-01-04 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (1, '2020-01-05 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (6, '2020-01-05 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (7, '2020-01-05 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (9, '2020-01-05 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (10, '2020-01-05 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (11, '2020-01-05 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (4, '2020-01-06 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (11, '2020-01-06 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (12, '2020-01-06 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (1, '2020-01-07 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (2, '2020-01-07 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (6, '2020-01-07 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (8, '2020-01-07 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (9, '2020-01-07 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (2, '2020-01-08 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (10, '2020-01-08 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (12, '2020-01-08 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (3, '2020-01-09 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (8, '2020-01-09 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (9, '2020-01-09 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (11, '2020-01-09 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (4, '2020-01-10 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (6, '2020-01-10 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (7, '2020-01-10 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (9, '2020-01-10 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (10, '2020-01-10 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (12, '2020-01-10 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (6, '2020-01-11 00:02:00');
insert into SQL_11_LOGIN(uid, login_time) values (12, '2020-01-11 00:02:00');
select * from SQL_11_LOGIN;


留存率可以评用户对产品的粘性，留存率越低表明用户对产品粘性越小

留存率通常分为次日留存率、3日留存率、7日留存率、30日留存率

这里以新增用户留存率为例：

> **次日留存率：**基准日之后的第1天留存的用户数）/基准日当天新增用户数；
> **第3日留存率：**基准日之后的第3天留存的用户数）/基准日当天新增用户数；
> **第7日留存率：**基准日之后的第7天留存的用户数）/基准日当天新增用户数；
> **第30日留存率：**基准日之后的第30天留存的用户数）/基准日当天新增用户数；
>
> 留存率=各日留存用户数/基准日新增用户数

#### 问题一
计算1月2日的次日留存率

SELECT concat(count(l.uid)/count(r.uid)*100,'%') as 次日留存率
      from SQL_11_REG r
      LEFT JOIN SQL_11_LOGIN l 
			ON l.uid=r.uid and date(l.login_time) = date(r.register_time) + interval '1' DAY#在原来的datetime加一天
			where date(r.register_time) = '2020-01-02';

SELECT concat(count(l.uid)/count(r.uid)*100,'%') as 次日留存率
      from SQL_11_REG r
      LEFT JOIN SQL_11_LOGIN l 
			ON l.uid=r.uid and date_sub(date(l.login_time),interval '1' day) = date(r.register_time)#在原来的datetime加一天
			where date(r.register_time) = '2020-01-02';

SELECT concat(count(l.uid)/count(r.uid)*100,'%') as 次日留存率
      from SQL_11_REG r
      LEFT JOIN SQL_11_LOGIN l 
			ON l.uid=r.uid and datediff(date(l.login_time),date(r.register_time)) = 1#在原来的datetime加一天
			where date(r.register_time) = '2020-01-02';
'summary':
1.interval的用法
2.对于日期的条件筛选，需要加上date('') 很重要！
3.日期间隔的多种表示方法：

-- date1 = date2 + interval N unit
'date(l.login_time) = date(r.register_time) + INTERVAL '1' DAY'

-- date_sub/date_add
'date_sub(date(l.login_time) ,INTERVAL '1' DAY) = date(r.register_time)'

-- datediff
'datediff(date(l.login_time),date(r.register_time)) = 1'

##问题二
计算所有注册日的次日留存率

SELECT date(r.register_time) as 注册日期,count(l.uid)/count(r.uid)
       FROM SQL_11_REG r 
			 left join SQL_11_LOGIN l 
			 on r.uid = l.uid and date(l.login_time) = date(r.register_time) + interval '1' day
			 GROUP BY date(r.register_time)
'注意，所select的信息必须包含分组的标准'
##问题三
计算所有注册日的次日留存率，3日留存率，7日留存率
SELECT date(r.register_time) as 注册日期,
       count(t1.uid)/count(r.uid) as r1,
			 count(t2.uid)/count(r.uid) as r2,
			 count(t3.uid)/count(r.uid) as r3
       FROM SQL_11_REG r 
			 left join(
			 SELECT * from SQL_11_LOGIN
			 )t1
			 ON t1.uid = r.uid and date(t1.login_time) = date(r.register_time) + interval '1' day
			 left join(
			 SELECT * from SQL_11_LOGIN
			 )t2
			 ON r.uid = t2.uid and date(t2.login_time) = date(r.register_time) + interval '3' day
			 left join(
			 SELECT * from SQL_11_LOGIN
			 )t3
			 ON r.uid = t3.uid and date(t3.login_time) = date(r.register_time) + interval '7' day
			 GROUP BY date(r.register_time)
'优化，减少join的次数'
with t1 as (
    SELECT r.uid id,  date(r.register_time) reg_date, date(l.login_time) login_date, datediff(date(l.login_time),date(r.register_time)) diff
    FROM SQL_11_REG r LEFT JOIN SQL_11_LOGIN l
                 ON l.uid = r.uid AND date(l.login_time) BETWEEN date(r.register_time) + INTERVAL '1' DAY AND date(r.register_time) + INTERVAL '7' DAY
)
select reg_date,
       COUNT(DISTINCT CASE WHEN diff=1 THEN id END)/COUNT(DISTINCT id) rr1,
       COUNT(DISTINCT CASE WHEN diff=3 THEN id END)/COUNT(DISTINCT id) rr3,
       COUNT(DISTINCT CASE WHEN diff=7 THEN id END)/COUNT(DISTINCT id) rr7
from t1 group by reg_date;
'思路：
 1.先计算每个logintime与registertime的差，并且指定时间范围是未来1天到未来7天
 2.利用CASE条件筛选'
 
 #### 公式

with 临时表 as (
    SELECT a.id id, a.基准时间 , b.留存时间, datediff(b.留存时间,a.基准时间) '留存间隔'
    FROM 基准表 a LEFT JOIN 留存表 b
        ON b.关联id = a.id AND b.留存时间 BETWEEN a.基准时间 + INTERVAL '1' DAY AND a.基准时间 + INTERVAL '7' DAY
    )
select 基准时间,
       COUNT(DISTINCT CASE WHEN 留存间隔=1 THEN id END)/COUNT(DISTINCT id) rr1,
       COUNT(DISTINCT CASE WHEN 留存间隔=3 THEN id END)/COUNT(DISTINCT id) rr3,
       COUNT(DISTINCT CASE WHEN 留存间隔=7 THEN id END)/COUNT(DISTINCT id) rr7
       ...
from 临时表 group by 基准时间

············································

DROP TABLE if exists SQL_12;
CREATE TABLE SQL_12(
   user_id INT ,
   login_time DATETIME NOT NULL
);
insert into SQL_12(user_id,login_time) values (1001,'2021-01-01 00:01:00');
insert into SQL_12(user_id,login_time) values (1002,'2021-01-01 00:01:00');
insert into SQL_12(user_id,login_time) values (1003,'2021-01-01 00:01:00');
insert into SQL_12(user_id,login_time) values (1001,'2021-01-02 00:01:00');
insert into SQL_12(user_id,login_time) values (1002,'2021-01-02 00:01:00');
insert into SQL_12(user_id,login_time) values (1003,'2021-01-03 00:01:00');
insert into SQL_12(user_id,login_time) values (1004,'2021-01-03 00:01:00');
insert into SQL_12(user_id,login_time) values (1005,'2021-01-03 00:01:00');
insert into SQL_12(user_id,login_time) values (1002,'2021-01-04 00:01:00');
insert into SQL_12(user_id,login_time) values (1004,'2021-01-04 00:01:00');
insert into SQL_12(user_id,login_time) values (1005,'2021-01-04 00:01:00');
insert into SQL_12(user_id,login_time) values (1006,'2021-01-04 00:01:00');
insert into SQL_12(user_id,login_time) values (1007,'2021-01-04 00:01:00');
insert into SQL_12(user_id,login_time) values (1008,'2021-01-04 00:01:00');
insert into SQL_12(user_id,login_time) values (1001,'2021-01-05 00:01:00');
insert into SQL_12(user_id,login_time) values (1002,'2021-01-05 00:01:00');
insert into SQL_12(user_id,login_time) values (1004,'2021-01-05 00:01:00');
insert into SQL_12(user_id,login_time) values (1005,'2021-01-05 00:01:00');
insert into SQL_12(user_id,login_time) values (1006,'2021-01-05 00:01:00');
insert into SQL_12(user_id,login_time) values (1002,'2021-01-06 00:01:00');
insert into SQL_12(user_id,login_time) values (1003,'2021-01-06 00:01:00');
insert into SQL_12(user_id,login_time) values (1005,'2021-01-06 00:01:00');
insert into SQL_12(user_id,login_time) values (1006,'2021-01-06 00:01:00');
insert into SQL_12(user_id,login_time) values (1001,'2021-01-07 00:01:00');
insert into SQL_12(user_id,login_time) values (1003,'2021-01-07 00:01:00');
insert into SQL_12(user_id,login_time) values (1006,'2021-01-07 00:01:00');
insert into SQL_12(user_id,login_time) values (1007,'2021-01-07 00:01:00');

select * from SQL_12;

计算次日留存率，3日留存率（以首次登陆时间为基准

with t1 as(
select * ,min(login_time) over(partition by user_id ORDER BY login_time) as firstlog from SQL_12),
t2 as (
select user_id id , firstlog,datediff(date(login_time),date(firstlog)) diff from t1
       where login_time between date(firstlog)+interval '1' day and date(firstlog)+interval '3' day)
select date(firstlog),
			count(distinct case when diff=1 then id  end)/count(DISTINCT id) rr1,##对于这种直接end的情况，不需要else
			count(distinct case when diff=3 then id  end)/count(distinct id) rr3
			from t2 
			group by date(firstlog)
			
			
			
with reg as (
    select user_id, min(date(login_time)) reg_date from SQL_12 group by user_id
),
login as (
    select user_id, date(login_time) login_date from SQL_12
),
t1 as (
    SELECT a.user_id id,  a.reg_date 'reg_date', b.login_date 'login_date', 
    datediff(b.login_date, a.reg_date) 'diff'
    FROM reg a LEFT JOIN login b
    ON b.user_id = a.user_id AND b.login_date BETWEEN a.reg_date + INTERVAL '1' DAY AND a.reg_date + INTERVAL '3' DAY
)
select reg_date,
       COUNT(DISTINCT CASE WHEN diff=1 THEN id END)/COUNT(DISTINCT id) rr1,
       COUNT(DISTINCT CASE WHEN diff=3 THEN id END)/COUNT(DISTINCT id) rr3
from t1 group by reg_date;
