--1714 EX 2E
--Joe Schmitt


--2E.1)
SELECT        BuildingName, Address, City + ', ' + State + ' ' + Zip AS Address
FROM            Building
WHERE        (City = N'Winona')

--2E.2)
SELECT        Building.BuildingName, Apartment.ApartmentNum, Apartment.SquareFeet * 0.9 + 100 * Apartment.Bathrooms AS [Estimated Rent]
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
WHERE        (Building.City = N'Red Wing')

--2E.3)
SELECT        Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent, Apartment.SquareFeet * 0.9 + 100 * Apartment.Bathrooms AS [Estimated Rent], Apartment.Rent - (Apartment.SquareFeet * 0.9 + 100 * Apartment.Bathrooms) 
                         AS [Actual - Estimated]
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
WHERE        (Building.City = N'Red Wing')

--2E.4)
SELECT        Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS [Tenant Name], Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Total]
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentID INNER JOIN
                         LineItem ON Invoice.InvoiceID = LineItem.InvoiceID
GROUP BY Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, Invoice.InvoiceDate

--2E.5)
SELECT        Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS [Tenant Name], Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Amount], Receipt.Amount
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentID INNER JOIN
                         LineItem ON Invoice.InvoiceID = LineItem.InvoiceID INNER JOIN
                         Receipt ON Invoice.InvoiceID = Receipt.InvoiceID
GROUP BY Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, Invoice.InvoiceDate, Receipt.Amount

--2E.6)
SELECT        Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS [Tenant Name], Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Amount], Receipt.Amount
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentID INNER JOIN
                         LineItem ON Invoice.InvoiceID = LineItem.InvoiceID INNER JOIN
                         Receipt ON Invoice.InvoiceID = Receipt.InvoiceID
GROUP BY Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, Invoice.InvoiceDate, Receipt.Amount

--2E.7)
SELECT        Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS [Tenant Name], Invoice.DueDate, Receipt.ReceiptDate, DATEDIFF(day, Invoice.DueDate, Receipt.ReceiptDate) AS [Days Late]
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentID INNER JOIN
                         Receipt ON Invoice.InvoiceID = Receipt.InvoiceID
WHERE        (DATEDIFF(day, Invoice.DueDate, Receipt.ReceiptDate) > 0)

--2E.8) the data in the output image is the same as the answer key, just in a different order.
SELECT        Person.PersonId, Person.FirstName + N' ' + Person.LastName AS Expr1, MAX(Invoice.InvoiceDate) AS [Most Recent Invoice], DATEADD(MONTH, 1, MAX(Invoice.InvoiceDate)) AS [Next Month]
FROM            Person INNER JOIN
                         Apartment ON Person.PersonId = Apartment.TenantId INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentID
GROUP BY Person.FirstName + N' ' + Person.LastName, Person.PersonId