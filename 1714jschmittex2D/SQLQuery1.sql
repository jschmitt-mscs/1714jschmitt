--1714 Joe Schmitt
--EX2D

--2D.1	Buildings, apartments, administrators	BuildingId, BuildingName, City, ApartmentNum, FirstName, LastName		City, BuildingName, ApartmentNum, LastName, FirstName
SELECT        Building.BuildingId, Building.BuildingName, Building.City, Apartment.ApartmentNum, Person.FirstName, Person.LastName
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId INNER JOIN
                         Person ON Apartment.AdminId = Person.PersonId


--2D.2	Tenants, buildings, apartments	PersonId, LastName, FirstName, City, BuildingId, BuildingName, ApartmentNum		LastName, FirstName, BuildingId, ApartmentNum
SELECT        Person.PersonId, Person.LastName, Person.FirstName, Building.City, Building.BuildingId, Building.BuildingName, Apartment.ApartmentNum
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId

--2D.3	Apartment, tenant, invoice, line items	ApartmentNum, LastName, FirstName, InvoiceId, InvoiceDate, Description, Amount	BuildingId = 1	ApartmentNum, LastName, FirstName, InvoiceDate
SELECT        Apartment.ApartmentNum, Person.LastName, Person.FirstName, Invoice.InvoiceID, Invoice.InvoiceDate, LineItem.Description, LineItem.Amount
FROM            Apartment INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentID INNER JOIN
                         LineItem ON Invoice.InvoiceID = LineItem.InvoiceID INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId
WHERE        (Building.BuildingId = 1)
ORDER BY Apartment.ApartmentNum, Person.LastName, Person.FirstName, Invoice.InvoiceDate

--2D.4	Apartment, tenant, invoice total	BuildingId, ApartmentId, LastName, FirstName, InvoiceId, InvoiceDate, Invoice Total
SELECT        Building.BuildingId, Apartment.ApartmentId, Person.LastName, Person.FirstName, Invoice.InvoiceID, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Total]
FROM            Apartment INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentID INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId INNER JOIN
                         LineItem ON Invoice.InvoiceID = LineItem.InvoiceID
GROUP BY Building.BuildingId, Apartment.ApartmentId, Person.LastName, Person.FirstName, Invoice.InvoiceID, Invoice.InvoiceDate

--2D.5	Invoice, tenant, receipt	InvoiceId, InvoiceDate, BuildingId, ApartmentNum, LastName, FirstName, ReceiptDate, Receipt.Amount		InvoiceDate, ReceiptDate
SELECT        Invoice.InvoiceID, Invoice.InvoiceDate, Building.BuildingId, Apartment.ApartmentNum, Person.LastName, Person.FirstName, Receipt.ReceiptDate, Receipt.Amount
FROM            Invoice INNER JOIN
                         Apartment ON Invoice.ApartmentID = Apartment.ApartmentId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         Receipt ON Invoice.InvoiceID = Receipt.InvoiceID INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId
ORDER BY Invoice.InvoiceDate, Receipt.ReceiptDate

--2D.6	Invoice, tenant, apartment, billed, received	InvoiceId, InvoiceDate, LastName, BuildingId, ApartmentNum, total billed, recieved	
SELECT        Invoice.InvoiceID, Invoice.InvoiceDate, Person.LastName, Building.BuildingId, Apartment.ApartmentNum, SUM(LineItem.Amount) AS [Total Billed], Receipt.Amount AS [Total Received]
FROM            Invoice INNER JOIN
                         Apartment ON Invoice.ApartmentID = Apartment.ApartmentId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         Invoice AS Invoice_1 ON Apartment.ApartmentId = Invoice_1.ApartmentID INNER JOIN
                         LineItem ON Invoice.InvoiceID = LineItem.InvoiceID AND Invoice_1.InvoiceID = LineItem.InvoiceID INNER JOIN
                         Receipt ON Invoice.InvoiceID = Receipt.InvoiceID AND Invoice_1.InvoiceID = Receipt.InvoiceID INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId
GROUP BY Invoice.InvoiceID, Invoice.InvoiceDate, Person.LastName, Building.BuildingId, Apartment.ApartmentNum, Receipt.Amount

--2D.7	Administrator, invoice, total billed, received	PersonId, admin LastName, InvoiceId, InvoiceDate, total billed, 
SELECT        Person.PersonId, Person.LastName, Invoice.InvoiceID, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Total Billed], Receipt.Amount AS [Total Received]
FROM            LineItem INNER JOIN
                         Invoice ON LineItem.InvoiceID = Invoice.InvoiceID INNER JOIN
                         Receipt ON Invoice.InvoiceID = Receipt.InvoiceID INNER JOIN
                         Apartment ON Invoice.ApartmentID = Apartment.ApartmentId INNER JOIN
                         Person ON Apartment.AdminId = Person.PersonId
GROUP BY Person.PersonId, Person.LastName, Invoice.InvoiceID, Invoice.InvoiceDate, Receipt.Amount
