SELECT  DISTINCT (ct.date),
        cty.card_type_name,
        SUM (ct.amount) OVER (PARTITION BY cty.card_type_name ORDER BY ct.date ASC) AS transaction_running_total
FROM card_transaction ct
JOIN card_number cn ON ct.card_number_id = cn.id
JOIN card_type cty ON cn.card_type_id = cty.id
WHERE date > '2020-11-30' AND date <= '2020-12-31'
ORDER BY cty.card_type_name ASC;