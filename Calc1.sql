Alter table fact_events
Add Adjusted_quantity int;
SET SQL_SAFE_UPDATES = 0;
update fact_events set adjusted_quantity = Case when promo_type = "BOGOF" then quantity_sold_after_promo*2
      else quantity_sold_after_promo
      end;
    
select*from fact_events;