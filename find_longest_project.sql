SELECT CONCAT('Project-', id) AS name, MAX(month_count) AS month_count FROM (
SELECT id, EXTRACT(YEAR FROM AGE(finish_date, start_date)) * 12 + EXTRACT(MONTH FROM AGE(finish_date, start_date)) AS month_count
FROM project) AS res
GROUP BY id
HAVING MAX(month_count) = (
    SELECT MAX(month_count) AS month_count FROM (
        SELECT EXTRACT(YEAR FROM AGE(finish_date, start_date)) * 12 + EXTRACT(MONTH FROM AGE(finish_date, start_date)) AS month_count
        FROM project) AS res
);