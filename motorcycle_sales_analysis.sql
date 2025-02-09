SELECT
	product_line,
	CASE 
		WHEN EXTRACT(MONTH FROM date) = 1 THEN 'January'
		WHEN EXTRACT(MONTH FROM date) = 2 THEN 'February'
		WHEN EXTRACT(MONTH FROM date) = 3 THEN 'March'
		WHEN EXTRACT(MONTH FROM date) = 4 THEN 'April'
		WHEN EXTRACT(MONTH FROM date) = 5 THEN 'May'
		WHEN EXTRACT(MONTH FROM date) = 6 THEN 'June'
		WHEN EXTRACT(MONTH FROM date) = 7 THEN 'July'
		WHEN EXTRACT(MONTH FROM date) = 8 THEN 'August'
		WHEN EXTRACT(MONTH FROM date) = 9 THEN 'September'
		WHEN EXTRACT(MONTH FROM date) = 10 THEN 'October'
		WHEN EXTRACT(MONTH FROM date) = 11 THEN 'November'
		WHEN EXTRACT(MONTH FROM date) = 12 THEN 'December'
		ELSE 'Unknown'
	END AS month,
	warehouse,
	SUM(total) - SUM(payment_fee) AS net_revenue
FROM sales
WHERE client_type = 'Wholesale'
GROUP BY product_line,warehouse, month
ORDER BY product_line, month, net_revenue DESC;