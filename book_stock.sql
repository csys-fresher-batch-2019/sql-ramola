drop table books;
create table books (book_id number,
        book_title varchar2(50),
        price number,
        constraint book_id_pk primary key (book_id)
        );
        
insert into books(book_id,book_title,price)values(101,'C',100);
insert into books(book_id,book_title,price)values(102,'Java',200);

select * from books;


create table book_stock(stock_id number,
        book_id number,
        quantity number,
        constraint book_id_fk1 foreign key(book_id) references books(book_id)
        );
        
insert into book_stock(stock_id,book_id,quantity)values(1,101,10);
insert into book_stock(stock_id,book_id,quantity)values(2,102,5);

select * from book_stock;
drop table book_stock;

create table orders(order_id number,
            user_name varchar2(50) not null,
            ordered_date timestamp not null,
            total_amount number,
            constraint order_id_pk primary key(order_id)
            );
            
insert into orders(order_id,user_name,ordered_date)values(1,'Ramola',systimestamp);
insert into orders(order_id,user_name,ordered_date)values(2,'Yashila',systimestamp);

select * from orders;

create table order_item(item_id number,
            order_id number,
            book_id number,
            quantity number,
            constraint book_id_fk foreign key(book_id) references books(book_id),
            constraint order_id_fk foreign key(order_id) references orders(order_id)
            );

insert into order_item(item_id,order_id,book_id,quantity)values(1,1,101,3);
insert into order_item(item_id,order_id,book_id,quantity)values(2,2,101,5);
insert into order_item(item_id,order_id,book_id,quantity)values(3,2,102,3);

select* from order_item;

---display book name and number of quantity ordered--
select book_title,(select sum(quantity)from order_item where book_id=b.book_id) as quantity_ordered from books b;

---display book name and stock---
select book_title,(select quantity from book_stock where book_id=b.book_id)as stock_availability from books b;

---calculate available stock for each book--
select book_title,((select quantity from book_stock where book_id=b.book_id)-
    (select sum(quantity)from order_item where book_id=b.book_id))as Available_stock from books b;
