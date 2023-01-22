--������� SQL ��������
--1.�������:
--� ����� ������ ����� ������� �� ������ (Paris) � ������� ������� ��� �����?
--���� � �������������� �������:
--town_to
--flight_time
--����������� ����������� "as flight_time" ��� ������ ������������ �������. ��� ���������� ��� ���������� ��������.
--������ ��� ������ �������: HH:MM:SS

--�������:
SELECT town_to as town_to, TIMEDIFF(time_in, time_out) as flight_time
FROM Trip
WHERE town_from = 'Paris';


--2.�������: ������� ����� ���� �����, ������� ���� � ���� ������ ������������
--�������:
SELECT name 
FROM Passenger;

--3. ������� ����� �����, ������� ������������� �� "man"
--�������: 
SELECT name
FROM Passenger
WHERE name LIKE '%man';

--4.������� ���������� ������, ����������� �� TU-134
--�������:
SELECT COUNT(*) AS 'COUNT'
FROM Trip 
WHERE plane='TU-134';

--5. ������� ��� �������� ��������, �� ������� ����� ������� � ������ (Moscow)
--�������:
SELECT DISTINCT plane
FROM Trip
WHERE town_to='Moscow';

--6. ����� �������� ���������� �������� � ������������ (Vladivostok)?
--�������:
SELECT DISTINCT Company.name 
FROM Company INNER JOIN Trip 
ON Company.ID=Trip.company
WHERE town_from='Vladivostok';

--7. ����� ����� ���� ������� (mother)
--�������:
SELECT member_name 
FROM FamilyMembers
WHERE status='mother';
--8. ������� ����� 10-�� �������
--�������:
SELECT COUNT(*) AS 'COUNT'
FROM class 
WHERE name LIKE '10%';

--9. �������� ���������� �� ����������� ������� �� ����� ������� (ul. Pushkina)?
--�������:
SELECT *
FROM Student
WHERE address LIKE 'ul. Pushkina_%';

--10. �� ������� ���������� 4-�� ������� ������� �� ����������?
--�������:
SELECT start_pair
FROM Timepair
WHERE ID='4';

--11. ������� ���������� � ����� ������� ������
--�������:
SELECT name
FROM Passenger
ORDER BY LENGTH(name) DESC LIMIT 1;

--12. ������, ��� ������ ���� � ����e
SELECT member_name
FROM FamilyMembers
where birthday = (select MIN(birthday) from FamilyMembers);

--13. ������� ����� �����, � ������� ���� ������ ���� ����� ����������
--�������:
SELECT
    name 
FROM
    Passenger
GROUP BY name HAVING COUNT(*)>1;

--14. ������� ����� ������� ��������� (delicacies) � �������� ��� ���������
--�������:
SELECT DISTINCT  
    G.good_name,
    P.unit_price 
From Goods g
inner join GoodTypes gt on g.type = gt.good_type_id and gt.good_type_name = 'delicacies'
INNER JOIN Payments p ON g.good_id=p.good
order by  P.unit_price desc limit 1

--15. ������� ���� ������ ����� � �������� Quincey.
--�������:
SELECT *
FROM FamilyMembers
WHERE member_name LIKE '_%Quincey';

--16. �������� ���� � ����� ������ ��������� ���� ������ (Steve Martin) � ������ (London)
--�������:
SELECT Trip.time_in
FROM 
   Passenger 
INNER JOIN Pass_in_trip ON Passenger.id=Pass_in_trip.passenger
INNER JOIN Trip ON Pass_in_trip.trip=Trip.id
WHERE
   name="Steve Martin" AND town_to="London"

--17. ������� �������������, ��������� ����������� ����� ��������. ���������� ��� ���������� +375.
--�������:
SELECT *
FROM
   Users
WHERE phone_number LIKE "+375_%";

--18. �������� ������ ������, ������� ���� ��������������� � ������� 12 ������ 2020 ����.
--�������:
SELECT DISTINCT  Rooms.*
 FROM
    Reservations
INNER JOIN Rooms ON Rooms.id=Reservations.room_id
WHERE Week(start_date,1)=12 AND YEAR(start_date)=2020;

--19. �������� ��������������� ������ (�� �����������) ���� ��������� � ���� �������.�.�.
--�������:
SELECT
 CONCAT(last_name, '.', LEFT(first_name, 1), '.', LEFT(middle_name, 1), '.') AS name
FROM
Student
ORDER BY Last_name, first_name;

--20. � ����� ������ ����� Bruce Willis
--�������:
SELECT DISTINCT 
    Trip.town_to
FROM
   Passenger
Inner JOIN Pass_in_trip ON Passenger.id=Pass_in_trip.passenger 
INNER JOIN Trip ON Pass_in_trip.trip=Trip.id 
WHERE 
  name='Bruce Willis';

--21. ������� ������ ��������� ������������ � ������� (Rostov) � ������ (Moscow) ?
--�������:
SELECT
COUNT(*) AS'COUNT'
FROM 
    Trip
WHERE town_from='Rostov' AND town_to='Moscow';

--22. ����������, ��� �� ������ ����� ������� �������� (potato)
--�������:
SELECT DISTINCT 
    FamilyMembers.status 
FROM
    Goods 
INNER JOIN Payments ON Goods.good_id=Payments.good 
INNER JOIN FamilyMembers ON Payments.family_member =FamilyMembers.member_id 
WHERE 
   good_name='potato';

