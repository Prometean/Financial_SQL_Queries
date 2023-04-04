SELECT  EXTRACT(YEAR FROM ct.date) AS year,
        EXTRACT(QUARTER FROM ct.date) AS quarter,
        COUNT(ct.amount) AS number_of_transactions,
        cty.card_type_name
FROM card_transaction ct
JOIN card_number cn ON ct.card_number_id = cn.id
JOIN card_type cty ON cn.card_type_id = cty.id
GROUP BY ROLLUP(EXTRACT(YEAR FROM ct.date), EXTRACT(QUARTER FROM ct.date), cty.card_type_name);