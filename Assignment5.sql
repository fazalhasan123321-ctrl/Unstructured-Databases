use office ;

CREATE TABLE sale (
    id INT PRIMARY KEY,
    employee VARCHAR(50),
    department VARCHAR(10),
    sales_amount INT,
    sale_date DATE
);

INSERT INTO sale (id, employee, department, sales_amount, sale_date)
VALUES
(1, 'Alice', 'A', 1000, '2024-01-01'),
(2, 'Bob', 'B', 1500, '2024-01-02'),
(3, 'Alice', 'A', 2000, '2024-01-03'),
(4, 'Bob', 'B', 1800, '2024-01-04'),
(5, 'Alice', 'A', 1200, '2024-01-05'),
(6, 'Bob', 'B', 1600, '2024-01-06');

#1.Total sales per employee (Running Total)

SELECT *,
SUM(sales_amount) OVER(
PARTITION BY employee
ORDER BY sale_date
) AS running_total
FROM sale;

#2.Row number per employee

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY employee
ORDER BY sale_date
) AS row_num
FROM sale;

#3.Rank of sales per department

SELECT *,
RANK() OVER(
PARTITION BY department
ORDER BY sales_amount DESC
) AS sales_rank
FROM sale;

#4.Lead (next sale) per employee

SELECT *,
LEAD(sales_amount) OVER(
PARTITION BY employee
ORDER BY sale_date
) AS next_sale
FROM sale;

#5.Lag (previous sale) per employee

SELECT *,
LAG(sales_amount) OVER(
PARTITION BY employee
ORDER BY sale_date
) AS previous_sale
FROM sale;

#6.Average sales per employee

SELECT *,
AVG(sales_amount) OVER(
PARTITION BY employee
) AS avg_sales
FROM sale;

#7.. First and last sales per employee

SELECT *,
FIRST_VALUE(sales_amount) OVER(
PARTITION BY employee
ORDER BY sale_date
) AS first_sale,

LAST_VALUE(sales_amount) OVER(
PARTITION BY employee
ORDER BY sale_date
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
) AS last_sale
FROM sale;

#8.Dense rank (no gaps)

SELECT *,
DENSE_RANK() OVER(
PARTITION BY department
ORDER BY sales_amount DESC
) AS dense_rank_no_gaps
FROM sale;

#9.Cumulative average per employee

SELECT *,
AVG(sales_amount) OVER(
PARTITION BY employee
ORDER BY sale_date
) AS cumulative_avg
FROM sale;

#10.Find highest sale per employee

SELECT *,
MAX(sales_amount) OVER(
PARTITION BY employee
) AS highest_sale
FROM sale;

#11.Sales difference from previous record

SELECT *,
sales_amount -
LAG(sales_amount) OVER(
PARTITION BY employee
ORDER BY sale_date
) AS sales_difference
FROM sale;

#12.Cumulative count of sales per employee

SELECT *,
COUNT(*) OVER(
PARTITION BY employee
ORDER BY sale_date
) AS cumulative_count
FROM sale;

#13.Show if sale is above average per employee

SELECT *,
CASE
WHEN sales_amount >
AVG(sales_amount) OVER(PARTITION BY employee)
THEN 'Above Average'
ELSE 'Below Average'
END AS sale_status
FROM sale;

#14.Find second highest sale per employee

SELECT *
FROM (
SELECT *,
DENSE_RANK() OVER(
PARTITION BY employee
ORDER BY sales_amount DESC
) AS rnk
FROM sale
) x
WHERE rnk = 2;