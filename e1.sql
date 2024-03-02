ALTER TABLE fact_events
rename COLUMN `quantity_sold(before_promo)`to ⁠quantity_sold_before_promo ;
ALTER TABLE fact_events
rename COLUMN `quantity_sold(after_promo)` to quantity_sold_after_promo;