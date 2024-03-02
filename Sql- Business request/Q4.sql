use retail_events_db;
with Diwali_event As (
Select dp.category,
Sum(fe.quantity_sold_before_promo) as Total_quantity_before_diwali,
Sum(fe.adjusted_quantity) as Total_quantity_after_diwali,
round(((sum(fe.adjusted_quantity) - sum(fe.quantity_sold_before_promo))/sum(fe.quantity_sold_before_promo)) * 100,2) as ISU_percentage 
 from fact_events fe
 join
 dim_products dp on dp.product_code = fe.product_code
 where 
 fe.campaign_id = "CAMP_DIW_01"
 GROUP BY 
 dp.category
 )
 select category,ISU_percentage,
 rank () over (order by ISU_percentage desc) as rank_order
 from Diwali_event
 order by rank_order;
 