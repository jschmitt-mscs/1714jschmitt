-- Joseph Schmitt
-- Exercise 2B

-- 1)
SELECT        COUNT(*) AS Expr1
FROM            Building

--2)
SELECT        COUNT(*) AS Expr1
FROM            Building
GROUP BY City
HAVING        (City = N'Winona')

--3)
SELECT        AVG(Rent) AS Expr1
FROM            Apartment

--4)
SELECT        SUM(Rent) AS Expr1
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 1)

--5)
SELECT        MIN(Rent) AS Expr1
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 2)

--6)
SELECT        MIN(SquareFeet) AS Small, AVG(SquareFeet) AS Avg, MAX(SquareFeet) AS Large
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 1)

--7)
SELECT        MIN(Amount) AS Expr1
FROM            LineItem
GROUP BY Description
HAVING        (Description = N'Garage')

--8)
SELECT        SUM(Amount) AS Expr1
FROM            LineItem
GROUP BY Description
HAVING        (Description = N'Gas')

--9)
SELECT        SUM(Amount) AS Expr1
FROM            LineItem
GROUP BY Description
HAVING        (Description LIKE N'Rent, October%')

