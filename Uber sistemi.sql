USE UBER_SİSTEMİ 

CREATE TABLE USERS(
    İd int PRIMARY KEY IDENTITY,
    Ad nvarchar(30),
    Soyad nvarchar(40),
    Elaqe_nomresi varchar(15),
    Email varchar(50),
    Hesabin_yaranma_tarixi DATETIME,
    Username nvarchar(20),
    Rating FLOAT
)
 
CREATE TABLE DRİVERS(
    İd int PRIMARY KEY IDENTITY,
    Ad nvarchar(30),
    Soyad nvarchar(35),
    Elaqe_nomresi varchar(15),
    Sürücü_vesiqesi varchar(10),
    Qeydiyyat_nomresi varchar(10),
    Rating FLOAT,
    [STATUS] nvarchar(20)
)

CREATE TABLE VEHICLES(
    İd int PRIMARY KEY IDENTITY,
    Marka nvarchar(20),
    Model NVARCHAR (20),
    Reng NVARCHAR (20),
    İl int,
    Qeydiyyat_nomresi varchar(10),
    Sürücü_vesiqesi varchar(15)
)
CREATE TABLE Rides(
    İd int PRIMARY KEY IDENTITY,
    User_id int,
    Driver_id int,
    Vehicle_id int,
    Baslangic_noqte nvarchar(40),
    Bitis_noqte nvarchar(40),
    [Status] nvarchar(20),
    Baslangic_tarix DATETIME2,
    Bitis_tarix DATETIME2,
    Qiymet decimal,
    Ödenis_metodu nvarchar(20)
)

INSERT INTO USERS
VALUES
('EMIL', 'CEFEROV','+994506135585','emil@gmail.com','12.10.2024', 'emil1','4.5'),
('EHMED', 'HESENOV', '+994506135575', 'ehmed@gmail.com','10.10.2024', 'ehmedd1', '3.2'),
('ELI', 'MEMMEDLI', '+994506135565', 'eli@gmail.com', '09.06.2024', 'eli123', '2.6'),
('ASIF', 'RECEBOV', '+994997770420', 'asifrecebov@gmail.com', '05.06.2024', 'asifrecebov1', '4.2'),
('ASLAN', 'KERIMOV', '+994505506565', 'aslan25@gmail.com', '02.03.2024', 'aslankerimov20', '4.8')

INSERT INTO DRİVERS
VALUES
('TURAN','ABBASZADE','+994505509111', 'BA123123','90-TA-001', '3.2','isleyir'),
('FERID','BABAZADE', '+994507774466', 'BA121121', '99-FB-002', '2.9','isleyir'),
('ELVIN','BAXISOV','+994997779656', 'BA125125','10-EB-003', '4.9','isleyir'),
('VUSAL','CEFEROV', '+994773061813', 'BA009009', '10-VC-777', '4.8','isden cixib'),
('RAMAZAN','ABDULOV', '+994557556767', 'BA850850','10-RA-675', '4.7', 'isleyir'),
('CELAL', 'XELILOV', '+994557897878', 'BA099099', '10-CX-007', '3.5', 'icazelidir')

INSERT INTO VEHICLES
VALUES
('BYD','SEAL', 'QARA', 2023, '90-TA-001', 'BA123123'),
('FORD','FUSION','AG', 2012, '99-FB-002', 'BA121121'),
('VOLKSWAGEN','JETTA','GUMUSU', 2010, '10-EB-003', 'BA125125'),
('CHEVROLET', 'CRUZE','QARA', 2011, '10-VC-777', 'BA009009'),
('BYD','DESTROYER','AG', 2024, '10-RA-675','BA850850'),
('HYUNDAI','AVANTE','GUMUSU',2014,'10-CX-007', 'BA099099')

INSERT INTO Rides 
VALUES 
(1, 5, 3, 'ZAHID XELILOV 25A', 'ECEMI NAXCIVANI 8', 'TAMAMLANDI', '01.11.2024 13:11', '01.11.2024 13:11', 6.7, 'KART'),
(2, 4, 4, '240 NOMRELI MEKTEV,4MKR', 'YENI KLINIKA','TAMAMLANDI', '10.11.2024', '10.11.2024', 9.2, 'NAGD'),
(3,6,5,'HESEN BEY ZERDABI 88A', '20 YANVAR,49', 'TAMAMLANDI', '05.08.2024', '05.08.2024', 4.4, 'NAGD')

