use Bank

create table account(
account_id int,
overdraft_amt int,
customer_id int,
type_id int,
segment nvarchar (10)
)
--drop table account

create table customer(
customer_id int primary key identity (1,1),
name nvarchar (10),
lastname nvarchar(10),
gender nvarchar(10),
maritial_status nvarchar(10)
)
--DROP TABLE customer

insert into account(account_id,overdraft_amt,customer_id,type_id,segment) values (2556889, 12000, 4, 2, 'RET')
Insert Into account Values (1323598795, 1550, 1, 1, 'RET')
insert into account values (2225546, 5000, 5, 2, 'RET')
insert into account values (5516229, 6000, 4, 5, 'RET')
insert into account values (5356222, 7500, 5, 5, 'RET')
insert into account values (2221889, 5400, 1, 2, 'RET')
insert into account values (2455688, 12500, 50, 2, 'CORP')
insert into account values (1322488656, 2500, 51, 1, 'CORP')
insert into account values (1323598795, 3100, 52, 1, 'CORP')
insert into account values (1323111595, 1220, 53, 1, 'CORP')

select * from account


Insert Into customer Values ('MARC', 'TESCO', 'M', 'Y')
Insert Into customer Values ('ANNA', 'MARTIN', 'F', 'N')
Insert Into customer Values ('EMMA', 'JOHNSON', 'F', 'Y')
Insert Into customer Values ('DARIO', 'PENTAL', 'M', 'N')
Insert Into customer Values ('ELENA', 'SIMSON', 'F', 'N')
Insert Into customer Values ('TIM', 'ROBITH', 'M', 'N')
Insert Into customer Values ('MILA', 'MORRIS', 'F', 'N')
Insert Into customer Values ('JENNY', 'DWARTH', 'F', 'Y')

select * from customer
select * from account

select account.* , customer.name, customer.lastname, customer.gender
from account
join
customer
on account.type_id = customer.customer_id

select * from customer
select * from account

select account.*, customer.customer_id, customer.name, customer.lastname, customer.maritial_status
from account
left join
customer
On account.customer_id = customer.customer_id


select * from customer
select * from account

select account.account_id, account.overdraft_amt, account.type_id, account.segment, customer.*
from account
right join
customer
On account.customer_id = customer.customer_id

select * from customer
select * from account

select account.account_id, account.overdraft_amt,
	    customer.name, customer.lastname, customer.gender,
		case when account.customer_id is null
		then customer.customer_id
		else account.customer_id
		END Customer_Id
from account
full join customer
on account.customer_id = customer.customer_id

select account.*, customer.customer_id, customer.name, customer.lastname, customer.gender
from account
full join
customer
On account.customer_id = customer.customer_id

select overdraft_amt,
   CASE WHEN
            OVERDRAFT_AMT > 6000
			THEN 'High Budget'
			else
			'Font'
	end as New
	from account

select * from customer
select * from account

select customer.gender,
sum(account.type_id) as New
from customer
INNER join account
On customer.customer_id = account.customer_id
group by customer.gender 

select * from customer
select * from account


select Acct.account_id, Acct.overdraft_amt, Acct.customer_id, Acct.type_id,customer_id.customer_id,
customer_id.gender as gender_id, 
type_id.gender as gender_type
from account Acct
join customer customer_id
On acct.customer_id = customer_id.customer_id
join customer type_id
On acct.type_id = type_id.customer_id  

select * from customer
select * from account

select acct.account_id, acct.overdraft_amt, acct.customer_id, acct.type_id,
customer_id.gender as Gender_id,
type_id.gender as Gender_type
from account acct
join customer Customer_id
On acct.customer_id = Customer_id.customer_id
join customer type_id
On acct.customer_id = type_id.customer_id







  







