--Joseph Schmitt
--Ex2G

-- 2G.1 Buildings, apartments, admins
SELECT        Buildings.Id, Buildings.BuildingName, Buildings.City, Apartments.ApartmentNum, People.FirstName + N' ' + People.LastName AS Admin
FROM            Buildings INNER JOIN
                         Apartments ON Buildings.Id = Apartments.Building_Id INNER JOIN
                         People ON Apartments.Admin_Id = People.Id
ORDER BY Buildings.Id

--2G.2 Apartments invoices line items
SELECT        Apartments.Building_Id, Apartments.ApartmentNum, People.LastName + N', ' + People.FirstName AS Tenant, Invoices.Id, LineItems.Description, LineItems.Amount
FROM            Apartments INNER JOIN
                         Invoices ON Apartments.Id = Invoices.Apartment_Id INNER JOIN
                         LineItems ON Invoices.Id = LineItems.Invoice_Id INNER JOIN
                         People ON Apartments.Tenant_Id = People.Id

--2G.3 Tenants, invoices, receipts
SELECT        People.LastName + N', ' + People.FirstName AS Tenant, Receipts.Invoice_Id, Invoices.DueDate, Receipts.ReceiptDate, Receipts.Amount AS [Amount Received]
FROM            Apartments INNER JOIN
                         People ON Apartments.Tenant_Id = People.Id INNER JOIN
                         Invoices ON Apartments.Id = Invoices.Apartment_Id INNER JOIN
                         Receipts ON Invoices.Id = Receipts.Invoice_Id