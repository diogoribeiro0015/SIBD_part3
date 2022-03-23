-- 3. View
DROP VIEW IF EXISTS trip_info;

CREATE VIEW trip_info(country_iso_origin, country_name_origin,
country_iso_dest, country_name_dest,
loc_name_origin,
loc_name_dest,
cni_boat,
country_iso_boat, country_name_boat,
trip_start_date) AS
SELECT c1.iso_code, c1.name, c2.iso_code, c2.name, l1.name, l2.name, t.cni, t.iso_code_boat, c3.name, t.start_date
FROM trip t JOIN location l1 ON (t.start_latitude = l1.latitude AND t.start_longitude = l1.longitude)
    JOIN location l2 ON (t.end_latitude = l2.latitude AND t.end_longitude = l2.longitude)
    JOIN country c1 ON c1.iso_code = l1.iso_code
    JOIN country c2 ON c2.iso_code = l2.iso_code
    JOIN country c3 ON c3.iso_code = t.iso_code_boat;

SELECT * FROM trip_info;


