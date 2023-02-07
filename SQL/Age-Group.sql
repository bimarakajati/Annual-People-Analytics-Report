WITH
  Age_Group_Data AS (
  SELECT
    EmployeeID,
    gender_full AS Gender,
    CASE
      WHEN 2011 - EXTRACT(year FROM birthdate_key) <= 30 THEN 'Below 30 Years'
      WHEN 2011 - EXTRACT(year FROM birthdate_key) BETWEEN 31 AND 40 THEN '31-40 Years'
      WHEN 2011 - EXTRACT(year FROM birthdate_key) BETWEEN 41 AND 50 THEN '41-50 Years'
      WHEN 2011 - EXTRACT(year FROM birthdate_key) BETWEEN 51 AND 60 THEN '51-60 Years'
      WHEN 2011 - EXTRACT(year FROM birthdate_key) > 60 THEN '60 Years and Above'
  END
    AS Age_Group
  FROM
    `TheBloomCompany.I_CID_05.employees_2011` 
  WHERE
    STATUS = 'ACTIVE')

SELECT
  DISTINCT(Age_Group),
  Gender,
  COUNT(DISTINCT EmployeeID) AS Total_Employee
FROM
  Age_Group_Data
GROUP BY
  Age_Group,
  Gender
ORDER BY
  Age_Group ASC