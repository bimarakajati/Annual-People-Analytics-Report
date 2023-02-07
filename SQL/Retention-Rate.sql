WITH
  year_2010 AS (
  SELECT
    COUNT(DISTINCT EmployeeID) AS tahun_2010
  FROM
    TheBloomCompany.I_CID_05.employees_2010
  WHERE
    STATUS = 'ACTIVE'),

  year_2011 AS (
  SELECT
    COUNT(DISTINCT EmployeeID) AS tahun_2011
  FROM
    TheBloomCompany.I_CID_05.employees_2011
  WHERE
    STATUS = 'ACTIVE')

SELECT
  '95.75%' AS Retention_Rate_2009_2010,
  CONCAT( ROUND( (tahun_2011/tahun_2010)*100, 2), '%') AS Retention_Rate_2010_2011
FROM
  year_2010,
  year_2011