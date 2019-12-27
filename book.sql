create table books(book_id number,
            book_name varchar2(50) not null,
            author_name varchar2(50) not null,
            price number not null,
            publisher varchar2(50) not null,
            version number,
            book_category varchar2(50) not null,
            active number default 1,
            constraint book_id_pk primary key (book_id),
            constraint book_uq unique (book_name,author_name,version),
            constraint book_price check (price>=0));
            
create table orders(order_id number,
            user_name varchar2(50) not null,
            book_id number not null,
            ordered_date timestamp not null,
            delivered_date timestamp,
            total_amount number not null,
            quantity number default 1 not null,
            status varchar2(50) default 'ordered',
            comments varchar2(100), 
            constraint order_id_pk primary key(order_id),
            constraint book_id_fk foreign key(book_id) references books(book_id),
            constraint total_amount_ck check(total_amount>=0),
            constraint quantity_ck check (quantity>=1)
            );
            
insert into books (book_id,book_name,author_name,price,publisher,version,book_category,active) values (1,'Python','Dobby',900,'Erison',1,'Programming',0);
insert into books (book_id,book_name,author_name,price,publisher,version,book_category) values (2,'Python','Dobby',1900,'Erison',2,'Programming');
insert into books (book_id,book_name,author_name,price,publisher,version,book_category) values (3,'Grammer','Robbin',500,'pearson',1,'English');
insert into books (book_id,book_name,author_name,price,publisher,version,book_category) values (4,'Photosynthesis','Benny',800,'James',1,'Biology');

select* from books;

insert into orders(order_id,user_name,book_id,ordered_date,total_amount,quantity,status)values(101,'Rams',3,systimestamp,500,1,'pending');
insert into orders(order_id,user_name,book_id,ordered_date,total_amount,quantity)values(102,'Ramola',1,systimestamp,2800,2);
insert into orders(order_id,user_name,book_id,ordered_date,total_amount,quantity)values(103,'Rahul',4,systimestamp,800,1);
insert into orders(order_id,user_name,book_id,ordered_date,total_amount,quantity,status)values(104,'Rajesh',2,systimestamp,1900,1,'pending');

select * from orders;
