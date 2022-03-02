use Master

Select 
name 'Logical Name',
Physical_Name 'File Location'
From sys.master_files

--in case you want to know ALL YOUR database location in your laptop- ldf means log
--Miicrosoft has two important files, people call it mdf(main data files -schema and the main data)

--2ndly, we have the log data files(Idf - log queries in creating database, or tables)