-- MySQL
SELECT MONTH(START_DATE) AS MONTH, CAR_ID, COUNT(HISTORY_ID) AS RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE CAR_ID IN (
    SELECT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE (DATE_FORMAT(START_DATE, '%Y-%m') BETWEEN '2022-08' AND '2022-10')
    GROUP BY CAR_ID
    HAVING COUNT(CAR_ID) >= 5
    )
GROUP BY MONTH, CAR_ID
HAVING RECORDS > 0
ORDER BY MONTH, CAR_ID DESC;


-- Oracle
-- 코드를 입력하세요
SELECT EXTRACT(MONTH FROM START_DATE) AS MONTH, CAR_ID, COUNT(HISTORY_ID) AS RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE CAR_ID IN (
    SELECT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE START_DATE BETWEEN TO_DATE('2022-08-01', 'YYYY-MM-DD') AND TO_DATE ('2022-10-31', 'YYYY-MM-DD')
    GROUP BY CAR_ID
    HAVING COUNT(CAR_ID) >= 5
    ) AND START_DATE BETWEEN TO_DATE('2022-08-01', 'YYYY-MM-DD') AND TO_DATE ('2022-10-31', 'YYYY-MM-DD')
GROUP BY EXTRACT(MONTH FROM START_DATE), CAR_ID
HAVING COUNT(*) > 0
ORDER BY EXTRACT(MONTH FROM START_DATE), CAR_ID DESC;