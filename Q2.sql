Select
 city,Count(store_id) as Store_Count
 From 
 retail_events_db.dim_stores
 Group by city
 Order by Store_Count DESC;
 
 
 
 