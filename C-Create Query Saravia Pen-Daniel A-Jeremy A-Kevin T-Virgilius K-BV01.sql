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

--Fill
INSERT INTO Customer VALUES--10
  ('CTR001', 'Jono', 'Male', '1980-08-01', '082678901234', 'Jalan Merpati 50'),
  ('CTR002', 'Siti', 'Female', '1998-10-01', '081228452743', 'Jalan Mawar 8'),
  ('CTR003', 'Cecep', 'Male', '2002-03-14', '021398561287', 'Vila Quert 2'),
  ('CTR004', 'As', 'Male', '1980-08-01', '088212492567', 'Apartemen Doraemon'),
  ('CTR005', 'Celine', 'Female', '2004-04-12', '021484370139', 'Kampung Rambutan'),
  ('CTR006', 'Cirno', 'Female', '1987-05-17', '076412981297', 'Gensokyo'),
  ('CTR007', 'Pekora', 'Carrot', '1969-01-12', '089812768925', 'Hololive HQ'),
  ('CTR008', 'Miko', 'Hermaphrodite', '1990-02-24', '024581739258', 'Jalan Kerbau 15'),
  ('CTR009', 'Cherino', 'Female', '2007-10-27', '081214263457', 'Kivotos'),
  ('CTR010', 'George', 'androgynous', '1982-06-09', '038934781289', 'Jalan Gajah 3');


INSERT INTO Staff VALUES--10
('STF001', 'Marni', 'Female', '1999-10-19', '0378167293782', 'Jalan Kapal Selam 1', 2500000),
('STF002', 'Toni', 'Male', '1977-05-09', '0236238912777', 'Jalan Hiu 4', 3500000),
('STF003', 'Bob', 'Male', '1978-11-13', '036712782984', 'Jalan Mawar 6', 4200000),
('STF004', 'Lydia', 'Female', '1992-09-30', '08691344390', 'Apartemen Binjai', 2500000),
('STF005', 'Roger', 'Male', '2000-02-29', '0276237889343', 'Apartemen Elang', 2700000),
('STF006', 'Sussy', 'Female', '1991-01-22', '093223793189', 'Jalan Merak 13', 2500000),
('STF007', 'Joko', 'Male', '1995-11-12', '069138051703', 'Jalan Merdeka 1', 2350000),
('STF008', 'Nani', 'Female', '1989-07-29', '048217701330', 'Rusun Genji', 2500000),
('STF009', 'Nana', 'Female', '1989-07-29', '0694204206969', 'Rusun Genji', 2750000),
('STF010', 'Sugeng', 'Male', '1985-10-06', '08541278484', 'Jalan Patriot 6', 3550000);

INSERT INTO Pen VALUES--10
('PEN001', 'Beeg Juicy Pen', 25000, 230),
('PEN002', 'Beeg Dash Pen', 35000, 127),
('PEN003', 'Milky Blue Pen', 11000, 70),
('PEN004', 'Milky Rainbow Pen', 30000, 124),
('PEN005', 'Milky Fountain Pen', 43000, 102),
('PEN006', 'Miku Brush Pen', 49000, 37),
('PEN007', 'Omega Jet Pen', 16000, 46),
('PEN008', 'Omega Load Pen', 19000, 135),
('PEN009', 'Vita Saft Pen', 42000, 69),
('PEN010', 'Zleet Quicky Pen', 28000, 138);

INSERT INTO SalesHeader VALUES--15
('SLT001', 'CTR003', 'STF006', '2020-01-01', 'Paypall'),
('SLT002', 'CTR001', 'STF002', '2020-02-13', 'GoPay'),
('SLT003', 'CTR006', 'STF010', '2020-02-22', 'OVO'),
('SLT004', 'CTR007', 'STF007', '2020-03-04', 'Bank'),
('SLT005', 'CTR004', 'STF008', '2020-04-25', 'Credit'),
('SLT006', 'CTR009', 'STF003', '2020-05-16', 'Debit'),
('SLT007', 'CTR005', 'STF001', '2020-06-22', 'GooglePay'),
('SLT008', 'CTR006', 'STF009', '2020-07-25', 'Debit'),
('SLT009', 'CTR008', 'STF004', '2020-08-30', 'Bank'),
('SLT010', 'CTR002', 'STF007', '2020-09-08', 'Paypall'),
('SLT011', 'CTR004', 'STF005', '2020-09-15', 'Paypall'),
('SLT012', 'CTR003', 'STF006', '2020-09-25', 'OVO'),
('SLT013', 'CTR005', 'STF001', '2020-10-22', 'Credit'),
('SLT014', 'CTR010', 'STF010', '2020-11-18', 'GoPay'),
('SLT015', 'CTR002', 'STF002', '2020-12-25', 'Debit');

INSERT INTO SalesDetail VALUES--25
('SLT001', 'PEN006', 3),--name 'c' greater 2
('SLT001', 'PEN008', 5),--name 'c' greater 2
('SLT002', 'PEN002', 7),
('SLT002', 'PEN007', 3),
('SLT003', 'PEN004', 34), --22th greater average 
('SLT003', 'PEN010', 21), --22th greater average 
('SLT004', 'PEN002', 6), --even lower 10.
('SLT005', 'PEN009', 12), --25th 'PEN009'
('SLT005', 'PEN010', 1), --25th 'PEN009'
('SLT006', 'PEN003', 1),--name 'c' not greater 2 --even lower 10.
('SLT007', 'PEN001', 28), --22th greater average 
('SLT007', 'PEN009', 19), --22th greater average 
('SLT008', 'PEN004', 6), --name 'c' < 2
('SLT008', 'PEN006', 9), --name 'c' < 2
('SLT009', 'PEN005', 8), --even lower 10.
('SLT010', 'PEN007', 7), --9th 10
('SLT010', 'PEN010', 8), --9th 10
('SLT011', 'PEN001', 2), --9th but < 10
('SLT011', 'PEN003', 5), --9th but < 10
('SLT012', 'PEN009', 20), --25th 'PEN009'  --9th 10
('SLT013', 'PEN005', 9), --name 'c' greater 2
('SLT013', 'PEN009', 1), --name 'c' greater 2
('SLT014', 'PEN006', 1), --even lower 10.
('SLT015', 'PEN002', 3),
('SLT015', 'PEN008', 3);

INSERT INTO PenMaterial VALUES--10
('PML001', 'PEN001', 'Citric Plastic', 9200, 183),
('PML002', 'PEN002', 'Sleek Resin', 13800, 136),
('PML003', 'PEN003', 'Azure Plastic', 5200, 199),
('PML004', 'PEN004', 'Colorful Resin', 10300, 221),
('PML005', 'PEN005', 'Lycan Steel', 3700, 136),
('PML006', 'PEN005', 'Fieta Resin', 9900, 154),
('PML007', 'PEN005', 'Dark Geode', 1900, 118),
('PML008', 'PEN005', 'Gord Cartridge', 5800, 143),
('PML009', 'PEN005', 'Lerp Rubber', 3500, 234),
('PML010', 'PEN005', 'Pyroxene', 7800, 123),
('PML011', 'PEN005', 'Saint Quartz', 6400, 168),
('PML012', 'PEN006', 'Orundum', 18800, 112),
('PML013', 'PEN006', 'Vast Rubber', 2800, 289),
('PML014', 'PEN006', 'Asth Resin', 9300, 177),
('PML015', 'PEN007', 'Fleut Plastic', 6700, 138),
('PML016', 'PEN008', 'Ether Plastic', 7800, 127),
('PML017', 'PEN009', 'Jue Rubber', 8300, 234),
('PML018', 'PEN009', 'Ciy Resin', 13400, 188),
('PML019', 'PEN010', 'Swift Resin', 12900, 140);

INSERT INTO Vendor VALUES--10
('VDR001', 'Seeg Industry', 'Mercuria Complex', '0127893412578', 'seeg@idt.id'),
('VDR002', 'Destiny Corp', 'Mercuria Complex', '02489128367', 'des@tiny.co'),
('VDR003', 'Sugma Rubber Factory', 'Eterneat City', '0347123892378', 'sgm@rb.com'),
('VDR004', 'Tranquil Resin Factory', 'Elnore Complex', '0423128823625', 'tqrsn@fc.id'),
('VDR005', 'Chaldea Industry', 'Blue Fang Industrial', '05916942069', 'chaldea@idt.com'),
('VDR006', 'Kivotos Production', 'Blue Fang Industrial', '06661373823', 'kiv@tos.co'),
('VDR007', 'Azure Trading Company', 'Blue Fang Industrial', '0728347344734', 'azt@cp.co'),
('VDR008', 'Iris Core Industry', 'Unilet Complex', '08851872267', 'iriscore@idt.id'),
('VDR009', 'Crimson Witch Production', 'Red Lane City', '0867372345834', 'crm@wi.pro'),
('VDR010', 'Inazuma Corp', 'Raiden Town', '09871234656', 'in@zuma.co');

INSERT INTO PurchaseHeader VALUES--15
('PCT001', 'STF004', 'VDR010', '2015-04-17', 'Credit'),
('PCT002', 'STF007', 'VDR005', '2015-10-11', 'GoPay'),
('PCT003', 'STF009', 'VDR008', '2016-06-15', 'OVO'),
('PCT004', 'STF005', 'VDR001', '2016-12-26', 'Bank'),
('PCT005', 'STF002', 'VDR009', '2017-02-05', 'Paypall'),
('PCT006', 'STF001', 'VDR003', '2017-05-16', 'Debit'),
('PCT007', 'STF005', 'VDR001', '2018-06-22', 'GooglePay'),
('PCT008', 'STF006', 'VDR009', '2018-07-25', 'Debit'),
('PCT009', 'STF003', 'VDR005', '2019-08-30', 'Bank'),
('PCT010', 'STF002', 'VDR007', '2019-09-08', 'Paypall'),
('PCT011', 'STF008', 'VDR005', '2020-09-15', 'Paypall'),
('PCT012', 'STF010', 'VDR006', '2020-09-25', 'OVO'),
('PCT013', 'STF005', 'VDR001', '2021-03-21', 'Credit'),
('PCT014', 'STF010', 'VDR004', '2021-11-18', 'GoPay'),
('PCT015', 'STF009', 'VDR002', '2021-12-25', 'Debit');

INSERT INTO PurchaseDetail VALUES--25
('PCT001', 'PML005', 7), --'Milky' Total > 6.
('PCT001', 'PML006', 5), --'Milky' Total > 6.
('PCT001', 'PML007', 4), --'Milky' Total > 6.
('PCT001', 'PML008', 8), --'Milky' Total > 6.
('PCT001', 'PML009', 5), --'Milky' Total > 6.
('PCT001', 'PML010', 9), --'Milky' Total > 6.
('PCT001', 'PML011', 11), --'Milky' Total > 6.
('PCT002', 'PML012', 3), --p greater average ' Industry' --q lower average sunday
('PCT003', 'PML001', 1),
('PCT003', 'PML002', 7),
('PCT003', 'PML003', 4),
('PCT004', 'PML002', 17), --p greater average ' Industry' --staff male count > 1
('PCT005', 'PML015', 2), --q lower average sunday --staff male count > 1
('PCT006', 'PML004', 50), --s greater average >500k 
('PCT007', 'PML015', 12), --staff male count > 1
('PCT008', 'PML016', 9),
('PCT009', 'PML018', 40), --s greater average >500k --p greater average ' Industry'
('PCT010', 'PML012', 2), --staff male count > 1 --sunday
('PCT011', 'PML013', 8),
('PCT012', 'PML014', 20), --staff male count > 1
('PCT013', 'PML017', 2), --q lower average sunday
('PCT014', 'PML018', 18), --staff male count > 1
('PCT015', 'PML001', 2),
('PCT015', 'PML012', 7),
('PCT015', 'PML019', 4);