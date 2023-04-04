SELECT  ct.date,
        SUM(ct.amount) AS daily_sum,
        (SUM(ct.amount)-LAG(SUM(ct.amount)) OVER (ORDER BY ct.date ASC))
AS daily_difference,
        co.country_name
FROM card_transaction ct
JOIN card_number cn ON ct.card_number_id = cn.id
JOIN customer cu ON cn.customer_id = cu.id
JOIN country co ON cu.country_id = co.id
WHERE ct.date > '2020-11-30' AND date <= '2020-12-31'
AND co.country_name = 'China'
GROUP BY ct.date, co.country_name;