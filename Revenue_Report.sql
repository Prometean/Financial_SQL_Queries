SELECT  cu.NIN,
        cu.first_name,
        cu.last_name,
        SUM(ct.amount) AS total_revenue_per_customer,
        CASE
            WHEN SUM(ct.amount) >= 1000000 THEN 'Platinum'
            WHEN SUM(ct.amount) < 1000000 THEN 'Gold'
        END AS customer_category,
        SUM(CASE WHEN ct.date >= '2019-01-01' AND ct.date < '2020-01-01' THEN ct.amount ELSE 0 END) AS revenue_2019,
        SUM(CASE WHEN ct.date >= '2020-01-01' AND ct.date < '2021-01-01' THEN ct.amount ELSE 0 END) AS revenue_2020
FROM card_transaction ct
JOIN card_number cn ON ct.card_number_id = cn.id
JOIN customer cu ON cn.customer_id = cu.id
GROUP BY cu.NIN, cu.first_name, cu.last_name
ORDER BY total_revenue_per_customer DESC;