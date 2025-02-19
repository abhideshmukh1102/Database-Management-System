create database book_store;
show databases;
use book_store;

create table author(
author_id int primary key,
author_name varchar(50) not null,
birth_date date,
city varchar(50) not null
);
desc author;

insert into author(author_id,author_name,birth_date,city)
values(1,"babasaheb purandare","1922-7-29","pune"),
(2,"r k narayan","1906-10-31","chennai"),
(3,"dorris lessing","1919-10-22","british"),
(4,"rohinton mistry","1952-07-03","mumbai"),
(5,"f scott fitzgerald","1896-09-24","usa"),
(6,"arundhati roy","1961-11-21","mumbai"),
(7,"henrry miller","1891-12-26","british"),
(8,"nayantra sehgal","1927-05-10","chennai"),
(9,"shivaji sawant","1940-08-31","pune"),
(10,"vikram seth","1952-06-20","mumbai");
select * from author;


create table book(
book_id int primary key,
book_name varchar(50) not null,
author_id int not null,
isbn varchar(20) not null,
genre varchar(50) not null,
price int,
quantity int,
constraint fk_author_id foreign key(author_id)
references author(author_id)
);
 desc book;

insert into book(book_id,book_name,author_id,isbn,genre,price,quantity)
values(101,"raja shiv chhatrapati",1,9876543219871,"historical",250,100),
(102,"the guide ",2,9076543219876,"philosopical",120,75),
(103,"a fine balance",4,5476543219876,"fiction",70,50),
(104,"a suitable boy",10,4076543219876,"roamnce",50,30),
(105,"god of small think",5,9076543219876,"drama",120,20),
(106,"the fifth child",3,3049543219876,"fiction",40,35),
(107,"the golden notebook",3,6776543219876,"novel",60,100),
(108,"the wisdom of the heart",7,7654543219876,"poetry",100,90),
(109,"the great gatsby",5,1276543219876,"tragedy",120,85),
(110,"the rivered earth",10,9076543671986,"musical",90,90),
(111,"chava",9,9876556219876,"historical",200,110),                                              
(112,"kashmir",6,8949643219876,"novel",80,60),
(113,"tropic of cancer",7,9876543210976,"drama",90,20),
(114,"rich like us",7,2076543219876,"political",150,70),
(115,"rajgad",1,1876547419876,"historical",300,45);
select * from book;


create table customer(
customer_id int primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
address varchar(100),
phone_number varchar(50),
gender enum("M","F")
);
desc customer;

insert into customer(customer_id,first_name,last_name,address,phone_number,gender)
values(1001,"abhijeet","deshmukh","ulhasnagar",9096102305,"M"),
(1002,"swami","narayan","thane",91906102305,"M"),
(1003,"prasad","kurhade","kalyan",9296102305,"M"),
(1004,"anjali","shinde","badlapur",9396102305,"F"),
(1005,"akshay","lohar","dombivali",9496102305,"M"),
(1006,"pratik","pawar","thane",9596102305,"M"),
(1007,"rohini","jagdale","ulhasnagar",9696102305,"F"),
(1008,"avinash","pukale","badlapur",9796102305,"M"),
(1009,"shital","khandagale","kalyan",9896102305,"F"),
(1010,"pooja","deshmukh","ulhasnagar",9996102305,"F");
select * from customer;


create table transaction(
transaction_id int primary key,
book_id int not null,
customer_id int not null,
transaction_date date,
quantity_purchased int,
total_price decimal(10,2),
constraint fk_book_id foreign key(book_id)
references book(book_id),
constraint fk_customer_id foreign key(customer_id)
references customer(customer_id)
);
desc transaction;


insert into transaction(transaction_id,book_id,customer_id,transaction_date,quantity_purchased,total_price)
values(5001,101,1001,"2023-11-10",2,500),
(5002,105,1005,"2023-10-15",5,600),
(5003,109,1010,"2023-11-30",3,360),
(5004,102,1002,"2023-12-04",1,75),
(5005,113,1005,"2024-01-17",2,180),
(5006,101,1008,"2024-01-24",3,750),
(5007,115,1001,"2024-01-30",1,300),
(5008,103,1003,"2023-10-06",5,350),
(5009,108,1006,"2023-11-09",2,200),
(5010,112,1009,"2024-01-05",1,80),
(5011,104,1007,"2023-10-28",4,200),
(5012,108,1001,"2024-01-28",1,100),
(5013,114,1008,"2023-09-12",2,300),
(5014,109,1010,"2024-01-10",3,360),
(5015,105,1002,"2024-01-01",3,360);
select * from transaction;

show tables;

-- queries--
--  alter query
-- 1)
alter table book add column language varchar(50) not null;
 
-- 2) 
alter table customer modify column phone_number varchar(20);

-- insert records  query
insert into book (book_id,language) 
values (101,"marathi"),(102,"english"),(103,"english"),(104,"english"),(105,"english"),(106,"english"),(107,"english"),(108,"english"),(109,"english"),(110,"english"),(111,"marathi"),(112,"english"),(113,"english"),(114,"english"),(115,"marathi");

-- update query
-- 3)update rich like us book quantity after purchase
update book set quantity=quantity-2 where book_id=114;
select quantity from book where book_id=114;

-- 4) update the price of book by applying a 10% discount
update book set price =price*0.9;

-- delete query
 -- 5)
delete from customer where customer_id=1015;

-- arithmatic operator query
-- 6)how many books does the bookstore have in total query after recieves a new shipment of each 90 book.
select book_name,quantity,quantity+90 as total_quantity from book;





-- comparasion operator query
-- 7)show books who are getting price more than 100rs
select * from book where price>100;

-- 8)which author was born befor 1910-02-11.
select * from author where birth_date<"1910-02-11";

-- 9) which authors are living in mumbai city. 
select * from author where city="mumbai";

-- 10) what is the total amount spent by a abhijeet deshmukh
select sum(total_price) as total_sale from transaction where customer_id=1001;

-- 11)find book by book name
select * from book where book_name="raja shiv chhatrapati";

-- 12)how many author have books available in the store.
select count(*) as numberofauthors from author;

-- 13)show unique genre
select distinct genre from book;

-- 14) what is details of shivaji sawant?
select author_id,author_name,birth_date,city from author where author_name="shivaji sawant";

--  logical operator query

-- 15)show me author who are living in mumbai and born after 1955-10-10.
select * from author where city="mumbai" and birth_date>"1955-10-10";

-- 16)show me book which genre is historical or price is greater than 110.
select * from book where genre="historical" or price>110;

-- 17)show me all transaction except customer_id=5009. 
select * from transaction where not transaction_id=5009;

-- 18)select with in and not in opeartor query
select * from customer where address="kalyan" or address="thane" or address="dombivali";
select * from customer where address in("kalyan","dombivali","thane");

-- 19)select with range operator query

-- 20)show me the  book which range is 110 and 500. 
select * from book where price between 110 and 500;

-- 21)what is the total revenue in 2023-10-01 to 2024-01-10 ?
select sum(total_price) as total_revenue from transaction where transaction_date between "2023-10-01" and "2024-01-10";

-- select with like operator query
-- 22)show me customer whos name starts with p
select * from customer where first_name like "p%";

-- 23)show me customer who last character mukh
select * from customer where last_name like "_%mukh";

-- select with limit operator query
-- 24)show me book_name and price limit is 5
select book_id,book_name, price from book order by book_id desc  limit 5  ;

-- 25)show me book_name,quantity,total quantity limit is 3.
select book_name,quantity,quantity+90 as total_quantity from book limit 3;

-- select with order by operator query
-- 26)what are the details of the last transaction.
select * from transactions order by transaction_date desc limit 5;

-- 27)which is the most expensive book
select book_name,price from book order by price desc limit 1;

-- 28)show top authors by birtdate
select  * from authors order by birth_date limit 5;



-- STRING FUNCTION
-- 29)
select concat(first_name," ",last_name) as full_name from customer;

-- 30)
select substr(first_name,3) from customer;

-- 31)
select length(author_name) from author;

-- 32)
select insert(author_name,3,5,"%") from author;
 

-- Aggrigate functions
-- 34)calculate total quantity of all books
select sum(quantity) as total_quantity from book;

-- 35) how many customer have purchase?
select count(distinct customer_id) as total_customer from transaction;

-- group by having 
-- 36)calculate average book price by genre
select genre,avg(price) as avg_price from book group by genre;

-- 37) how many books are there in each genre.
select genre,count(book_id) as book_count from book group by genre;

-- subquery 
-- 38) update god of small think book quantity after purchase
update book set quantity=quantity-5 where book_id=(select book_id from transaction where transaction_id=5002);
select quantity from book where book_id=105;

-- 39) find the author of rich like us
select author_name from author where author_id=(select author_id from book where book_name="rich like us");

-- joins query
-- 40) which books were written by babasaheb purandare.
select book.book_name,author.author_name
from book
inner join author on 
book.author_id=author.author_id where author_name="babasaheb purandare";

-- 41) which book is the best seller.?
select book.book_name,count(*) as salecount
from transaction
join book on 
transaction.book_id=book.book_id
group by book.book_name order by salecount desc limit 1;

-- 42)whats is purchase history of akshay lohar. 
select customers.first_name,customers.last_name,book.book_name,transactions.transaction_date,transactions.quantity_purchased,transactions.total_price
from transactions 
join customers on 
transactions.customer_id=customers.customer_id
join book on transactions.book_id=book.book_id
where customers.customer_id=1005;

-- 43)which book have had no sale ?
select book.book_name,transaction.transaction_id
from book
left join transaction on book.book_id=transaction.book_id
where transaction.transaction_id is null;

-- 44) who has not taken the book.
select customer.customer_id,customer.first_name,customer.last_name
from customer
left join transaction on
customer.customer_id=transaction.customer_id
where transaction.customer_id is null;

-- 45)which author have books with a quantity available greater than 50.
select distinct author_name 
from author
inner join book 
on author.author_id=book.author_id
where quantity >50; 

-- 46) who is author with total number of book they have,but only for author with more than 2 book
select author.author_name,count(book.book_id) as bookcount 
from author 
inner join book 
on author.author_id=book.author_id
group by author.author_id,
author.author_name having bookcount>2;


-- 47) which book were purchased by a pooja deshmukh in the last month.
select book_name,transaction_date
from transaction
inner join book 
on transaction.book_id=book.book_id
where customer_id=1010 and transaction_date>=curdate() - interval 1 month; 


