
Create database KOMPUTER_MAGAZA
use KOMPUTER_MAGAZA
CREATE TABLE MEHSULLAR(
    ID INT PRIMARY KEY IDENTITY,
    MEHSUL_ADI NVARCHAR(30) NOT NULL,
    MODEL NVARCHAR(25),
    MEHSUL_KATEQORIYASI NVARCHAR(35),
    QIYMET INT,
    SAY INT,
    FILIAL NVARCHAR(25)
)


INSERT INTO MEHSULLAR
VALUES
('HP', 'VICTUS 5', 'OYUN', 2100,5,'GENCLIK'),
('HP', 'ELITEBOOK','DIZUSTU NOUTBUK', 3100,6, 'AZADLIQ'),
('HP', 'VICTUS 5', 'OYUN', 2100, 8, 'INSAATCILAR'),
('DELL', '14PLUS', 'SENSOR EKRANLI', 2900,3, 'NERIMANOV'),
('ACER', 'NITRO LITE','OYUN',2400,6, 'NERIMANOV')


CREATE TABLE ISCILER(
ID INT PRIMARY KEY IDENTITY,
AD NVARCHAR(30) NOT NULL,
SOYAD NVARCHAR(45) NOT NULL,
ATA_ADI NVARCHAR(30),
YAS INT,
)

INSERT INTO ISCILER
VALUES
('MURAD','CABBARLI','RAMIL', 23),
('AMIL', 'ESEDOV', 'ZAKIR', 27),
('MURAD', 'XELILOV', 'ELI', 20),
('ASIF','CEFERLI', 'FERID', 25),
('EHMED','FERECOV','ELNUR', 22)

CREATE TABLE SATIS_CEDVEL(
    ID INT PRIMARY KEY IDENTITY,
    MEHSUL_ADI NVARCHAR(25),
    MODEL NVARCHAR(20),
    ISCI_AD_SOYAD NVARCHAR(25),
    SATIS_SAYI INT,
    SATIS_MEBLEGI INT,
    FILIAL NVARCHAR(25)
)


INSERT INTO SATIS_CEDVEL
VALUES
('HP', 'VICTUS 5', 'MURAD CABBARLI', 1, 2100, 'GENCLIK'),
('ACER', 'NITRO LITE','ASIF CEFERLI', 2, 4800, 'NERIMANOV'),
('DELL','14PLUS', 'EHMED FERECOV', 1, 2900,'NERIMANOV'),
('HP', 'ELITEBOOK', 'MURAD XELILOV', 1, 3100, 'AZADLIQ'),
('HP', 'VICTUS 5', 'AMIL ESEDOV', 3, 6300, 'INSAATCILAR')


--1. Bütün məhsulların siyahısına baxmaq üçün sorğu yazın

SELECT*FROM MEHSULLAR



 --2. Bütün işçilərin siyahısına baxmaq üçün sorğu yazın

SELECT*FROM ISCILER


 --3. Məhsullara kateqoriyaları ilə birgə baxmaq üçün sorğu yazın

SELECT MEHSUL_ADI,MODEL,MEHSUL_KATEQORIYASI FROM MEHSULLAR

 --4. Adı Murad olan işçinin məlumatlarına baxmaq üçün sorğu yazın

 SELECT* FROM ISCILER 
 WHERE AD= 'MURAD'


 --5. Yaşı 25-dən kiçik olan işçilərin siyahısına baxmaq üçün sorğu

SELECT*FROM ISCILER
WHERE YAS<25

 --6. Hər modeldən neçə məhsulun olduğunu tapın

SELECT MODEL, SAY FROM MEHSULLAR


 --7. Hər markada hər modelin neçə məhsulu olduğunu tapın

SELECT MEHSUL_ADI, MODEL, SAY FROM MEHSULLAR


 --8. Hər filial üzrə aylıq satış məbləğinin hesablanması

SELECT satis_meblegi, filial
From SATIS_CEDVEL
Group BY
SATIS_MEBLEGI, FILIAL


 --9. Ay ərzində ən çox satış olunan model


SELECT MODEL, SATIS_MEBLEGI
FROM SATIS_CEDVEL
WHERE SATIS_MEBLEGI = (SELECT MAX(SATIS_MEBLEGI) FROM SATIS_CEDVEL)


 --10. Ay ərzində ən az satış edən işçi

select * from SATIS_CEDVEL

SELECT ISCI_AD_SOYAD, SATIS_MEBLEGI
FROM SATIS_CEDVEL
WHERE SATIS_MEBLEGI= (SELECT MIN(SATIS_MEBLEGI) FROM SATIS_CEDVEL)


 --11. Ay ərzində 3000-dən çox satış edən işçilərin siyahısı

SELECT ISCI_AD_SOYAD, SATIS_MEBLEGI
FROM SATIS_CEDVEL
WHERE SATIS_MEBLEGI>3000



 --12. İşcilərin ad soyad və ata adlarını eyni xanada göstərən sorğu yazın

SELECT CONCAT (AD,' ',SOYAD,' ' ,ATA_ADI, ' ' ) AS TAM_MELUMAT
FROM ISCILER


 --13. Məhsulun ad və qarşısında adın uzunluğunu göstərən sorğu yazın. Məs : Lenova (7)
SELECT CONCAT(MEHSUL_ADI, ' ',(LEN(MEHSUL_ADI))) AS MELUMAT
FROM MEHSULLAR


 --14. Ən bahalı Məhsulu göstərən sorğu yazın

SELECT MEHSUL_ADI, MODEL, QIYMET
FROM MEHSULLAR
WHERE QIYMET= (SELECT MAX(QIYMET) FROM MEHSULLAR)

 --15. Ən bahalı və ən ucuz məhsulu eyni sorğuda göstərin
 
 SELECT TOP 1 'En Bahali' AS  MEHSUL_ADI,QIYMET 
FROM MEHSULLAR
WHERE QIYMET =(SELECT MAX(QIYMET)FROM MEHSULLAR)

UNION ALL

SELECT TOP 1 'En Ucuz' AS  MEHSUL_ADI, QIYMET
FROM MEHSULLAR
WHERE QIYMET= (SELECT MIN(QIYMET) FROM MEHSULLAR)



--16.⁠ ⁠Məhsulları qiymətinə görə kateqoriyalara bölün. Qiyməti: (when case ile edilir)
 --1000AZN-dən aşağı – münasib
 --1000-2500AZN –orta qiymətli
 --2500-dən yuxarı – baha olaraq qeyd edin

SELECT 
    MODEL,
    QIYMET,
    CASE 
        WHEN QIYMET < 1000 THEN 'MUNASIB'
        WHEN QIYMET BETWEEN 1000 AND 2500 THEN 'ORTA QIYMETLI'
        WHEN QIYMET > 2500 THEN 'BAHA'
        ELSE 'QEYRI MUEYYEN'
    END AS QIYMET_KATEQORIYA
FROM MEHSULLAR;


 --17. Cari ayda olan bütün satışların cəmini tapın

SELECT SUM(SATIS_MEBLEGI) as UMUMI_SATIS
from SATIS_CEDVEL



 --18. Cari ayda ən çox satış edən işçinin məlumatlarını çıxaran sorğu yazın 

SELECT ISCI_AD_SOYAD, SATIS_MEBLEGI
FROM SATIS_CEDVEL
WHERE SATIS_MEBLEGI= (SELECT MAX(SATIS_MEBLEGI) FROM SATIS_CEDVEL)




--19.⁠ ⁠Cari ayda ən çox qazanc gətirən işçinin məlumatlarını çıxaran sorğu yazın


-

 --20. Ən çox satış edən işçinin cari ay maaşını 50% artırın

 -