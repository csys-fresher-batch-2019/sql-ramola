# My Bookshelf
  bookshelf.in
 
## Features
   * verify the availability of book in various languages

#### Feature 1: List of books available 
  ```sql
   create table books(book_id number,
            book_name varchar2(75) not null,
            book_author varchar2(70) not null,
            book_language varchar2(20) not null,
            book_type varchar2(20) not null,
            book_uploaded_on date default sysdate,
            constraint book_id_pk primary key (book_id),
            constraint book_language check (book_language in ('Tamil','English','Hindi','Spanish','Russian')),
            constraint book_uq unique (book_name,book_author));
                           
  Query:
    
    insert into books(book_id,book_name,book_author,book_language,book_type)values(1,'Harry Potter:The complete Collection','J.K.Rowling','English','Fantasy');

    
    select * from books;
    
    
  Table:
  
| Book_id | Book_name                             | Book_author     | Book_language | Book_type  | Book_uploaded_on |
|---------|---------------------------------------|-----------------|---------------|------------|------------------|
| 1       | Harry Potter: The Complete Collection | J.K.Rowling     | English       | Fantasy    | 10-JAN-13        |
| 2       | Twilight                              | Stephenie meyer | English       | Romance    | 21-DEC-15        |
| 3       | Uravumuraigal                         | Preman          | Tamil         | Literature | 07-MAY-18        |
  
```
#### Feature 2: List of book types available

```sql

create table book_type(book_id number,
            book_type varchar2(50) not null,
            constraint book_id_fk foreign key(book_id));

Query:

  Select * from book_type;
  
Table:

| Book_id | Book_type  |
|---------|------------|
| 1       | Fantacy    |
| 2       | Romance    |
| 3       | Literature |

```
  
#### Feature 3: List of users given rating

```sql

create sequence user_id_sqc start with 101 increment by 1;
create table users(user_id number,
            user_name varchar2(50) not null,
            book_id number,
            book_rating number default 0,
            constraint book_id_fk foreign key(book_id) references books(book_id),
            constraint book_rate_ck check (book_rating in (0,1,2,3,4,5))
            );
            
 Query:
 
  insert into userss(user_id,user_name,book_id)values(user_id_sq.nextval,'G.K.Ramola',1);
  
  select * from users;
  
 Table:
 
| User_id | User_name  | Book_id | Book_rating |
|---------|------------|---------|-------------|
| 101     | G.K.Ramola | 2       | 4           |
| 102     | M.G.Kannan | 1       | 5           |
| 103     | K.Yashila  | 3       | 4           |

