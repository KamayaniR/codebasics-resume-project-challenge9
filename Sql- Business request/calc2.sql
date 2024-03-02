Alter table fact_events
Add promo_price int;
SET SQL_SAFE_UPDATES = 0;
update fact_events set promo_price =
Case when promo_type = "25% OFF" then base_price * 0.75
     when promo_type = "33% OFF" then base_price*  0.67
     when promo_type = "50% OFF" then base_price*0.5
     when promo_type = "BOGOF" then base_price*0.5
     when promo_type = "500 cashback" then base_price-500
     else base_price
      end;
      select * from fact_events;
      ALTER TABLE fact_events modify  promo_price Float;