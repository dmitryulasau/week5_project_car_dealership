-- Add a car
CREATE OR REPLACE FUNCTION add_car(
    "_VIN" VARCHAR,
    "_year" VARCHAR,
    "_make" VARCHAR,
    "_model" VARCHAR,
    "_color" VARCHAR,
    "_new" BOOLEAN
)
RETURNS VOID
AS
$$
BEGIN
    INSERT INTO car("VIN", "year", "make", "model", "color", "new")
    VALUES ("_VIN", "_year", "_make", "_model", "_color", "_new");
END;
$$
LANGUAGE plpgsql;

SELECT add_car('3MVDMBBL1NM435573', '2022', 'Mazda', 'CX-30', 'Platinum Quartz Metallic', 'yes');
SELECT add_car('7MMVABEM3PN108555', '2022', 'Mazda', 'CX-50', 'Polymetal Gray Metallic', 'yes');
SELECT add_car('58ADZ1B12NU123743', '2022', 'LEXUS', 'ES 350', 'Obsidian', 'yes');
SELECT add_car('WBAVL1C50EVY15526', '2014', 'BMW', 'X1', 'Obsidian', 'no');
SELECT add_car('WDDZF4KB7KA597324', '2019', 'MERCEDES-BENZ', 'E 300', 'White', 'no');
SELECT add_car('WP0EB0918FS170194', '1985', 'Porsche', '911 Carrera', 'Grey', 'no');

-- Add a customer
CREATE OR REPLACE FUNCTION add_customer(
    _first_name VARCHAR,
    _last_name VARCHAR,
    _phone VARCHAR,
    _email VARCHAR,
    _address VARCHAR,
    _city VARCHAR,
    _state VARCHAR,
    _country VARCHAR,
    _postal_code VARCHAR
)
RETURNS VOID
AS
$$
BEGIN
    INSERT INTO "customer"("first_name", "last_name", "phone", "email", "address", "city", "state", "country", "postal_code")
    VALUES ("_first_name", "_last_name", "_phone", "_email", "_address", "_city", "_state", "_country", "_postal_code");
END;

$$
LANGUAGE plpgsql;

SELECT add_customer('Chandler', 'Bing', '2456784563', 'chandlerbing@friends.com', '90 Bedford Street APT 19', 'New York', 'NY', 'US', '10014');
SELECT add_customer('Joey', 'Tribbiani', '5789876535', 'joey@friends.com', '90 Bedford Street APT 19', 'New York', 'NY', 'US', '10014');
SELECT add_customer('Monica', 'Geller', '1789826535', 'monica@friends.com', '90 Bedford Street APT 20', 'New York', 'NY', 'US', '10014');
SELECT add_customer('Rachel', 'Green', '8889826545', 'rachel@friends.com', '90 Bedford Street APT 20', 'New York', 'NY', 'US', '10014');
SELECT add_customer('Ross', 'Geller', '8679826541', 'ross@friends.com', '17 Grove Street 3B', 'New York', 'NY', 'US', '10014');
SELECT add_customer('Phoebe', 'Buffay', '9679926549', 'pb@friends.com', '5 Morton Street 14', 'New York', 'NY', 'US', '10014');

-- Service ticket
CREATE OR REPLACE FUNCTION add_service_ticket(
    _date DATE,
    _notes VARCHAR,
    _customer_id INTEGER,
    _car_id INTEGER
)
RETURNS VOID
AS
$$
BEGIN
    INSERT INTO "service_ticket"("date", "notes", "customer_id", "car_id")
    VALUES ("_date", "_notes", "_customer_id", "_car_id");
END;

$$
LANGUAGE plpgsql;

SELECT add_service_ticket('2022-07-31', 'Oil change', 4, 6);
SELECT add_service_ticket('2022-08-12', 'Battery replacement', 6, 5);
SELECT add_service_ticket('2022-08-12', 'Tire rotation', 2, 3);
SELECT add_service_ticket('2022-09-01', 'Multi-point inspection', 1, 1);
SELECT add_service_ticket('2022-09-01', 'Brake pad replacement', 3, 4);

-- Add part for replacement
CREATE OR REPLACE FUNCTION add_service_part(
    "_quantity" INTEGER,
    "_service_ticket_id" INTEGER,
    "_part_id" INTEGER
)
RETURNS VOID
AS
$$
BEGIN
    INSERT INTO "service_part"("quantity", "service_ticket_id", "part_id")
    VALUES ("_quantity", "_service_ticket_id", "_part_id");
END;

$$
LANGUAGE plpgsql;

SELECT add_service_part(1, 1, 1); -- Oil change
SELECT add_service_part(1, 2, 3); -- Battery replacement
SELECT add_service_part(4, 3, 4); -- Change tires
SELECT add_service_part(2, 5, 5); -- Front brake pad replacement

-- Assign labor to mechanic
CREATE OR REPLACE FUNCTION add_labor(
    "_duration_hours" INTEGER,
    "_service_ticket_id" INTEGER,
    "_service_id" INTEGER,
    "_mechanic_id" INTEGER
)
RETURNS VOID
AS
$$
BEGIN
    INSERT INTO "labor"("duration_hours", "service_ticket_id", "service_id", "mechanic_id")
    VALUES ("_duration_hours", "_service_ticket_id", "_service_id", "_mechanic_id");
END;

$$
LANGUAGE plpgsql;

SELECT add_labor(1, 1, 2, 1);
SELECT add_labor(1, 1, 2, 2);
SELECT add_labor(3, 5, 6, 3);
SELECT add_labor(6, 4, 8, 1);
SELECT add_labor(6, 4, 8, 2);
SELECT add_labor(6, 4, 8, 3);


-- Increase all prices by 10
CREATE OR REPLACE PROCEDURE ten_above(
    "addition" DECIMAL
)
AS
$$

BEGIN

    UPDATE "part"
    SET "price" = "price" + "addition";
    
    COMMIT;

END;
$$
LANGUAGE plpgsql;

CALL ten_above(10.00);

SELECT "part_id", "price"
FROM "part"
