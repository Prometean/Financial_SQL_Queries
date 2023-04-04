SELECT  DATEPART(YEAR, date) AS year,
        DATEPART(QUARTER, date) AS quarter,
        COUNT(amount) AS number_of_transactions
FROM card_transaction
GROUP BY EXTRACT(YEAR FROM date), EXTRACT(QUARTER FROM date)
ORDER BY EXTRACT(YEAR FROM date) ASC, EXTRACT(QUARTER FROM date);