--1)PRIMARY INDEX: is an ordered file whose record are unique, they can be known as primary key, It is a physical index for assigning a data row to an AMP(Access Module Processor), It is used to access the row without having to search the entire table.Every table must have at least one column with primary index, If the index is based on the primary key, it is called the primary index. Those keys are unique to each record. Furthermore, it contains 1:1 relation between the records. Searching data using the primary index is efficient because it stores data in the sorted order. (DENSE INDEX).

--SECONDARY INDEX: can be more selective and only store a subset of the columns in the table, along with altenate key to support queries operation. They can contain duplicate of records, Secondary index improve the performance of queries on non-primary keys. The secondary index is an index type that helps to reduce the size of mapping by introducing another level of indexing. At the initial stage, it selects a range for the columns. Therefore, the mapping size of the first level becomes smaller. Then, this index method reduces each range into smaller ranges. Generally, the primary memory stores the first level mappings to fetch addresses faster. Furthermore, the secondary memory stores the mapping of the second level and the actual data. (Dense Index).

--CLUSTERING INDEX: is one of the special type of index which reorder the way records in the table are physically stored in the disk, They serve as a table address which enable a better performance when retrieving data out of the table, A table can only have one Clustering index in a column but a clustering index key can have multiple column on a table, The presence of clustering index on table improve the general query run-time A clustered index changes the order in which the data is physically stored. After table data is in the physical order, the DBMS creates index pages. They help to navigate easily to the required data. The entire structure with the base table data is known as a clustered index. The process of a query navigating through the clustered index tree to the base table data is called clustered index seek. There is one clustered index per table because it is impossible to physically arrange data in two different ways without using separate structures.(DENSE INDEX).




--2) A B-Tree is a special kind of tree in a data structure. In 1972, this method was first introduced by McCreight, and Bayer named it Height Balanced m-way Search Tree. It helps you to preserves data sorted and allowed various operations like Insertion,B-tree is a "balanced tree" not binary tree, once created the  database maintains the index automatically. it applies every insert, delete and update to the index and keeps tree in "balance".  Data is stored on the disk in blocks, this data, when brought into main memory (or RAM) is called data structure.

--In-case of huge data, searching one record in the disk requires reading the entire disk; this increases time and main memory consumption due to high disk access frequency and data size.
--To overcome this, index tables are created that saves the record reference of the records based on the blocks they reside in. This drastically reduces the time and memory consumption.
--Since we have huge data, we can create multi-level index tables.Multi-level index can be designed by using B Tree for keeping the data sorted in a self-balancing fashion.                                                    --To Explain the term 'Balance', B Tree is a self-balancing data structure based on a specific set of rules for searching, inserting, and deleting the data in a faster and memory efficient way. In order to achieve this, the following rules are followed to create a B Tree.




--3) Clustered Index:
--Discussion: Indxes are used by queries to find data from tables quickly, A clustered index determines the physical order of data in a table, For this reason a table can have only one clustered index, However the index  can contain multiple column(a composite index)

--creating the following tables STUDENT, COURSE, SECTION, GRADE REPORT, PREREQUISITE in a database This tables will be created without a primary key or candidate key so as to be able to create a non-composite or composite CLUSTERED index on each table as found suitable

CREATE DATABASE University
go
use University
--Creating student table with clustered index on Name column, its physical in the table and  enabling refrenscing data easier
create table STUDENT(
Name nvarchar(20),
Student_number int,
Class int,
Major nvarchar (20)
)
go
INSERT INTO STUDENT VALUES('Smith', 17, 1, 'CS')
INSERT INTO STUDENT VALUES('Brown', 8, 2, 'CS')
go
create clustered Index IX_tblSTUDENT_Name
On STUDENT(Name)
go
select * from STUDENT

--Creating course table with composite clustered index on Course_number, Course_name columns, its physical in the table and  enabling refrenscing data easier
create table COURSE(
Course_name nvarchar (50),
Course_number nvarchar (20),
Credit_hours int,
Department nvarchar (20)
)
go
INSERT INTO COURSE VALUES ('Intro to Computer Science', 'CS1310', 4, 'CS')
INSERT INTO COURSE VALUES ('Data structures', 'CS3320', 4, 'CS')
INSERT INTO COURSE VALUES ('Discrete Mathematics', 'MATH2410', 3, 'MATH')
INSERT INTO COURSE VALUES ('Database', 'CS3380', 3, 'CS')
go
create clustered index IX_tblCOURSE_Coursenumber_Coursename
on COURSE( Course_number, Course_name)
go
select * from COURSE
go
--Creating section table with clustered index on semester, instructor columns, its physical in the table and  enabling refrenscing data easier
create table SECTION(
Section_identifier int,
Course_number nvarchar (20),
Semester nvarchar (20),
Year int,
instructor nvarchar (20)
)
go
INSERT INTO SECTION VALUES (85, 'MATH2410', 'Fall', 07, 'King')
INSERT INTO SECTION VALUES (92, 'CS1310', 'Fall', 07, 'Anderson')
INSERT INTO SECTION VALUES (102, 'CS3320', 'spring', 08, 'Knuth')
INSERT INTO SECTION VALUES (112, 'MATH2410', 'Fall', 08, 'Chang')
INSERT INTO SECTION VALUES (119, 'CS1310', 'Fall', 08, 'Anderson')
INSERT INTO SECTION VALUES (135, 'CS3380', 'Fall', 08, 'Stone')
go
create clustered index IX_tblSECTION_Semester_instructor
on SECTION(Semester, instructor)
go
select * from SECTION
go
--Creating grade_report table with clustered index on grade column, its physical in the table and  enabling refrenscing data easier
create table GRADE_REPORT(
Student_number int,
Section_identifier int,
Grade nvarchar (5)
)
go
INSERT INTO GRADE_REPORT VALUES(17, 112, 'B')
INSERT INTO GRADE_REPORT VALUES(17, 119, 'C')
INSERT INTO GRADE_REPORT VALUES(8, 85, 'A')
INSERT INTO GRADE_REPORT VALUES(8, 92, 'A')
INSERT INTO GRADE_REPORT VALUES(8, 102, 'B')
INSERT INTO GRADE_REPORT VALUES(8, 135, 'A')
go
create clustered index IX_tblGRADE_REPORT_Grade
on GRADE_REPORT(Grade)
select * from GRADE_REPORT
go
--Creating prerequisite table with clustered index on prerequisite_number column, its physical in the table and enabling refrenscing data easier
go
Create table PREREQUISITE(
Course_number nvarchar (20),
Prerequisite_number nvarchar (20)
)
go
INSERT INTO PREREQUISITE VALUES ('CS3380', 'CS3320')
INSERT INTO PREREQUISITE VALUES ('CS3380', 'MATH2410')
INSERT INTO PREREQUISITE VALUES ('CS3320', 'CS1310')
go
create clustered index IX_tblPREREQUISIE_Prerequisitenumber
on PREREQUISITE(Prerequisite_number)
go
select * from PREREQUISITE



--4)ATOMICITY: - This is when multiple operation is being grouped into one single logical entity,i.e other thread of control accessing database will either experience the changes or none of the changes, A guarantee of atomicity prevents updates to the database occurring only partially, which can cause greater problems than rejecting the whole series outright. As a consequence, the transaction cannot be observed to be in progress by another database client. At one moment in time, it has not yet happened, and at the next it has already occurred in whole (or nothing happened if the transaction was cancelled in progress) An example of an atomic transaction is a monetary transfer from bank account A to account B. It consists of two operations, withdrawing the money from account A and saving it to account B. Performing these operations in an atomic transaction ensures that the database remains in a consistent state, that is, money is neither lost nor created if either of those two operations fail..

--DURABILITY: - This Ensure that changes made to the database transaction that are succesfully commited will survive permanently, In database systems, durability is the ACID property which guarantees that transactions that have committed will survive permanently. For example, if a flight booking reports that a seat has successfully been booked, then the seat will remain booked even if the system crashes Many DBMSs implement durability by writing transactions into a transaction log that can be reprocessed to recreate the system state right before any later failure. A transaction is deemed committed only after it is entered in the log.

--ISOLATION: - Determines how transaction integrity is visible to the other user and system, Isolation is typically defined at database level as a property that defines how or when[clarification needed] the changes made by one operation become visible to others. On older systems, it may be implemented systemically, for example through the use of temporary tables. In two-tier systems, a transaction processing (TP) manager is required to maintain isolation. A lower isolation level increases the ability of many users to access the same data at the same time, but increases the number of concurrency effects (such as dirty reads or lost updates) users might encounter. Conversely, a higher isolation level reduces the types of concurrency effects that users may encounter, but requires more system resources and increases the chances that one transaction will block another.

--CONSISTENCY: Consistency (or Correctness) in database systems refers to the requirement that any given database transaction must change affected data only in allowed ways. Any data written to the database must be valid according to all defined rules, including constraints, cascades, triggers, and any combination thereof. This does not guarantee correctness of the transaction in all ways the application programmer might have wanted (that is the responsibility of application-level code) but merely that any programming errors cannot result in the violation of any defined database constraints. This require that only database transaction must change affected data in only allowed ways

--5)REAPETABLE READ: - The most restrictive  isolation level. The transaction hold read  lock on all rows, it reference and write lock on all rows In this isolation level, a lock-based concurrency control DBMS implementation keeps read and write locks (acquired on selected data) until the end of the transaction. However, range-locks are not managed, so phantom reads can occur.Write skew is possible at this isolation level in some systems. Write skew is a phenomenon where two writes are allowed to the same column(s) in a table by two different writers (who have previously read the columns they are updating), resulting in the column having data that is a mix of the two transactions..

--SERIALIZABLE: - This is the highest isolation level. A serializable execution execution is describe to be an execution of an operation in which cucurrently executing transaction appears to be searially executing With a lock-based concurrency control DBMS implementation, serializability requires read and write locks (acquired on selected data) to be released at the end of the transaction. Also range-locks must be acquired when a SELECT query uses a ranged WHERE clause, especially to avoid the phantom reads phenomenon.When using non-lock based concurrency control, no locks are acquired; however, if the system detects a write collision among several concurrent transactions, only one of them is allowed to commit.


--READ COMMITED:  - This isolation gaurantee that any data read is commited at the moment of it read, In this isolation level, a lock-based concurrently control DBMS implementation keeps write locks (acquired on selected data) until the end of the transaction, but read locks are released as soon as the SELECT operation is performed (so the non-repeatable reads phenomenon can occur in this isolation level). As in the previous level, range-locks are not managed. Putting it in simpler words, read committed is an isolation level that guarantees that any data read is committed at the moment it is read. It simply restricts the reader from seeing any intermediate, uncommitted, 'dirty' read. It makes no promise whatsoever that if the transaction re-issues the read, it will find the same data; data is free to change after it is read.

--READ UNCOMMITED - This is the uncomitted isolation. In this level transaction are not isolated from one another, It is the lowest isolation level. In this level, dirty reads are allowed, so one transaction may see not-yet-committed changes made by other transactions. 

--5b) A phantom read occurs when, in the course of a transaction, new rows are added or removed by another transaction to the records being read.This can occur when range locks are not acquired on performing a SELECT ... WHERE operation. The phantom reads anomaly is a special case of Non-repeatable reads when Transaction 1 repeats a ranged SELECT ... WHERE query and, between both operations, Transaction 2 creates (i.e. INSERT) new rows (in the target table) which fulfil that WHERE clause. Snap_shot isolation prevent phantom read problem from running an error when trying to read a variable over and over again

--In databases, and transaction processing (transaction management), snapshot isolation is a guarantee that all reads made in a transaction will see a consistent snapshot of the database (in practice it reads the last committed values that existed at the time it started), and the transaction itself will successfully commit only if no updates it has made conflict with any concurrent updates made since that snapshot.


--6b)The schedules are serializable

--6c) r2(z): w2(z): r1(x): w1(x):














