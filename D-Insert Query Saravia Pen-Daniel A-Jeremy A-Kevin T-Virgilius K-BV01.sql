--Daniel Alexander 2440006715
--Jeremy Andrew Jayaseputra 2440007075
--Kevin Tjandra Wijaya 2440008102
--Virgilius Karel 2440008140

USE SaraviaPen

SELECT *FROM Customer
SELECT *FROM Staff
SELECT *FROM Pen
SELECT *FROM SalesHeader
SELECT *FROM SalesDetail
SELECT *FROM PenMaterial
SELECT *FROM Vendor
SELECT *FROM PurchaseHeader
SELECT *FROM PurchaseDetail

--Sales
INSERT INTO SalesHeader VALUES
('SLT016', 'CTR001', 'STF003', '2020-12-30', 'GoPay');

INSERT INTO SalesDetail VALUES
('SLT016', 'PEN001', 6),
('SLT016', 'PEN003', 2);

--Purchase
INSERT INTO PurchaseHeader VALUES
('PCT016', 'STF002', 'VDR005', '2021-12-28', 'Bank');

INSERT INTO PurchaseDetail VALUES
('PCT016', 'PML007', 12),
('PCT016', 'PML002', 3);