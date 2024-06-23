--Splitting users from the users table into 4 age groups:
--18 to 24 years;
--25 to 29 years;
--30 to 35 years;
--over 36.
--Count users in each group. Convert the date of birth to the age of users as an integer.

SELECT CASE
         WHEN Date_part('year', Age(birth_date)) :: INTEGER >= 18
              AND Date_part('year', Age(birth_date)) :: INTEGER <= 24 THEN
         '18-24'
         WHEN Date_part('year', Age(birth_date)) :: INTEGER >= 25
              AND Date_part('year', Age(birth_date)) :: INTEGER <= 29 THEN
         '25-29'
         WHEN Date_part('year', Age(birth_date)) :: INTEGER >= 30
              AND Date_part('year', Age(birth_date)) :: INTEGER <= 35 THEN
         '30-35'
         WHEN Date_part('year', Age(birth_date)) :: INTEGER >= 36 THEN '36+'
       END            AS group_age,
       Count(user_id) AS users_count
FROM   users
WHERE  birth_date IS NOT NULL
GROUP  BY group_age
ORDER  BY group_age 