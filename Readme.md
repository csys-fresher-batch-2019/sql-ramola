# My Bookshelf
  bookshelf.in
 
## Features
   * verify the availability of book in various languages

#### Feature 1: List of books available in particular language
  
  '''sql
  create table languages(language_id number,
                languages varchar2(50) not null,
                book_count number,
                constraint lang_id_pk primary key(language_id),
                constraint lang_ck check (languages in ('Tamil','English','Hindi'))
                );
                
  '''              
  Query:
  '''sql
    select * from languages;
'''
