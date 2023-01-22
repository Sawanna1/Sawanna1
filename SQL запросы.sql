--ПРИМЕРЫ SQL ЗАПРОСОВ
--1.Условие:
--В какие города можно улететь из Парижа (Paris) и сколько времени это займёт?
--Поля в результирующей таблице:
--town_to
--flight_time
--Используйте конструкцию "as flight_time" для вывода необходимого времени. Это необходимо для корректной проверки.
--Формат для вывода времени: HH:MM:SS

--Решение:
SELECT town_to as town_to, TIMEDIFF(time_in, time_out) as flight_time
FROM Trip
WHERE town_from = 'Paris';


--2.Условие: Вывести имена всех людей, которые есть в базе данных авиакомпаний
--Решение:
SELECT name 
FROM Passenger;

--3. Вывести имена людей, которые заканчиваются на "man"
--Решение: 
SELECT name
FROM Passenger
WHERE name LIKE '%man';

--4.Вывести количество рейсов, совершенных на TU-134
--Решение:
SELECT COUNT(*) AS 'COUNT'
FROM Trip 
WHERE plane='TU-134';

--5. Вывести все названия самолётов, на которых можно улететь в Москву (Moscow)
--Решение:
SELECT DISTINCT plane
FROM Trip
WHERE town_to='Moscow';

--6. Какие компании организуют перелеты с Владивостока (Vladivostok)?
--Решение:
SELECT DISTINCT Company.name 
FROM Company INNER JOIN Trip 
ON Company.ID=Trip.company
WHERE town_from='Vladivostok';

--7. Найти имена всех матерей (mother)
--Решение:
SELECT member_name 
FROM FamilyMembers
WHERE status='mother';
--8. Сколько всего 10-ых классов
--Решение:
SELECT COUNT(*) AS 'COUNT'
FROM class 
WHERE name LIKE '10%';

--9. Выведите информацию об обучающихся живущих на улице Пушкина (ul. Pushkina)?
--Решение:
SELECT *
FROM Student
WHERE address LIKE 'ul. Pushkina_%';

--10. Во сколько начинается 4-ый учебный предмет по расписанию?
--Решение:
SELECT start_pair
FROM Timepair
WHERE ID='4';

--11. Вывести пассажиров с самым длинным именем
--Решение:
SELECT name
FROM Passenger
ORDER BY LENGTH(name) DESC LIMIT 1;

--12. Узнать, кто старше всех в семьe
SELECT member_name
FROM FamilyMembers
where birthday = (select MIN(birthday) from FamilyMembers);

--13. Вывести имена людей, у которых есть полный тёзка среди пассажиров
--Решение:
SELECT
    name 
FROM
    Passenger
GROUP BY name HAVING COUNT(*)>1;

--14. Найдите самый дорогой деликатес (delicacies) и выведите его стоимость
--Решение:
SELECT DISTINCT  
    G.good_name,
    P.unit_price 
From Goods g
inner join GoodTypes gt on g.type = gt.good_type_id and gt.good_type_name = 'delicacies'
INNER JOIN Payments p ON g.good_id=p.good
order by  P.unit_price desc limit 1

--15. Вывести всех членов семьи с фамилией Quincey.
--Решение:
SELECT *
FROM FamilyMembers
WHERE member_name LIKE '_%Quincey';

--16. Выведите дату и время прилёта пассажира Стив Мартин (Steve Martin) в Лондон (London)
--Решение:
SELECT Trip.time_in
FROM 
   Passenger 
INNER JOIN Pass_in_trip ON Passenger.id=Pass_in_trip.passenger
INNER JOIN Trip ON Pass_in_trip.trip=Trip.id
WHERE
   name="Steve Martin" AND town_to="London"

--17. Вывести пользователей, указавших Белорусский номер телефона. Телефонный код Белоруссии +375.
--Решение:
SELECT *
FROM
   Users
WHERE phone_number LIKE "+375_%";

--18. Выведите список комнат, которые были зарезервированы в течение 12 недели 2020 года.
--Решение:
SELECT DISTINCT  Rooms.*
 FROM
    Reservations
INNER JOIN Rooms ON Rooms.id=Reservations.room_id
WHERE Week(start_date,1)=12 AND YEAR(start_date)=2020;

--19. Выведите отсортированный список (по возрастанию) имен студентов в виде Фамилия.И.О.
--Решение:
SELECT
 CONCAT(last_name, '.', LEFT(first_name, 1), '.', LEFT(middle_name, 1), '.') AS name
FROM
Student
ORDER BY Last_name, first_name;

--20. В какие города летал Bruce Willis
--Решение:
SELECT DISTINCT 
    Trip.town_to
FROM
   Passenger
Inner JOIN Pass_in_trip ON Passenger.id=Pass_in_trip.passenger 
INNER JOIN Trip ON Pass_in_trip.trip=Trip.id 
WHERE 
  name='Bruce Willis';

--21. Сколько рейсов совершили авиакомпании с Ростова (Rostov) в Москву (Moscow) ?
--Решение:
SELECT
COUNT(*) AS'COUNT'
FROM 
    Trip
WHERE town_from='Rostov' AND town_to='Moscow';

--22. Определить, кто из членов семьи покупал картошку (potato)
--Решение:
SELECT DISTINCT 
    FamilyMembers.status 
FROM
    Goods 
INNER JOIN Payments ON Goods.good_id=Payments.good 
INNER JOIN FamilyMembers ON Payments.family_member =FamilyMembers.member_id 
WHERE 
   good_name='potato';

