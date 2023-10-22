CREATE TABLE SQL_5 (
       cid varchar(4),
       sname varchar(4),
       score int
);
insert into SQL_5 (cid, sname, score) values ('001', '张三', 78);
insert into SQL_5 (cid, sname, score) values ('001', '李四', 82);
insert into SQL_5 (cid, sname, score) values ('002', '小明', 90);
insert into SQL_5 (cid, sname, score) values ('001', '王五', 67);
insert into SQL_5 (cid, sname, score) values ('002', '小红', 85);
insert into SQL_5 (cid, sname, score) values ('002', '小刚', 62);
SELECT * FROM SQL_5
select *, sum(score) over (partition by cid order by score rows between unbounded preceding and unbounded following) as '班级总分' from SQL_5;

#### 分组子句(partition by)

不分组可以写成partition by null或者直接不写

后面可以跟多个列， 如 partition by cid, sname

**注意 partition by与group by的区别**

1）前者不会压缩行数但是后者会

2）后者只能选取分组的列和聚合的列

也就是说group by 后生成的结果集与原表的行数和列数都不同

#### 排序子句(order by)

不排序可以写成order by null 或者直接不写

asc或不写表示升序，desc表示降序

后面可以跟多个列， 如 order by cid, sname

#### 窗口子句(rows)

窗口子句的描述

1) 起始行:   N preceding/unbounded preceding

2) 当前行:   current row

3) 终止行:   N following/unbounded following

举例：

rows between unbounded  preceding and current row  从之前所有的行到当前行

rows between 2 preceding and current row  从前面两行到当前行

rows between current row and unbounded following  从当前行到之后所有的行

rows between current row and 1following  从当前行到后面一行

**注意：**

**排序子句后面缺少窗口子句，窗口规范默认是 rows between unbounded preceding and current row**

**排序子句和窗口子句都缺失，窗口规范默认是 rows between unbounded preceding and unbounded following**

#### 总体流程

1） 通过partition by 和 order by 子句确定大窗口（ 定义出上界unbounded preceding和下界unbounded following）

2） 通过row 子句针对每一行数据确定小窗口（滑动窗口）

3） 对每行的小窗口内的数据执行函数并生成新的列

-- 按班级分组后打上序号 不考虑并列
select *, row_number() over (partition by cid order by score desc) as '不可并列排名' from SQL_5;

-- 按班级分组后作跳跃排名 考虑并列
select *, rank() over (partition by cid order by score desc) as '跳跃可并列排名' from SQL_5;

-- 按班级分组后作连续排名 考虑并列
select *, dense_rank() over (partition by cid order by score desc) as '连续可并列排名' from SQL_5;

-- 合并起来对比
select *, row_number() over (partition by cid order by score desc) as '不可并列排名' ,
          rank() over (partition by cid order by score desc) as '跳跃可并列排名',
          dense_rank() over (partition by cid order by score desc) as '连续可并列排名'
from SQL_5;

-- 【聚合类】
-- 让同一班级每个学生都知道班级总分是多少
select *, sum(score) over (partition by cid ) as '班级总分' from SQL_5;
-- 或者可以写成
select *, sum(score) over (partition by cid rows between unbounded preceding and unbounded following) as '班级总分' from SQL_5;

-- 计算同一班级，每个同学和比他分数低的同学的累计总分是多少
select *, sum(score) over (partition by cid order by score ) '累加分数' from SQL_5;
-- 或者可以写成 其中rows between ... and 是规定窗口大小
select *, sum(score) over (partition by cid order by score rows between unbounded preceding and current row) as '累加分数' from SQL_5;

#### 跨行类

-- 【跨行类】
-- lag/lead 函数 参数1:比较的列 参数2: 偏移量 参数3:找不到的默认值

--同一班级内，成绩比自己低一名的分数是多少
select *, lag(score, 1) over (partition by cid order by score ) as '低一名的分数' from SQL_5;
-- 或者写成
select *, lag(score, 1, 0) over (partition by cid order by score) as '低一名的分数' from SQL_5;

-- 同一班级内，成绩比自己高2名的分数是多少
select *, lead(score, 2) over (partition by cid order by score) as '高两名的分数' from SQL_5;


CREATE TABLE SQL_6 (
       cid varchar(4),
       sname varchar(4),
       course varchar(10),
       score int
);

insert into SQL_6 (cid, sname, course, score) values ('001', '张三', '语文', 78);
insert into SQL_6 (cid, sname, course, score) values ('002', '小刚', '语文', 71);
insert into SQL_6 (cid, sname, course, score) values ('001', '李四', '数学', 56);
insert into SQL_6 (cid, sname, course, score) values ('001', '王五', '数学', 97);
insert into SQL_6 (cid, sname, course, score) values ('002', '小明', '数学', 54);
insert into SQL_6 (cid, sname, course, score) values ('002', '小刚', '数学', 67);
insert into SQL_6 (cid, sname, course, score) values ('002', '小红', '数学', 82);
insert into SQL_6 (cid, sname, course, score) values ('001', '王五', '语文', 80);
insert into SQL_6 (cid, sname, course, score) values ('001', '张三', '数学', 77);
insert into SQL_6 (cid, sname, course, score) values ('002', '小明', '语文', 58);
insert into SQL_6 (cid, sname, course, score) values ('002', '小红', '语文', 87);
insert into SQL_6 (cid, sname, course, score) values ('001', '李四', '语文', 60);
insert into SQL_6 (cid, sname, course, score) values ('001', '张三', '英语', 66);
insert into SQL_6 (cid, sname, course, score) values ('002', '小刚', '英语', 50);
insert into SQL_6 (cid, sname, course, score) values ('001', '李四', '地理', 59);
insert into SQL_6 (cid, sname, course, score) values ('001', '王五', '地理', 88);
insert into SQL_6 (cid, sname, course, score) values ('002', '小明', '地理', 45);
insert into SQL_6 (cid, sname, course, score) values ('002', '小刚', '地理', 66);
insert into SQL_6 (cid, sname, course, score) values ('002', '小红', '地理', 82);
insert into SQL_6 (cid, sname, course, score) values ('001', '王五', '英语', 81);
insert into SQL_6 (cid, sname, course, score) values ('001', '张三', '地理', 77);
insert into SQL_6 (cid, sname, course, score) values ('002', '小明', '英语', 55);
insert into SQL_6 (cid, sname, course, score) values ('002', '小红', '英语', 87);
insert into SQL_6 (cid, sname, course, score) values ('001', '李四', '英语', 61);

SELECT * FROM  SQL_6;

问题1：求出每个学生成绩最高的三条记录

SELECT *,ROW_NUMBER() over(partition by sname ORDER BY score DESC ) from SQL_6;'row_number()没想到'

select * from 
(
    select *, row_number() over (partition by sname order by score desc) as rn from SQL_6   
) temp
where rn <= 3

问题2：找出每门课程都高于班级课程平均分的学生
'over 函数与where 不可以在一句的使用 ，可以使用子查询'
SELECT * from(
with t1 as (
SELECT *,round(avg(score) over(PARTITION by cid),2) as avg 
FROM SQL_6
),
t2 as(
SELECT * from t1 where score > avg 
)
SELECT distinct sname,count(score) over(partition by sname) as co 
from t2 ) tamp
where co = 4 ;

'多层镶套'
select sname from (
                      select *,
                             score - avg  as 'del'
                      from (
                               select *,
                                      avg(score) over (partition by cid, course) as 'avg'
                               from SQL_6
                           ) t1
                  ) t2
group by sname
having min(del) > 0;

CREATE TABLE SQL_7 (
       empno varchar(4),
       ename varchar(10),
       hire_date varchar(10),
       salary int,
       dept_no varchar(2)
);
insert into SQL_7 (empno, ename, hire_date, salary, dept_no) values ('001', 'Adam', '2018-03-01', 1000, 'A');
insert into SQL_7 (empno, ename, hire_date, salary, dept_no) values ('002', 'Bill', '2021-03-01', 1200, 'A');
insert into SQL_7 (empno, ename, hire_date, salary, dept_no) values ('003', 'Cindy', '2016-03-01', 1500, 'A');
insert into SQL_7 (empno, ename, hire_date, salary, dept_no) values ('004', 'Danny', '2020-03-01', 5000, 'A');
insert into SQL_7 (empno, ename, hire_date, salary, dept_no) values ('005', 'Eason', '2020-03-01', 4000, 'B');
insert into SQL_7 (empno, ename, hire_date, salary, dept_no) values ('006', 'Fred', '2018-03-01', 3500, 'B');
insert into SQL_7 (empno, ename, hire_date, salary, dept_no) values ('007', 'Gary', '2017-03-01', 1800, 'B');
insert into SQL_7 (empno, ename, hire_date, salary, dept_no) values ('008', 'Hugo', '2020-03-01', 4500, 'B');

select * from SQL_7;

问题一：求出每个部门工资最高的前三名员工


SELECT * from(

select * , ROW_NUMBER() over (partition by dept_no	ORDER BY salary DESC) as rk from SQL_7 
) as tamp
where rk <=3;

问题二：算这些员工的工资占所属部门总工资的百分比
with t1 as (
SELECT *, sum(salary) over(PARTITION by dept_no) as sum from SQL_7
)
select *, concat(round(salary/sum*100,2),'%') as 占比 from t1 

问题三：对各部门员工的工资进行从小到大排序，排名前30%为低层，30%-80%为中层，高于80%为高层，并打上标签

	with 
	t1 as (
	SELECT *, sum(salary) over(PARTITION by dept_no) as sum from SQL_7),
	t2 as(
	select *,concat(round(salary/sum*100,2),'%') as percent from t1 )
	SELECT * ,
							case when percent < 30 then '低层'
									 when percent BETWEEN 30 and 80 then '中层'
									 else '高层' 
									 end as label
	from t2;
'case 函数不需要括号；而且多个条件时判断完成再end'
WITH ranked_salaries AS (
    SELECT
        dept_no,
        salary,
        NTILE(100) OVER (PARTITION BY dept_no ORDER BY salary) AS salary_percentile '注意NTILE函数，计算percent'
    FROM SQL_7
)

SELECT
    dept_no,
    salary,
    CASE
        WHEN salary_percentile <= 30 THEN '低层'
        WHEN salary_percentile > 30 AND salary_percentile <= 80 THEN '中层'
        ELSE '高层'
    END AS label
FROM ranked_salaries;

with
    t1 as (
        select * , row_number() over (partition by dept_no order by salary) as cnt,
               count(empno) over (partition by dept_no) as 'sum' from SQL_7
    ),
    t2 as (
        select *, round(cnt/sum,2) as 'percentage' from t1
    ),
    t3 as (
        select *, case when percentage <= 0.3 then '低层'
                       when percentage <= 0.8 then '中层'
                       when percentage <= 1 then '高层' end as 'label'
        from t2
    )
select empno, ename, hire_date, salary, dept_no, label from t3;

问题4：统计每年入职总数以及截至本年累计入职总人数（本年总入职人数 + 本年之前所有年的总入职人数之和）
WITH
  t1 as (
	select * ,year(hire_date) as hyear FROM SQL_7),
	t2 as(
	select  DISTINCT hyear,count(empno) over(partition by hyear) as co from t1)
	SELECT  hyear,co,sum(co) over(rows between unbounded preceding and current row) as 累计入职总人数 from t2;


'注意year函数'
select year(hire_date) as hire_year, count(empno) as cnt 
    from SQL_7
    group by year(hire_date) order by hire_year;
		
WITH
    t1 as (select year(hire_date) as hire_year, count(empno) as cnt 
    from SQL_7
    group by year(hire_date) order by hire_year
		)
SELECT *,sum(cnt) over( rows BETWEEN unbounded preceding and current row) as sum from t1	

### 五. 技巧

1）分组内topN公式

```sql
select * from
(
	select *, row_number() over (partition by 分组列 order by 比较列) as rn from table
) as tmp
where rn <= N;
```

2） 窗口函数 -> 生成辅助列（相当于高级语言的临时变量)

3)   with 语句 -> 生成临时表（相当于高级语言的局部方法)

​       把复杂的问题拆分成多个子问题并用临时表去表达

CREATE TABLE SQL_8
(
     user_id 	varchar(2),
     login_date date
);
INSERT INTO SQL_8 (user_id,login_date)
VALUES ('A', '2022-09-02'), ('A', '2022-09-03'), ('A', '2022-09-04'), ('B', '2021-11-25'),
       ('B', '2021-12-31'), ('C', '2022-01-01'), ('C', '2022-04-04'), ('C', '2022-09-03'),
       ('C', '2022-09-05'), ('C', '2022-09-04'), ('A', '2022-09-03'), ('D', '2022-10-20'),
       ('D', '2022-10-21'), ('A', '2022-10-03'), ('D', '2022-10-22'), ('D', '2022-10-23'),
       ('B', '2022-01-04'), ('B', '2022-01-05'), ('B', '2022-11-16'), ('B', '2022-11-17');
			 
SELECT * FROM SQL_8
1.找出这张表中所有的连续3天登录用户

with t1 as (
    select distinct user_id, login_date from SQL_8
),
t2 as (
    select *, row_number() over (partition by user_id order by login_date) as rn from t1
),
t3 as (
    select *, DATE_SUB(login_date, interval rn day) as sub from t2 #DATE_SUB意思将日期减去rn ，如果连续的话刚好重合，直接使用distinct就可以得到最终结果
)
select distinct user_id from t3 group by user_id, sub having count(user_id) >= 3;

CREATE TABLE SQL_9
(
     player_id 	varchar(2),
     score      int,
     score_time datetime
);
INSERT INTO SQL_9 (player_id, score, score_time)
VALUES ('B3', 1, '2022-09-20 19:00:14'), ('A2', 1, '2022-09-20 19:01:04'),
       ('A2', 3, '2022-09-20 19:01:16'), ('A2', 3, '2022-09-20 19:02:05'),
       ('A2', 2, '2022-09-20 19:02:25'), ('B3', 2, '2022-09-20 19:02:54'),
       ('A4', 3, '2022-09-20 19:03:10'), ('B1', 2, '2022-09-20 19:03:34'),
       ('B1', 2, '2022-09-20 19:03:58'), ('B1', 3, '2022-09-20 19:04:07'),
       ('A2', 1, '2022-09-20 19:04:19'), ('B3', 2, '2022-09-20 19:04:31'),
       ('A1', 2, '2022-09-20 19:04:51'), ('A1', 2, '2022-09-20 19:05:01'),
       ('B4', 2, '2022-09-20 19:05:06'), ('A1', 2, '2022-09-20 19:05:26'),
       ('A1', 2, '2022-09-20 19:05:48'), ('B4', 2, '2022-09-20 19:05:58');
			 
问题；统计出连续三次（及以上）为球队得分的球员名单
'没想到使用lag/lead函数'
with t1 as (
    select *, lag(player_id, 1) over (order by score_time) as last_play_id,
           lag(player_id, 2) over (order by score_time) as last_two_play_id from SQL_9
)
select distinct player_id from t1 where player_id = last_play_id and last_play_id = last_two_play_id group by player_id;

CREATE TABLE SQL_10
(
     log_id  int
);
INSERT INTO SQL_10 (log_id) VALUES (1), (2), (3), (7), (8), (10);

SELECT * FROM SQL_10;

问题：编写SQL 查询得到 Logs 表中的连续区间的开始数字和结束数字。按照 start_id 排序。查询结果格式如下:

| start_id | end_id |
| -------- | ------ |
| 1        | 3      |
| 7        | 8      |
| 10       | 10     |

'想不到'
with t1 as (
    select *, log_id - row_number() over (order by log_id) as gr from SQL_10
)
select min(log_id) as start_id, max(log_id) as end_id from t1 group by gr

如何求连续区间？

1）行号过滤法

​      通过row_number() 生成连续行号，与区间列进行差值运算，得到的临时结果如果相同表示为同一连续区间

2） 错位比较法

​      通过row_number() / row_number()  + 1 分别生成原生的和错位的连续行号列，进行连表操作

​      也可以通过lag/lead函数直接生成错位列