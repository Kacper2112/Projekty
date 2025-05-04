<<<<<<< HEAD
with hotels as (
select * from dbo.['2018$']
union
select * from dbo.['2019$']
union
select * from dbo.['2020$'])

select * from hotels
left join dbo.market_segment$
on hotels.market_segment=market_segment$.market_segment
left join  dbo.meal_cost$
on meal_cost$.meal=hotels.meal;



/*select round(sum((stays_in_week_nights+stays_in_weekend_nights)*adr),2) as revenue, 
arrival_date_year,
hotel 
from hotels
group by arrival_date_year,hotel;*/
=======
select * from dbo.Absenteeism_at_work as A
left join dbo.reasons as B on A.Reason_for_absence=B.number
left join dbo.compensation as C on A.ID=C.ID;

-- wybieranie osób zdrowych (nie pij¹, nie pal¹, bmi)
select * from Absenteeism_at_work
where
Social_drinker=0 and Social_smoker=0
and Body_mass_index <25 
and absenteeism_time_in_hours< (select AVG(absenteeism_time_in_hours) from Absenteeism_at_work);

--odszkodowanie dla osob niepal¹cych
-- bud¿et 983 221, 1426880 ilosc godzin (52 tygodnie, 686 pracownikow) powy¿ka 68 groszy za godzine 1414,4 na rok
select COUNT(*),  as osoby_niepalace from Absenteeism_at_work
where Social_smoker=0;


select 
A.ID, B.Reason,Month_of_absence,Body_mass_index,
case when Body_mass_index < 18.5 then 'Niedowaga'
	 when Body_mass_index between 18.5 and 25 then 'W normie'
	 when Body_mass_index between 25 and 30 then 'Nadwaga'
	 when Body_mass_index > 30 then 'Oty³oœæ'
	 else 'BRAK' end as BMI,
case when Month_of_absence in (12,1,2) then 'Zima'
	 when Month_of_absence in (3,4,5) then 'Wiosna'
	 when Month_of_absence in (6,7,8) then 'Lato'
	 when Month_of_absence in (9,10,11) then 'Jesieñ'
	 else 'BRAK' end as Pora_roku,
Day_of_the_week, Seasons, Transportation_expense, Distance_from_Residence_to_Work, Service_time,
age, Work_load_Average_day, Hit_target, Disciplinary_failure, Education, son, Social_drinker, Social_smoker,
pet, Weight, Height, Absenteeism_time_in_hours 
from dbo.Absenteeism_at_work as A
left join dbo.reasons as B on A.Reason_for_absence=B.number
left join dbo.compensation as C on A.ID=C.ID;






/*select avg(absenteeism_time_in_hours), id from Absenteeism_at_work
where Social_drinker=0 and Social_smoker=0
and Body_mass_index <25 
group by Absenteeism_at_work.id
having AVG(absenteeism_time_in_hours)< 6
order by avg(absenteeism_time_in_hours) desc*/
>>>>>>> origin/Nieobecnosci
