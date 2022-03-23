-- 6. Data Analytics

-- 1. The start date
SELECT EXTRACT(month FROM trip_start_date), EXTRACT(year FROM trip_start_date), trip_start_date, COUNT(*)
FROM trip_info
GROUP BY GROUPING SETS(EXTRACT(year FROM trip_start_date), EXTRACT(month FROM trip_start_date), trip_start_date);

-- 2. The location of origin
SELECT loc_name_origin, country_name_origin, COUNT(*)
FROM trip_info
GROUP BY GROUPING SETS(loc_name_origin, country_name_origin, ());