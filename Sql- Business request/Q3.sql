Select 
dc.campaign_name,
Concat(round(Sum((fe.base_price * fe.quantity_sold_before_promo)/1000000),2),' Millions')
AS Total_revenue_before_promotion,
Concat(round(Sum((fe.adjusted_quantity * fe.promo_price)/1000000) ,2),' Millions')
AS Total_revenue_after_promotion
from fact_events fe
join
dim_campaigns dc on dc.campaign_id = fe.campaign_id
group by fe.campaign_id;



