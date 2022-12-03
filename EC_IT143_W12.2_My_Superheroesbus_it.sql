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

--Q1-A private organization want to hire super heroes they need list of available heroes 

select * from heroes_information$ 
where Alignment = 'good';

--Q2-A Marvel Comics publisher wants to know the count of there Male/Female heroes
-- They want to introduce new hero based on gender ratio

select Gender,count(*) from heroes_information$ 
where Publisher='Marvel Comics'
group by Gender;

--Q3- A Marvel and Dc Comics publisher wants to create a joint venture comic play about intelligence of super heroes, 
--they want all super heroes list which has intelligence power order by there names 
Select hi.name as 'Hero Name',hi.Publisher from heroes_information$ hi
join super_hero_powers$ sp on sp.hero_names=hi.name
where sp.Intelligence=1
and hi.Publisher in ('Dc Comics','Marvel Comics')
order by hi.name;

--Q4- A agency want to know the list of all super heroes which has all these 5 powers 'Accelerated Healing, Durability, Stealth, Stamina and Time Travel'
--they want to recruit some super heroes based on these powers which have all these powers
Select hi.name as 'Hero Name',
(cast(sp.[Accelerated Healing] as int)+cast(sp.Durability as int)+cast(sp.Stealth as int)+
cast (sp.Stamina as int)+ cast(sp.[Time Travel] as int)) as 'Power Count'
from heroes_information$ hi
join super_hero_powers$ sp on sp.hero_names=hi.name
where (cast(sp.[Accelerated Healing] as int)+cast(sp.Durability as int)+cast(sp.Stealth as int)+
cast (sp.Stamina as int)+ cast(sp.[Time Travel] as int)) =5;

