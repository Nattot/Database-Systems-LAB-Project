--Daniel Alexander 2440006715
--Jeremy Andrew Jayaseputra 2440007075
--Kevin Tjandra Wijaya 2440008102
--Virgilius Karel 2440008140

USE SaraviaPen

SELECT *FROM Customer
SELECT *FROM SalesHeader
SELECT *FROM SalesDetail
SELECT *FROM PenMaterial
SELECT *FROM SalesDetail

--1
SELECT
	[CustomerId] = c.CustomerID,
	[CustomerName] = c.CustomerName,
	[SalesTransactionDate] = sh.TransactionDate,
	[Sales Transaction Quantity] = SUM(sd.PenQuantity)
FROM Customer c, SalesHeader sh, SalesDetail sd, Pen p
WHERE
	c.CustomerID = sh.CustomerID
	AND sd.PenID = p.penID
	AND sd.SalesID = sh.SalesID
	AND DAY(sh.TransactionDate) = 25
	AND p.PenID LIKE 'PEN009'
GROUP BY
	c.CustomerID, c.CustomerName, sh.TransactionDate

--2
SELECT
	[PenId] = p.PenID,
	[PenName] = p.PenName,
	[Total of Pen Material] = COUNT(pd.PenMatsQuantity)
FROM Pen p, PenMaterial pm, PurchaseDetail pd
WHERE
	p.PenName LIKE ('Milky%')
	AND p.PenID = pm.PenID
	AND pm.PenMatsID = pd.PenMatsID
GROUP BY p.PenID, p.PenName
HAVING COUNT(pd.PenMatsQuantity) > 6

--3
SELECT
	[CustomerName] = c.CustomerName,
	[Sales Transaction Date] = CONVERT(VARCHAR, sh.TransactionDate, 102),
	[Total Pen Type] = COUNT (sd.PenID),
	[Total Quantity] = SUM (sd.PenQuantity)
FROM Customer c, SalesHeader sh, SalesDetail sd, pen p, staff s
WHERE c.CustomerID = sh.CustomerID
	AND s.StaffID = sh.StaffID
	AND sh.SalesID = sd.SalesID
	AND sd.PenID = p.PenID
	AND MONTH(sh.TransactionDate) LIKE '9'
GROUP BY c.CustomerName, sh.TransactionDate
HAVING SUM(sd.PenQuantity) >10 

--4
SELECT
	[StaffName] = s.StaffName,
	[Staff Gender] = LEFT(s.StaffGender, 1),
	[CustomerName] = c.CustomerName,
	[Total Sales Transaction] = COUNT(sh.SalesID)
FROM Staff s, Customer c, SalesHeader sh, SalesDetail sd, Pen p
WHERE s.StaffID = sh.StaffID
	AND c.CustomerID = sh.CustomerID
	AND	sh.SalesID = sd.SalesID
	AND sd.PenID = p.PenID
	AND DAY(sh.TransactionDate)%2 = 0
GROUP BY s.StaffName, s.StaffGender, c.CustomerName
HAVING SUM(sd.PenQuantity)<=10

--5
SELECT
	[CustomerName] = UPPER(c.CustomerName),
	[CustomerGender] = c.CustomerGender,
	[SalesTransactionId] = sh.SalesID
FROM Customer c, SalesHeader sh, Pen p,SalesDetail sd,(SELECT Avg = AVG(sd.PenQuantity) FROM SalesDetail sd, SalesHeader sh WHERE sd.SalesID = sh.SalesID) AS alias
WHERE c.CustomerID = sh.CustomerID
	AND sh.SalesID = sd.SalesID
	AND DAY(sh.TransactionDate) = 22
	AND sd.PenQuantity > alias.Avg
GROUP BY c.CustomerName, c.CustomerGender, sh.SalesID

--6
SELECT
	[VendorName] = v.VendorName,
	[PurchaseDate] = CONVERT(VARCHAR, ph.TransactionDate, 107),
	[MaterialName] = LOWER(pm.PenMatsName)
FROM Vendor v, PurchaseHeader ph, PurchaseDetail pd, PenMaterial pm, (SELECT [Avg] = AVG(pm.PenMatsPrice) FROM PenMaterial pm) as alias
WHERE v.VendorID = ph.VendorID
	AND ph.PurchaseID = pd.PurchaseID
	AND pd.PenMatsID = pm.PenMatsID
	AND v.VendorName LIKE ('% Industry')
	AND pm.PenMatsPrice > alias.Avg
GROUP BY v.VendorName, ph.TransactionDate, pm.PenMatsName
	
--7
SELECT
	[Total Purchase Transaction] = CAST(COUNT(ph.PurchaseID) AS VARCHAR(10))+ ' Transaction(s)',
	[VendorName] = v.vendorName,
	[Staff Name] = LEFT(s.StaffName, charindex(' ', s.StaffName)),
	[PurchaseTransactionDate] = ph.TransactionDate
FROM Vendor v, Staff s, PurchaseHeader ph, PurchaseDetail pd, PenMaterial pm, Pen p,
	(SELECT Avg = AVG(pd.PenMatsQuantity) FROM PurchaseDetail pd, PenMaterial pm WHERE pd.PenMatsID = pm.PenMatsID) as alias
WHERE v.VendorID = ph.VendorID
	AND pm.PenMatsID = pd.PenMatsID
	AND s.StaffID = ph.StaffID
	AND ph.PurchaseID = pd.PurchaseID
	AND pm.PenID = p.PenID
	AND DATENAME(dw, ph.TransactionDate) = 'Sunday'
	AND pd.PenMatsQuantity<alias.Avg
GROUP BY ph.PurchaseID, v.VendorName, s.StaffName, ph.TransactionDate

--8
SELECT
	[VendorName] = v.VendorName,
	[Transaction Date] = CONVERT(VARCHAR, ph.TransactionDate, 106),
	[PenMaterialName] = pm.PenMatsName,
	[Material Number] = REPLACE(LEFT(pm.PenMatsID, 3), 'PML', 'PM')+RIGHT(pm.PenMatsID, 3)
FROM vendor v, PurchaseHeader ph, PurchaseDetail pd, PenMaterial pm, Staff s, pen p, (SELECT [Avg] = AVG(pm.PenMatsStock) FROM PenMaterial pm) as alias
WHERE v.VendorID = ph.VendorID
	AND s.staffID = ph.StaffID
	AND ph.PurchaseID = pd.PurchaseID
	AND pd.PenMatsID = pm.PenMatsID
	AND pm.PenID = p.PenID
	AND pm.PenMatsStock>alias.Avg
GROUP BY v.VendorName, ph.TransactionDate, pm.PenMatsName, pm.PenMatsID 
HAVING SUM(pd.PenMatsQuantity*pm.PenMatsPrice) > 500000
ORDER BY v.VendorName DESC

--9
CREATE VIEW ViewSalesTransaction AS
SELECT
	[StaffName] = s.StaffName,
	[CustomerName] = c.CustomerName,
	[Total Sales Transaction] = COUNT(sh.SalesID),
	[Maximum Sales] = MAX(sd.PenQuantity)
FROM Staff s, Customer c, SalesHeader sh, SalesDetail sd
WHERE c.CustomerID = sh.CustomerID
	AND s.StaffID = sh.StaffID
	AND sh.SalesID = sd.SalesID
	AND c.CustomerName LIKE ('%c%')
	GROUP BY s.StaffName, c.CustomerName
HAVING COUNT(sh.SalesID)>2

SELECT *FROM ViewSalesTransaction
DROP VIEW ViewSalesTransaction

--10
CREATE VIEW ViewPurchaseDetail AS
SELECT
	[VendorName] = v.VendorName,
	[Total Purchase Quantity] = SUM(pd.PenMatsQuantity),
	[Total Purchase Transaction] = COUNT(ph.PurchaseID)
FROM vendor v, PurchaseHeader ph, PurchaseDetail pd, staff s, PenMaterial pm
WHERE v.VendorID = ph.VendorID
	AND ph.PurchaseID = pd.PurchaseID
	AND s.StaffID = ph.StaffID
	AND s.StaffGender LIKE ('Male')
	AND pm.PenMatsID = pd.PenMatsID
GROUP BY v.VendorName
HAVING COUNT(ph.PurchaseID) > 1

SELECT *FROM ViewPurchaseDetail
DROP VIEW ViewPurchaseDetail
