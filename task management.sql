create table tasks (tasks varchar2(50) not null,
	task_manager_name varchar2(50) not null,
	dead_line date not null,
  completed date,
  task_status varchar2(20));
  
 insert into tasks(tasks,by,dead_line,completed) values ('Install Oracle','Ramola',to_date('24/12/2019','dd/MM/yyyy'),to_date('1/1/2020','dd/MM/yyyy') ;
 
 update tasks set task_status=completed where completed!=null;
 
 select * from tasks;
