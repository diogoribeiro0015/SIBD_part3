DROP TRIGGER IF EXISTS datetrip ON reservation;
DROP TRIGGER IF EXISTS new_location ON location;
DROP TRIGGER IF EXISTS check_location ON boat;


-- 2. Integrity Constraints

-- (IC-1) Two reservations for the same boat can not have their corresponding date intervals intersecting
CREATE OR REPLACE FUNCTION datetrip_check()
    RETURNS TRIGGER AS

$$
    DECLARE start_D DATE;
    DECLARE end_D DATE;

BEGIN
    SELECT r.end_date FROM reservation r WHERE r.cni = NEW.cni AND r.iso_code_boat = NEW.iso_code_boat INTO end_D;

    SELECT r.start_date FROM reservation r WHERE r.cni = NEW.cni AND r.iso_code_boat = NEW.iso_code_boat INTO start_D;


    IF NEW.start_date < end_D AND NEW.start_date > start_D THEN
                RAISE EXCEPTION 'Two reservations for the same boat can not have their corresponding date intervals intersecting';
    end if;
    IF NEW.end_date > start_D AND NEW.end_date < end_D THEN
        RAISE EXCEPTION 'Two reservations for the same boat can not have their corresponding date intervals intersecting';
    end if;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER datetrip
    BEFORE INSERT OR UPDATE
    ON reservation
    FOR EACH ROW
EXECUTE PROCEDURE datetrip_check();

-- (IC-2) Any location must be specialized in one of three - disjoint - entities: marina, wharf, or port
CREATE OR REPLACE FUNCTION check_location()
    RETURNS TRIGGER AS

$$
    DECLARE flag INTEGER;

BEGIN
    flag :=0;
    IF ( (NEW.latitude, NEW.longitude) IN (SELECT latitude, longitude FROM wharf) ) THEN
        flag := flag+1;
    END IF;
    IF ( (NEW.latitude, NEW.longitude) IN (SELECT latitude, longitude FROM marina) ) THEN
        flag := flag+1;
    END IF;
    IF ( (NEW.latitude, NEW.longitude) IN (SELECT latitude, longitude FROM port) ) THEN
        flag := flag+1;
    END IF;
    IF (flag <> 1) THEN
        RAISE EXCEPTION 'The location must be either a wharf, marine or a port';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER new_location
    AFTER INSERT OR UPDATE
    ON location
    DEFERRABLE
    FOR EACH ROW
EXECUTE PROCEDURE check_location();


-- (IC-3) A country where a boat is registered must correspond - at least - to one location
CREATE OR REPLACE FUNCTION check_country()
    RETURNS TRIGGER AS
$$
BEGIN
    IF NEW.iso_code NOT IN (SELECT l.iso_code
                    FROM location l) THEN
        RAISE EXCEPTION 'A country where a boat is registered must correspond to one location';
    end if;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_location
    BEFORE INSERT
    ON boat
    FOR EACH ROW
EXECUTE PROCEDURE check_country();