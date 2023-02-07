WITH
  Age_Group_Data AS (
  SELECT
    EXTRACT(year FROM orighiredate_key) AS Joining_Year,
    department_name,
    city_name
  FROM
    `TheBloomCompany.I_CID_05.employees_2011`
  WHERE
    STATUS = 'ACTIVE')

SELECT
  DISTINCT department_name AS Department_Name,
  city_name AS City_Name,
  COUNT(city_name) AS Total
FROM
  Age_Group_Data
WHERE
  Joining_Year IN (2010,
    2011)
GROUP BY
  Department_Name,
  City_Name
ORDER BY
  Total DESC
LIMIT
  3