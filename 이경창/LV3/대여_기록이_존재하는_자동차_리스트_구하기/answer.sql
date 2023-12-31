-- mysql
SELECT DISTINCT CAR.CAR_ID
FROM CAR_RENTAL_COMPANY_CAR AS CAR
         INNER JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY AS HISTORY ON CAR.CAR_ID = HISTORY.CAR_ID
WHERE (CAR.CAR_TYPE = '세단') AND (MONTH(HISTORY.START_DATE) = 10)
ORDER BY CAR.CAR_ID DESC;


-- oracle
-- 코드를 입력하세요
SELECT DISTINCT CAR.CAR_ID
FROM CAR_RENTAL_COMPANY_CAR CAR
         INNER JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY HISTORY ON CAR.CAR_ID = HISTORY.CAR_ID
WHERE (CAR.CAR_TYPE = '세단') AND TO_CHAR(HISTORY.START_DATE, 'MM') = 10
ORDER BY CAR.CAR_ID DESC;
