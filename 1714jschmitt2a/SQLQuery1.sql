-- Joe Schmitt
-- Exercise 2A: Table Queries

-- 2A.1) Building, Apartment tables
SELECT        Building.BuildingId, Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
ORDER BY Building.BuildingId, Apartment.ApartmentNum

--2A.2) building, apartment, filter: winona, sort: buildingid, rent
SELECT        Building.BuildingId, Building.City, Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
WHERE        (Building.City = N'Winona')
ORDER BY Building.BuildingId, Apartment.Rent DESC

--2A.3) apartment, invoice
SELECT        Apartment.ApartmentId, Apartment.ApartmentNum, Invoice.InvoiceID, Invoice.InvoiceDate, Invoice.DueDate
FROM            Apartment INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentID
WHERE        (Apartment.BuildingId = 1)
ORDER BY Apartment.ApartmentNum, Invoice.InvoiceDate DESC

--2A.4) apartment invoice
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Invoice.InvoiceID, Invoice.InvoiceDate, Invoice.DueDate
FROM            Apartment INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentID
ORDER BY Apartment.BuildingId, Apartment.ApartmentNum, Invoice.InvoiceID


--2A.5) apartment, person, sort building id, apartnum
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Apartment.Rent, Person.LastName AS Admin
FROM            Apartment INNER JOIN
                         Person ON Apartment.AdminId = Person.PersonId
ORDER BY Apartment.BuildingId, Apartment.ApartmentNum

--2A.6) apartment, person
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Person.LastName AS TenantLastName, Person.FirstName AS TenantFirstName
FROM            Apartment INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId
ORDER BY Apartment.BuildingId, TenantLastName, TenantFirstName

--2A.7)invoice, line item
SELECT        Invoice.ApartmentID, Invoice.InvoiceID, Invoice.InvoiceDate, LineItem.Description, LineItem.Amount
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceID = LineItem.InvoiceID
ORDER BY Invoice.ApartmentID, Invoice.InvoiceDate DESC

--2A.8)invoice, line item
SELECT        Invoice.ApartmentID, Invoice.InvoiceID, Invoice.InvoiceDate, LineItem.Description, LineItem.Amount
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceID = LineItem.InvoiceID
WHERE        (LineItem.Description LIKE N'Rent%') OR
                         (LineItem.Description = N'Garage')
ORDER BY Invoice.ApartmentID, Invoice.InvoiceDate DESC


--2A.9)invoice, receipt
SELECT        Invoice.ApartmentID, Invoice.InvoiceID, Invoice.DueDate, Receipt.ReceiptDate, Receipt.Amount
FROM            Invoice INNER JOIN
                         Receipt ON Invoice.InvoiceID = Receipt.InvoiceID
ORDER BY Invoice.ApartmentID, Invoice.InvoiceID