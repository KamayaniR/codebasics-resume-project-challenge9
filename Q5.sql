With Incremental_Revenue as (
select 
fe.product_code, dp.product_name, dp.category,
(fe.base_price * fe.quantity_sold_before_promo) as revenue_before_promo,
(fe.adjusted_quantity * fe.promo_price) as revenue_after_promo,
(fe.adjusted_quantity * fe.promo_price)  - (fe.base_price * fe.quantity_sold_before_promo) as incremental_revenue,
fe.base_price,
fe.quantity_sold_before_promo,
fe.adjusted_quantity
from fact_events fe
join dim_products dp on fe.product_code = dp.product_code
)
select product_name, category,
round((sum(incremental_revenue)/sum(revenue_before_promo))*100,2) as incrementalRevenue_percentage
from Incremental_Revenue
group by product_name, category
order by incrementalRevenue_percentage
desc limit 5;