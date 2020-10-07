--Joseph Schmitt
--EX2C
--2C.1	Building	State, City, count buildings	State, City
SELECT        State, City, COUNT(BuildingId) AS BuildingCount
FROM            Building
GROUP BY State, City

--2C.2	Building	City, count buildings	City	MN
SELECT        City, COUNT(BuildingId) AS BuildingCount
FROM            Building
GROUP BY City, State
HAVING        (State = N'MN')

--2C.3	Building, Apartment	BuildingId, BuildingName, average rent	BuildingId, BuildingName
SELECT        Building.BuildingId, Building.BuildingName, AVG(Apartment.Rent) AS AverageRent
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.BuildingId, Building.BuildingName

--2C.4	Building, Apartment	City, BuildingName, total rent
SELECT        Building.City, Building.BuildingName, SUM(Apartment.Rent) AS TotalRent
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.City, Building.BuildingName

--2C.5	Building, Apartment	Cheapest rent	City
SELECT        Building.City, MIN(Apartment.Rent) AS CheapestRent
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.City

--2C.6	Building, Apartment	BuildingName, Smallest size, avg size, largest size	BuildingName	Available in Winona
SELECT        Building.BuildingName, MIN(Apartment.SquareFeet) AS SmallestSize, AVG(Apartment.SquareFeet) AS AvgSize, MAX(Apartment.SquareFeet) AS MaxSize
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.BuildingName, Building.City
HAVING        (Building.City = N'Winona')

--2C.7	Invoice, LineItem	InvoiceId, cheapest price	InvoiceId	Garage during Sep 2018
SELECT        MIN(LineItem.Amount) AS [Min Garage]
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceID = LineItem.InvoiceID
GROUP BY LineItem.Description, Invoice.InvoiceDate
HAVING        (LineItem.Description = N'Garage') AND (Invoice.InvoiceDate BETWEEN CONVERT(DATETIME, '2018-09-01 00:00:00', 102) AND CONVERT(DATETIME, '2018-09-30 00:00:00', 102))

--2C.8	Invoice, LineItem	InvoiceId, total amount billed month sept 2018
SELECT        Invoice.InvoiceID, SUM(LineItem.Amount) AS Expr1
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceID = LineItem.InvoiceID
GROUP BY Invoice.InvoiceID, Invoice.InvoiceDate
HAVING        (Invoice.InvoiceDate BETWEEN CONVERT(DATETIME, '2018-09-01 00:00:00', 102) AND CONVERT(DATETIME, '2018-09-30 00:00:00', 102))