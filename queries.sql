-- 4. SQL
-- 1. Who is the owner with the most boats per country?
SELECT b1.id_owner, p.name, b1.iso_code
FROM boat b1 JOIN owner o ON o.id = b1.id_owner JOIN person p ON p.id = o.id
GROUP BY (b1.iso_code, b1.id_owner, p.name)
HAVING COUNT(*) >= ALL (SELECT COUNT(*)
                FROM boat b2
                WHERE b1.iso_code = b2.iso_code
                GROUP BY (b2.iso_code, b2.id_owner));

--2. List all the owners that have at least two boats in distinct countries

SELECT DISTINCT b.id_owner, p.name
FROM boat b JOIN owner o ON o.id = b.id_owner JOIN person p ON p.id = o.id
GROUP BY (b.id_owner, p.name)
HAVING COUNT (DISTINCT b.iso_code) >= 2;


-- 3. Who are the sailors that have sailed to every location in 'Portugal'?
SELECT s.id
FROM sailor s JOIN trip t ON t.id_sailor = s.id
JOIN location l ON ( (t.start_latitude = l.latitude AND t.start_longitude = l.longitude) OR (t.end_latitude = l.latitude  AND t.end_longitude = l.longitude))
JOIN country c ON c.iso_code=l.iso_code WHERE c.name = 'PORTUGAL'
GROUP BY s.id
HAVING COUNT(DISTINCT l.name) = (SELECT COUNT(DISTINCT l2.name)
    FROM country c2 JOIN location l2 ON c2.iso_code = l2.iso_code
    WHERE c2.name = 'PORTUGAL');


-- 4. List the sailors with the most trips along with their reservations
SELECT t.id_sailor, p.name
FROM trip t JOIN reservation r ON r.iso_code_sailor = t.iso_code_sailor AND r.id_sailor=t.id_sailor
JOIN person p ON p.id = t.id_sailor
GROUP BY (t.id_sailor, t.iso_code_sailor, p.name)
HAVING COUNT(*) >= ALL (SELECT COUNT(*)
                FROM trip
                GROUP BY (id_sailor, iso_code_sailor));

-- 5. List the sailors with the longest duration of trips (sum of trip durations) for the same
-- single reservation; display also the sum of the trip durations.
SELECT t.id_sailor, p.name, SUM(t.duration)
FROM trip t JOIN reservation r ON r.iso_code_sailor = t.iso_code_sailor AND r.id_sailor=t.id_sailor
                                AND r.end_date=t.end_date AND r.start_date=t.start_date
JOIN person p ON p.id = t.id_sailor
GROUP BY t.id_sailor, p.name
ORDER BY SUM(t.duration) DESC;

