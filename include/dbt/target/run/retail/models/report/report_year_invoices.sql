
  
    

    create or replace table `airflow-401407`.`retail`.`report_year_invoices`
    
    

    OPTIONS()
    as (
      SELECT
  dt.year,
  dt.month,
  COUNT(DISTINCT fi.invoice_id) AS num_invoices,
  SUM(fi.total) AS total_revenue
FROM `airflow-401407`.`retail`.`fct_invoices` fi
JOIN `airflow-401407`.`retail`.`dim_datetime` dt ON fi.datetime_id = dt.datetime_id
GROUP BY dt.year, dt.month
ORDER BY dt.year, dt.month
    );
  