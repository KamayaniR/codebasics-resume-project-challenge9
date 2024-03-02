SELECT
  dp.product_name , fe.base_price
FROM
  retail_events_db.fact_events fe
JOIN
  dim_products dp on dp.product_code = fe.product_code
WHERE
  fe.base_price>500 and fe.promo_type = 'BOGOF'
GROUP BY
  dp.product_name;




