use TutorialDB

--Select
select * from [Superstore Example]

--Distinct
select distinct [Country] from [Superstore Example]
select distinct [City] from [Superstore Example]
select distinct [State] from [Superstore Example]

--Where
select * from [Superstore Example] where [State] = 'Texas' 
select * from [Superstore Example] where [City] = 'Taylor'

--And / Or
select * from [Superstore Example] where [City] = 'Springfield' or [City] = 'Chicago'

select * from [Superstore Example] where [Country] = 'United States' and ([City] = 'Springfield' or [City] = 'Chicago')

--Order by
select * from [Superstore Example] order by [Customer Name] ASC
select * from [Superstore Example] order by [Customer Name] DESC
select * from [Superstore Example] order by [Customer Name],[City]

--ISNULL
select [State],[City],[Country] from [Superstore Example]
where [City] IS NULL

select [State],[City],[Country] from [Superstore Example]
where [City] IS NOT NULL

--Checking duplicates

select [Customer ID],[Customer Name],[Customer Name],[City],[State],[Postal Code],count(*) as Duplicate
from [Superstore Example]
Group by [Customer ID],[Customer Name],[Customer Name],[City],[State],[Postal Code]
Having count(*)>1

--Deleting Duplicates and create new table for clean data

SELECT * into [Superstore Example U] FROM (SELECT *, ROW_NUMBER()
OVER (PARTITION BY [Customer ID],[Customer Name],[Customer Name],[City],[State],[Postal Code] ORDER BY [Customer ID])
AS cnt FROM [Superstore Example]) [Customer ID] WHERE cnt = 1 
go--(4910 rows affected)
alter table [Superstore Example U]  drop column cnt

--New Cleaned Files
select * from [Superstore Example U] order by [Customer ID]

