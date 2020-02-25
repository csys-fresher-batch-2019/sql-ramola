# My Bookshelf
  bookshelf.in
 
## Features
   * verify the availability of book in various languages

#### Feature 1: List of books available 
  ```sql
   create sequence book_id_sqc start with 1 increment by 1;
create table books(book_id number,
            book_name varchar2(75) not null,
            book_version number not null,
            book_author varchar2(70) not null,
            book_language varchar2(20) not null,
            book_rating number default 1,
            book_type varchar2(20) not null,
            book_uploaded_on date default sysdate,
            book_publisher VARCHAR2(60) not null,
            book_published_date date,
            constraint book_id_pk primary key (book_id),
            constraint book_language check (book_language in ('Tamil','English','Hindi','Spanish','Russian')),
            constraint book_uq unique (book_name,book_author,book_version));

alter table books add booklink varchar2(50);  
alter table books add imglink varchar2(30);  
  Query:
         
    select * from books;
    
    
  Table:
  
| Book_id | Book_name                               | Book_version | Book_author | Book_language | Book_rating | Book_type | Book_uploaded_on | Book_publisher | Book_published_on | Book_link             | Img_link             |
|---------|-----------------------------------------|--------------|-------------|---------------|-------------|-----------|------------------|----------------|-------------------|-----------------------|----------------------|
| 1       | harry potter and the chamber of secrets | 2            | j.k.rowling | English       | 5           | Fantacy   | 29-01-20         | Scholastic Inc | 02-06-98          | harrypotterpart-2.pdf | harrypotterpart2.jpg |
| 2       | papelucho                               | 1            | marcela paz | Spanish       | 1           | Fiction   | 29-01-20         | Ediciones SM   | 13-06-15          | papelucho.pdf         | papelucho.jpg        |
```
#### Feature 2: User Login

```sql

create sequence login_sqc start with 1 increment by 1;
create table login(login_no number,
            user_name varchar2(50),
            email varchar2(50) not null,
            phone_no number not null,
            preference_type varchar2(40),
            constraint preference_type_ck check(preference_type   in('Fiction','Fantacy','Mythology','Romance','Literature','Technical','Poetry','Autobiographies')),
            constraint login_uq unique(email),
            constraint login_no_pk primary key(login_no));
            
alter table login add password varchar2(20);  
            
 Query:
 
 
  select * from login;
  
 Table:
| Login_no | user_name | Email             | preference_type | password |
|----------|-----------|-------------------|-----------------|----------|
| 1        | Ramola    | rams@gmail.com    | Fiction         | rams     |
| 2        | Vasanth   | vasanth@gmail.com | Fantacy         | vasanth  |
