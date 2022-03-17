create database TravelOnTheGo;
use TravelOnTheGo;

-- table for passengers record
CREATE TABLE IF NOT EXISTS `Passenger`(
`ID` int primary key,
`Passenger_name` varchar(80),
`Category` varchar(50),
`Gender` varchar(1),
`Boarding_City` varchar(50),
`Destination_City` varchar(100),
`Distance` int,
`Bus_Type` varchar(50)
);

-- table for price required to travel
CREATE TABLE IF NOT EXISTS `Price`(
`Bus_Type` varchar(50),
`Distance` int,
`Price` int
);

INSERT INTO `Passenger` VALUES(1,"Sejal","AC",'F',"Bengaluru","Chennai",350,"Sleeper");
INSERT INTO `Passenger` VALUES(2,"Anmol","Non-AC",'M',"Mumbai","Hyderabad",700,"Sitting");
INSERT INTO `Passenger` VALUES(3,"Pallavi","AC",'F',"Panaji","Bengaluru",600,"Sleeper");
INSERT INTO `Passenger` VALUES(4,"Khusboo", "AC", 'F', "Chennai", "Mumbai", 1500, "Sleeper");
INSERT INTO `Passenger` VALUES(5,"Udit", "Non-AC", 'M', "Trivandrum", "panaji", 1000, "Sleeper");
INSERT INTO `Passenger` VALUES(6,"Ankur", "AC", 'M', "Nagpur", "Hyderabad", 500, "Sitting");
INSERT INTO `Passenger` VALUES(7,"Hemant", "Non-AC", 'M', "panaji", "Mumbai", 700, "Sleeper");
INSERT INTO `Passenger` VALUES(8,"Manish", "Non-AC", 'M', "Hyderabad", "Bengaluru", 500, "Sitting");
INSERT INTO `Passenger` VALUES(9,"Piyush", "AC", 'M', "Pune", "Nagpur", 700, "Sitting");
update `Passenger` set Gender= 'M', Category= "Non-AC" where ID=2;
select*from passenger;
-- price 
TRUNCATE TABLE price;
INSERT INTO `price` VALUES("Sleeper", 350, 770);
INSERT INTO `price` VALUES("Sleeper", 500, 1100);
INSERT INTO `price` VALUES("Sleeper", 600, 1320);
INSERT INTO `price` VALUES("Sleeper", 700, 1540);
INSERT INTO `price` VALUES("Sleeper", 1000, 2200);
INSERT INTO `price` VALUES("Sleeper", 1200, 2640);
INSERT INTO `price` VALUES("Sleeper", 1500, 2700);
INSERT INTO `price` VALUES("Sitting", 500, 620);
INSERT INTO `price` VALUES("Sitting", 600, 744);
INSERT INTO `price` VALUES("Sitting", 700, 868);
INSERT INTO `price` VALUES("Sitting", 1000, 1240);
INSERT INTO `price` VALUES("Sitting", 1200, 1488);
INSERT INTO `price` VALUES("Sitting", 1500, 1860);
select*from price;

-- 3) How many females and how many male passengers travelled for a minimum distance of 600 KMs?
select ID, Passenger_name,Gender,Distance from passenger where passenger.Distance < 600;

-- 4) Find the minimum ticket price for Sleeper Bus.
select min(Price) from price where Bus_Type="Sleeper" ;

-- 5) Select passenger names whose names start with character 'S'
select ID, Passenger_name from passenger where passenger.Passenger_name like "S%" ;

-- 6) Calculate price charged for each passenger displaying Passenger name, Boarding City,
-- Destination City, Bus_Type, Price in the output
SELECT Passenger_name , p1.Boarding_City, p1.Destination_city, p1.Bus_Type, p2.Price FROM passenger p1, price p2 
WHERE p1.Distance = p2.Distance and p1.Bus_type = p2.Bus_type;

-- 7. What is the passenger name and his/her ticket price who travelled in Sitting bus for a distance of 1000 KMs. 

SELECT p1.Passenger_name, p1.Boarding_city, p1.Destination_city, p1.Bus_type, p2.Price FROM passenger p1, price p2 WHERE p1.Distance = 1000 and p1.Bus_type = 'Sitting' and p1.Distance = 1000 and p1.Bus_type = 'Sitting';


-- 8. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?

SELECT DISTINCT p1.Passenger_name, p1.Boarding_city as Destination_city, p1.Destination_city as Boardng_city, p1.Bus_type, p2.Price FROM passenger p1, price p2 WHERE Passenger_name = 'Pallavi' and p1.Distance = p2.Distance;


-- 9.List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order

SELECT DISTINCT distance FROM passenger ORDER BY Distance desc;


-- 10. Display the passenger name and percentage of distance travelled by that passenger from the total distance travelled by all passengers without using user variables.
SELECT Passenger_name, Distance * 100.0/ (SELECT SUM(Distance) FROM passenger)FROM passenger GROUP BY Distance;


-- 11.Display the distance, price in three categories in table Price
-- a) Expensive if the cost is more than 1000
-- b) Average Cost if the cost is less than 1000 and greater than 500
-- c) Cheap otherwise

select distance, price, 
CASE
	WHEN price.Price >1000 THEN 'Expensive'
    WHEN price.Price<1000  THEN 'Average Cost'
    WHEN price.Price>500  THEN 'Average Cost'
    ELSE 'Cheap otherwise'
END AS cost from price;

	


