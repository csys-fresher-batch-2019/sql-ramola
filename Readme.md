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
  
    select * from books;
    
    
  Table:
  
| Book_id | Book_name                             | Book_author     | Book_language | Book_type  | Book_uploaded_on |
|---------|---------------------------------------|-----------------|---------------|------------|------------------|
| 1       | Harry Potter: The Complete Collection | J.K.Rowling     | English       | Fantasy    | 10-JAN-13        |
| 2       | Twilight                              | Stephenie meyer | English       | Romance    | 21-DEC-15        |
| 3       | Uravumuraigal                         | Preman          | Tamil         | Literature | 07-MAY-18        |


  
```
