SELECT  U.NAMESURNAME , U.EMAIL , U.GENDER , C.COUNTRY ,CT.CITY , T.TOWN , D.DISTRICT  , A.POSTALCODE ,A.ADDRESSTEXT FROM 
USERS U , ADDRESS A , COUNTRIES C , CITIES CT,DISTRICTS D , TOWNS T 
WHERE 
U.ID = A.USERID AND C.ID = A.COUNTRYID AND CT.ID = A.CITYID 
AND T.ID = A.TOWNID AND D.ID = A.DISTRICTID 
AND CT.CITY LIKE 'TEK�RDA�'
--AND U.ID=4 
--ORDER BY U.NAMESURNAME 

-- ----------------------------------------------------------------------------------------------
SELECT 
U.NAMESURNAME ,  COUNT(A.ID) [ADRES SAY�S�] , COUNT(DISTINCT C.ID) AS ULKESAY�S�
, COUNT(DISTINCT CT.ID) SEH�RSAY�S�
FROM 
USERS U , ADDRESS A , COUNTRIES C , CITIES CT,DISTRICTS D , TOWNS T 
WHERE 
U.ID = A.USERID AND C.ID = A.COUNTRYID AND CT.ID = A.CITYID 
AND T.ID = A.TOWNID AND D.ID = A.DISTRICTID 
GROUP BY U.NAMESURNAME

HAVING COUNT(A.ID)>2


-- ------------------------------------------------------------------------------------------------

SELECT 
 CT.CITY , COUNT(U.ID) KISISAYISI ,
 COUNT(DISTINCT D.DISTRICT) ILCESAYISI
FROM 
USERS U , ADDRESS A , COUNTRIES C , CITIES CT,DISTRICTS D , TOWNS T 

WHERE 
U.ID = A.USERID AND C.ID = A.COUNTRYID AND CT.ID = A.CITYID 
AND T.ID = A.TOWNID AND D.ID = A.DISTRICTID 

GROUP BY  CT.CITY 

ORDER BY 2 DESC

-- ------------------------------------------------------------------------------------------------

-----------------------JOINNNLERR

SELECT 
U.NAMESURNAME , U.EMAIL , C.COUNTRY , CT.CITY ,T.TOWN ,D.DISTRICT, A.ADDRESSTEXT
FROM 
USERS U 
JOIN ADDRESS A 
ON
A.USERID = U.ID
JOIN COUNTRIES C
ON
C.ID = A.COUNTRYID
JOIN CITIES CT
ON 
CT.ID = A.CITYID
JOIN TOWNS T 
ON 
T.ID = A.TOWNID
JOIN	
DISTRICTS D 
ON
D.ID = A.DISTRICTID
WHERE U.ID = 1

-- ------------------------------------------------------------------------------------------------


SELECT 
CT.CITY , COUNT(U.ID) KISISAYISI
FROM 
USERS U 
JOIN ADDRESS A 
ON
A.USERID = U.ID
JOIN COUNTRIES C
ON
C.ID = A.COUNTRYID
JOIN CITIES CT
ON 
CT.ID = A.CITYID
JOIN TOWNS T 
ON 
T.ID = A.TOWNID
JOIN	
DISTRICTS D 
ON
D.ID = A.DISTRICTID

GROUP BY CT.CITY


 --K.ADI , AD SOYAD �L �L�E SEMT A�IK ADRES
--S�PAR�� ID TAR�H  TOPLAM TUTAR �DEME TAR�H� 
--BANKA ONAY KODU FATURA TAR�H� KARGO F�� NO

SELECT
U.USERNAME_ AS KULLANICIADI, U.NAMESURNAME AS ADSOYAD, CT.CITY AS IL , D.DISTRICT AS ILCE , T.TOWN AS SEMT,
A.ADDRESSTEXT AS ACIKADRES, O.ID AS SIPARISID, O.DATE_ AS TARIH, O.TOTALPRICE AS TOPLAMTUTAR, P.DATE_ AS ODEMETARIHI,
P.APPROVECODE AS ONAYKODU, I.DATE_ AS FATURATARIHI, I.CARGOFICHENO AS KARGOF�SNO
FROM 
 ORDERS O 
 INNER JOIN USERS U  ON O.USERID = U.ID
 INNER JOIN ADDRESS A ON O.ADDRESSID = A.ID
 INNER JOIN CITIES CT ON A.CITYID = CT.ID
 INNER JOIN DISTRICTS D ON A.DISTRICTID = D.ID
 INNER JOIN TOWNS T	ON	A.TOWNID = T.ID
 INNER JOIN PAYMENTS P ON P.ORDERID = O.ID
 INNER JOIN INVOICES I ON I.ORDERID = O.ID

 WHERE U.NAMESURNAME = 'Ceyda GEZG�NC�'


 -- �STTEK� �RNEKTE YAPTIGIMIZ SORGUNUN �R�N DETAYLARINI G�RME �RNEK OLARAK CEYDA GEZGNC�N�N S�PAR��ID S� 3515 OLAN S�PAR��� �NCEL�CEM

SELECT
	U.USERNAME_ AS KULLANICIADI, U.NAMESURNAME AS ADSOYAD, CT.CITY AS IL , D.DISTRICT AS ILCE , T.TOWN AS SEMT,
	A.ADDRESSTEXT AS ACIKADRES, O.ID AS SIPARISID, O.DATE_ AS TARIH, O.TOTALPRICE AS TOPLAMTUTAR, P.DATE_ AS ODEMETARIHI,
	P.APPROVECODE AS ONAYKODU, I.DATE_ AS FATURATARIHI, I.CARGOFICHENO AS KARGOF�SNO,
	ITM.ITEMCODE AS URUNKODU, ITM.ITEMNAME AS URUNADI , OD.AMOUNT AS MIKTAR , OD.UNITPRICE AS BIRIMF�YAT, OD.LINETOTAL AS SATIRTOPLAM

FROM 
	 ORDERS O 
	 INNER JOIN USERS U  ON O.USERID = U.ID
	 INNER JOIN ADDRESS A ON O.ADDRESSID = A.ID
	 INNER JOIN CITIES CT ON A.CITYID = CT.ID
	 INNER JOIN DISTRICTS D ON A.DISTRICTID = D.ID
	 INNER JOIN TOWNS T	ON	A.TOWNID = T.ID
	 INNER JOIN PAYMENTS P ON P.ORDERID = O.ID
	 INNER JOIN INVOICES I ON I.ORDERID = O.ID
	 INNER JOIN ORDERDETAILS OD ON OD.ORDERID = O.ID
	 INNER JOIN ITEMS ITM ON OD.ITEMID = ITM.ID

 WHERE O.ID = 26121
 --WHERE U.NAMESURNAME = 'Ceyda GEZG�NC�'




 --�EH�RLERE G�RE TOPLAM VERLEN S�PAR�� M�KTARLARI

 SELECT
	CT.CITY IL ,
	SUM(OD.LINETOTAL) TOPLAMSIPARISTUTARI,
	SUM(OD.AMOUNT) TOPLAMSIPARISADEDI,
	COUNT(OD.ID)TOPLAMSIPARISSAYISI

FROM 
	 ORDERS O 
	 INNER JOIN USERS U  ON O.USERID = U.ID
	 INNER JOIN ADDRESS A ON O.ADDRESSID = A.ID
	 INNER JOIN CITIES CT ON A.CITYID = CT.ID
	 INNER JOIN DISTRICTS D ON A.DISTRICTID = D.ID
	 INNER JOIN TOWNS T	ON	A.TOWNID = T.ID
	 INNER JOIN PAYMENTS P ON P.ORDERID = O.ID
	 INNER JOIN INVOICES I ON I.ORDERID = O.ID
	 INNER JOIN ORDERDETAILS OD ON OD.ORDERID = O.ID
	 INNER JOIN ITEMS ITM ON OD.ITEMID = ITM.ID
	 
GROUP BY CT.CITY 
ORDER BY 1



--�R�N KATEGOR�LER�NE G�RE  S�PAR�� DAGILIMLARI

 SELECT
	ITM.CATEGORY1,ITM.CATEGORY2,ITM.CATEGORY3,
	SUM(OD.LINETOTAL) TOPLAMSIPARISTUTARI,
	SUM(OD.AMOUNT) TOPLAMSIPARISADEDI,
	COUNT(OD.ID)TOPLAMSIPARISSAYISI,
	SUM(OD.LINETOTAL)/SUM(OD.AMOUNT) AS ORTALAMABIRIMFIYAT

FROM 
	 ORDERS O 
	 INNER JOIN USERS U  ON O.USERID = U.ID
	 INNER JOIN ADDRESS A ON O.ADDRESSID = A.ID
	 INNER JOIN CITIES CT ON A.CITYID = CT.ID
	 INNER JOIN DISTRICTS D ON A.DISTRICTID = D.ID
	 INNER JOIN TOWNS T	ON	A.TOWNID = T.ID
	 INNER JOIN PAYMENTS P ON P.ORDERID = O.ID
	 INNER JOIN INVOICES I ON I.ORDERID = O.ID
	 INNER JOIN ORDERDETAILS OD ON OD.ORDERID = O.ID
	 INNER JOIN ITEMS ITM ON OD.ITEMID = ITM.ID

--WHERE CATEGORY1 = 'KOZMETIK'
GROUP BY ITM.CATEGORY1,ITM.CATEGORY2,ITM.CATEGORY3
ORDER BY 1,2,3 




--TAR�HE G�RE S�PAR�� DAGILIMINI GET�REN SORGU

SELECT
	CONVERT(DATE,O.DATE_) AS TAR�H,
	SUM(OD.LINETOTAL) AS TOPLAMSIPARIS_TUTAR,
	SUM(OD.AMOUNT) AS TOPLAMSIPARIS_MIKTAR,
	COUNT(OD.ID) AS TOPLAMSIPARIS_SAYISI

FROM 
	 ORDERS O 
	 INNER JOIN USERS U  ON O.USERID = U.ID
	 INNER JOIN ADDRESS A ON O.ADDRESSID = A.ID
	 INNER JOIN CITIES CT ON A.CITYID = CT.ID
	 INNER JOIN DISTRICTS D ON A.DISTRICTID = D.ID
	 INNER JOIN TOWNS T	ON	A.TOWNID = T.ID
	 INNER JOIN PAYMENTS P ON P.ORDERID = O.ID
	 INNER JOIN INVOICES I ON I.ORDERID = O.ID
	 INNER JOIN ORDERDETAILS OD ON OD.ORDERID = O.ID
	 INNER JOIN ITEMS ITM ON OD.ITEMID = ITM.ID

GROUP BY CONVERT(DATE,O.DATE_) 
ORDER BY 1


--AYLARA G�RE S�PAR�� DAGILIMINI GET�REN SORGU

SELECT

	DATEPART(YEAR,O.DATE_) AS YIL,
	DATEPART(MONTH,O.DATE_) AS AY, -- AYLARI SADECE RAKAMLA YAZDIRIR 
	CASE 
		WHEN DATEPART(MONTH,O.DATE_) = 1 THEN 'OCAK'
		WHEN DATEPART(MONTH,O.DATE_) = 2 THEN 'SUBAT'
		WHEN DATEPART(MONTH,O.DATE_) = 3 THEN 'MART'
		WHEN DATEPART(MONTH,O.DATE_) = 4 THEN 'N�SAN'
		WHEN DATEPART(MONTH,O.DATE_) = 5 THEN 'MAYIS'
		WHEN DATEPART(MONTH,O.DATE_) = 6 THEN 'HAZIRAN'
		WHEN DATEPART(MONTH,O.DATE_) = 7 THEN 'TEMMUZ'
		WHEN DATEPART(MONTH,O.DATE_) = 8 THEN 'AGUSTOS'
		WHEN DATEPART(MONTH,O.DATE_) = 9 THEN 'EYLUL'
		WHEN DATEPART(MONTH,O.DATE_) = 10 THEN 'EKIM'
		WHEN DATEPART(MONTH,O.DATE_) = 11 THEN 'KASIM'
		WHEN DATEPART(MONTH,O.DATE_) = 12 THEN 'ARALIK'

		END AS AYADI,

	SUM(OD.LINETOTAL) AS TOPLAMSIPARIS_TUTAR,
	SUM(OD.AMOUNT) AS TOPLAMSIPARIS_MIKTAR,
	COUNT(OD.ID) AS TOPLAMSIPARIS_SAYISI

FROM 
	 ORDERS O 
	 INNER JOIN USERS U  ON O.USERID = U.ID
	 INNER JOIN ADDRESS A ON O.ADDRESSID = A.ID
	 INNER JOIN CITIES CT ON A.CITYID = CT.ID
	 INNER JOIN DISTRICTS D ON A.DISTRICTID = D.ID
	 INNER JOIN TOWNS T	ON	A.TOWNID = T.ID
	 INNER JOIN PAYMENTS P ON P.ORDERID = O.ID
	 INNER JOIN INVOICES I ON I.ORDERID = O.ID
	 INNER JOIN ORDERDETAILS OD ON OD.ORDERID = O.ID
	 INNER JOIN ITEMS ITM ON OD.ITEMID = ITM.ID

GROUP BY DATEPART(YEAR,O.DATE_) , DATEPART(MONTH,O.DATE_)
ORDER BY 2,1



--�DEME T�R�NE G�RE DA�ILIM

SELECT

	DATEPART(YEAR, DATE_) AS YIL ,
	DATEPART(MONTH, DATE_) AS AY ,

CASE 
	WHEN PAYMENTTYPE=1 THEN 'KRED� KARTI'
	WHEN PAYMENTTYPE=2 THEN 'BANKA HAVALES�'
	END ODEMETURU,
	SUM(PAYMENTTOTAL)AS ODEMETUTAR

FROM PAYMENTS
GROUP BY DATEPART(YEAR, DATE_) , PAYMENTTYPE,DATEPART(MONTH, DATE_)
ORDER BY 1,2



--ORTALAMA TESL�MAT S�RES�

SELECT

	--O.ID AS SIPARISID,
	--O.DATE_ AS SIPARISTARIHI,
	--I.DATE_ AS FATURATARIHI,
	
	MIN(DATEDIFF(HOUR ,O.DATE_, I.DATE_)) AS ENKISA_TESLIMATSURESI_SAAT,
	MAX(DATEDIFF(HOUR ,O.DATE_, I.DATE_)) AS ENUZUN_TESLIMATSURESI_SAAT,
	AVG(DATEDIFF(HOUR ,O.DATE_, I.DATE_)) AS ORTALAMA_TESLIMATSURESI_SAAT

	
FROM  ORDERS O 
	 INNER JOIN USERS U  ON O.USERID = U.ID
	 INNER JOIN ADDRESS A ON O.ADDRESSID = A.ID
	 INNER JOIN CITIES CT ON A.CITYID = CT.ID
	 INNER JOIN DISTRICTS D ON A.DISTRICTID = D.ID
	 INNER JOIN TOWNS T	ON	A.TOWNID = T.ID
	 INNER JOIN PAYMENTS P ON P.ORDERID = O.ID
	 INNER JOIN INVOICES I ON I.ORDERID = O.ID
		 
	--GROUP BY O.ID , O.DATE_ ,I.DATE_


--MUSTERI ORTALAMA TESL�MAT S�RES�

SELECT

	U.ID AS ID,
	U.NAMESURNAME AS ADSOYAD,
	AVG(DATEDIFF(HOUR ,O.DATE_, I.DATE_)) AS ORTALAMA_TESLIMATSURESI_SAAT,
	MIN(DATEDIFF(HOUR ,O.DATE_, I.DATE_)) AS ENKISA_TESLIMATSURESI_SAAT,
	MAX(DATEDIFF(HOUR ,O.DATE_, I.DATE_)) AS ENUZUN_TESLIMATSURESI_SAAT,
	SUM(O.TOTALPRICE) AS TOPLAM_SIPARIS_TUTARI,
	COUNT(O.ID) AS SIPARISSAYISI

	
FROM  ORDERS O 
	 INNER JOIN USERS U  ON O.USERID = U.ID
	 INNER JOIN ADDRESS A ON O.ADDRESSID = A.ID
	 INNER JOIN CITIES CT ON A.CITYID = CT.ID
	 INNER JOIN DISTRICTS D ON A.DISTRICTID = D.ID
	 INNER JOIN TOWNS T	ON	A.TOWNID = T.ID
	 INNER JOIN PAYMENTS P ON P.ORDERID = O.ID
	 INNER JOIN INVOICES I ON I.ORDERID = O.ID

GROUP BY U.ID , U.NAMESURNAME 
HAVING AVG(DATEDIFF(HOUR ,O.DATE_, I.DATE_)) > 22
ORDER BY 6 DESC



--AYLARA G�RE ORTALAMA TESL�MAT S�RES�

SELECT

	--DATEPART(YEAR,O.DATE_) AS YIL,
	--DATEPART(MONTH,O.DATE_) AS AY,
	CT.CITY,
	AVG(DATEDIFF(HOUR ,O.DATE_, I.DATE_)) AS ORTALAMA_TESLIMATSURESI_SAAT,
	MIN(DATEDIFF(HOUR ,O.DATE_, I.DATE_)) AS ENKISA_TESLIMATSURESI_SAAT,
	MAX(DATEDIFF(HOUR ,O.DATE_, I.DATE_)) AS ENUZUN_TESLIMATSURESI_SAAT,
	SUM(O.TOTALPRICE) AS TOPLAM_SIPARIS_TUTARI,
	COUNT(O.ID) AS SIPARISSAYISI

	
FROM  ORDERS O 
	 INNER JOIN USERS U  ON O.USERID = U.ID
	 INNER JOIN ADDRESS A ON O.ADDRESSID = A.ID
	 INNER JOIN CITIES CT ON A.CITYID = CT.ID
	 INNER JOIN DISTRICTS D ON A.DISTRICTID = D.ID
	 INNER JOIN TOWNS T	ON	A.TOWNID = T.ID
	 INNER JOIN PAYMENTS P ON P.ORDERID = O.ID
	 INNER JOIN INVOICES I ON I.ORDERID = O.ID

--GROUP BY  DATEPART(YEAR,O.DATE_),  DATEPART(MONTH,O.DATE_) 
GROUP BY  CT.CITY 
ORDER BY 2 DESC