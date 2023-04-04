SELECT  ct.date,
        cty.card_type_name,
        SUM(ct.amount) AS daily_sum,
        AVG(SUM(ct.amount)) OVER (ORDER BY ct.date ASC ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS transaction_running_average
FROM card_transaction ct
JOIN card_number cn ON ct.card_number_id = cn.id
JOIN card_type cty ON cn.card_type_id = cty.id
WHERE ct.date > '2020-11-30' AND date <= '2020-12-31'
AND cty.card_type_name = 'visa-electron'
GROUP BY ct.date, cty.card_type_name
ORDER BY cty.card_type_name;