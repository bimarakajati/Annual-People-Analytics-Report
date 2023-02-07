WITH
  year_2011 AS (
  SELECT
    *,
    EXTRACT(year FROM orighiredate_key) AS Joining_Year,
    STATUS_YEAR - EXTRACT(year FROM orighiredate_key) AS Tenure
  FROM
    TheBloomCompany.I_CID_05.employees_2011
  WHERE
    STATUS = 'ACTIVE')

SELECT
  Joining_Year,
  MAX(Tenure) AS Tenure,
  COUNT(DISTINCT EmployeeID) AS Total_Employee,
  MAX(Reward) AS Reward,
  FORMAT("%'.0f", CAST(SUM(Reward) AS NUMERIC)) AS Total_Budget
FROM (
  SELECT
    *,
    (
      CASE
        WHEN Tenure BETWEEN 0 AND 5 THEN 100
        WHEN Tenure BETWEEN 6 AND 10 THEN 200
        WHEN Tenure BETWEEN 11 AND 14 THEN 300
        WHEN Tenure >=15 THEN 500
    END
      ) AS Reward
  FROM
    year_2011 )
GROUP BY
  Joining_Year
ORDER BY
  Joining_Year asc