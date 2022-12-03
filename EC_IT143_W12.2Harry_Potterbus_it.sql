/***********************************************************************************
******************************
NAME:    My Business Analysis
PURPOSE: My script purpose...
MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   
-------------------------------------------------------------------------------
1.0     12/03/2022   ITAPIA       1. Built this script for EC IT440
RUNTIME: 
1s
NOTES: 
...
 
***********************************************************************************
*******************************/

--Q1-Movies critic wants to write the blog on highest box office collection earned by harry potter movie from Harry potter movies collection 
--They want to know the top 1 harry potter movie based on budget collection
select top 1 * from Movies$
order by [Box Office] desc;

--Q2-For upcoming harry potter movie new producers are on board due to very high expenses for investment
--They want to know the Net profit margin percentage & Profit Percentage of all harry potter movies order by release year in order to make their decisions
select *,(([Box Office] - Budget)/[Box Office])*100 as 'Net Profit Margin (%)',(([Box Office] - Budget)/[Budget])*100 as 'Profit (%)' 
from Movies$
order by [Release Year];


--Q3- Directors want to know the which characters has only 1 or 2 dialogues in whole harry potter movie collection.
-- They want to give the chance to those characters in their upcoming project
select c.[Character Name],count(d.[Dialogue ID]) as 'Dialogue count' from Dialogue$ d
join Characters$ c on c.[Character ID] =d.[Character ID]
group by c.[Character Name]
having count(d.[Dialogue ID]) in(1,2);


--Q4 An school wants to organize events for children’s to recreate the famous places of harry potter movies collection 
-- They want the stats of all location so they recreate most used locations from the list based on numbers
select m.[Movie Title],
sum((case when p.[Place Category] = 'Hogwarts' then 1 else 0 end)) as 'Hogwarts Count',
sum((case when p.[Place Category] = 'Diagon Alley' then 1 else 0 end)) as 'Diagon Alley Count',
sum((case when p.[Place Category] = 'Dwellings' then 1 else 0 end)) as 'Dwellings Count',
sum((case when p.[Place Category] = 'Hogsmeade' then 1 else 0 end)) as 'Hogsmeade Count',
sum((case when p.[Place Category] = 'Other Magical Locations' then 1 else 0 end)) as 'Other Magical Locations Count' 
from Movies$ m
join Chapters$ c on c.[Movie ID] = m.[Movie ID]
join Dialogue$ d on d.[Chapter ID] = c.[Chapter ID]
join Places$ p on d.[Place ID] = p.[Place ID]
group by m.[Movie Title];
