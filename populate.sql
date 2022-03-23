-- Create country
INSERT INTO country VALUES('RED_GREEN', 'PORTUGAL', 'PT');
INSERT INTO country VALUES('BWR', 'FRANCE', 'FR');
INSERT INTO country VALUES('ORANGEBLCAK', 'GERMANY', 'DE');

-- IC3 testing
-- INSERT INTO country VALUES('aloo', 'cooo', 'ri');

-- Create location
START TRANSACTION;
SET CONSTRAINTS ALL DEFERRED;
INSERT INTO location VALUES('CARREGAL_DO_SAL', 40.4337, -8.00341, 'PT');
INSERT INTO location VALUES('LISBOA', 35.4337 , -4.00341 ,'PT');
INSERT INTO location VALUES('FARO', 10.4337 , -4.00341 ,'PT');
INSERT INTO location VALUES('PARIS', 50.4337 , -10.00341 ,'FR');
INSERT INTO location VALUES('MONACO', 32.4337 , -14.00341 ,'FR');
INSERT INTO location VALUES('DORTMUND', 47.4337 , -9.00341 ,'DE');


-- Create marina
INSERT INTO marina VALUES(40.4337, -8.00341);
INSERT INTO marina VALUES(32.4337 , -14.00341);
INSERT INTO marina VALUES(47.4337 , -9.00341);

-- Create wharf
INSERT INTO wharf VALUES(35.4337 , -4.00341);
INSERT INTO wharf VALUES(10.4337 , -4.00341);

-- Create port
INSERT INTO port VALUES(50.4337 , -10.00341);

COMMIT;

-- IC2 testing
-- INSERT INTO location VALUES('ERROR', 0.0 , 0.0 ,'DE');
-- INSERT INTO location VALUES('ERROR', 10.4337 , -4.00341, 'DE');

--Create person
INSERT INTO person VALUES( 1,'DIOGO', 'PT');
INSERT INTO person VALUES( 2,'DUARTE', 'PT');
INSERT INTO person VALUES( 3,'MIGUEL', 'PT');
INSERT INTO person VALUES( 4,'JOAO', 'PT');
INSERT INTO person VALUES( 5,'HANS', 'DE');
INSERT INTO person VALUES( 6,'JEAN', 'FR');
INSERT INTO person VALUES( 7,'PIERRE', 'FR');

-- Create sailor
INSERT INTO sailor VALUES( 1, 'PT');
INSERT INTO sailor VALUES( 2, 'PT');
INSERT INTO sailor VALUES( 3, 'PT');

-- Create owner
INSERT INTO owner VALUES( 1, 'PT', '1999-10-16');
INSERT INTO owner VALUES( 4, 'PT', '1970-05-16');
INSERT INTO owner VALUES( 5, 'DE', '1968-07-20');
INSERT INTO owner VALUES( 6, 'FR', '1985-06-06');
INSERT INTO owner VALUES( 7, 'FR', '1882-01-01');

-- Create boat
INSERT INTO boat VALUES( 'BENFICA', 1904, 'SLB', 'PT', 1, 'PT');
INSERT INTO boat VALUES( 'SIBD', 2022, 'SIBD', 'PT', 4, 'PT');
INSERT INTO boat VALUES( 'CLUBE_CARREGAL', 1953, 'CFCS', 'PT', 7, 'FR');
INSERT INTO boat VALUES( 'BVB04', 1999, 'BV', 'PT', 1, 'PT');
INSERT INTO boat VALUES( 'PARISSG', 1995, 'PSG', 'FR', 1, 'PT');
INSERT INTO boat VALUES( 'ALEM1', 1995, 'AL1', 'DE', 1, 'PT');
INSERT INTO boat VALUES( 'ALEM2', 1995, 'AL2', 'DE', 7, 'FR');
INSERT INTO boat VALUES( 'ALEM3', 1995, 'AL3', 'DE', 7, 'FR');

-- IC3 testing
-- INSERT INTO boat VALUES( '123', 1995, '123', 'ri', 1, 'PT');


-- Create boat_vhf
INSERT INTO boat_vhf VALUES( 190254, 'SLB', 'PT');
INSERT INTO boat_vhf VALUES( 199854, 'SIBD', 'PT');


-- Create schedule
INSERT INTO schedule VALUES('1999-10-10', '1999-10-15');
INSERT INTO schedule VALUES('2021-01-12', '2021-01-15');
INSERT INTO schedule VALUES('2015-10-30', '2015-11-05');
INSERT INTO schedule VALUES('2015-05-18', '2015-05-22');

-- IC1 TESTING
-- INSERT INTO schedule VALUES('1999-10-14', '1999-10-17');
-- INSERT INTO schedule VALUES('1999-10-9', '1999-10-12');


-- Create reservation
INSERT INTO reservation VALUES('SLB', 'PT', 1, 'PT', '1999-10-10', '1999-10-15'); 
INSERT INTO reservation VALUES('PSG', 'FR', 3, 'PT', '2015-05-18', '2015-05-22');
INSERT INTO reservation VALUES('SLB', 'PT', 1, 'PT', '2015-10-30', '2015-11-05');
INSERT INTO reservation VALUES('PSG', 'FR', 1, 'PT', '2021-01-12', '2021-01-15');

-- Testing Query 3
-- INSERT INTO reservation VALUES('PSG', 'FR', 3, 'PT', '2015-10-30', '2015-11-05');

-- IC1 TESTING
-- INSERT INTO reservation VALUES('SLB', 'PT', 1, 'PT', '1999-10-14', '1999-10-17');
-- INSERT INTO reservation VALUES('SLB', 'PT', 1, 'PT', '1999-10-9', '1999-10-12');
-- ---------------------------------------------------------------------------------


-- Create trip
INSERT INTO trip VALUES('05-10-1999', 5, 'SLB', 'PT', 1, 'PT', '1999-10-10', '1999-10-15', 40.4337, -8.00341, 35.4337, -4.00341);
INSERT INTO trip VALUES('25-10-2015', 6, 'SLB', 'PT', 1, 'PT', '2015-10-30', '2015-11-05', 10.4337 , -4.00341, 35.4337, -4.00341);
INSERT INTO trip VALUES('05-10-1999', 10, 'PSG', 'FR', 3, 'PT', '2015-05-18', '2015-05-22', 10.4337 , -4.00341, 47.4337 , -9.00341 );

-- Testing Query 3
-- INSERT INTO trip VALUES('05-10-1999', 4, 'PSG', 'FR', 3, 'PT', '2015-10-30', '2015-11-05', 40.4337, -8.00341, 35.4337, -4.00341);
