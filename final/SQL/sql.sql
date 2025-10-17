 SELECT * FROM student34.samplesuperstore_clean;
 
 
 -- HUB_SHIP_MODE
CREATE TABLE IF NOT EXISTS student34.hub_ship_mode (
    hub_ship_mode_key  CHAR(32) PRIMARY KEY,
    ship_mode_bk       TEXT NOT NULL,
    load_dts           TIMESTAMP NOT NULL,
    record_source      TEXT NOT NULL
)
DISTRIBUTED BY (hub_ship_mode_key);

-- HUB_SEGMENT
CREATE TABLE IF NOT EXISTS student34.hub_segment (
    hub_segment_key  CHAR(32) PRIMARY KEY,
    segment_bk       TEXT NOT NULL,
    load_dts         TIMESTAMP NOT NULL,
    record_source    TEXT NOT NULL
)
DISTRIBUTED BY (hub_segment_key);

-- HUB_LOCATION
CREATE TABLE IF NOT EXISTS student34.hub_location (
    hub_location_key  CHAR(32) PRIMARY KEY,
    location_bk       TEXT NOT NULL,
    load_dts          TIMESTAMP NOT NULL,
    record_source     TEXT NOT NULL
)
DISTRIBUTED BY (hub_location_key);

-- HUB_PRODUCT_CATEGORY
CREATE TABLE IF NOT EXISTS student34.hub_product_category (
    hub_product_category_key  CHAR(32) PRIMARY KEY,
    product_category_bk       TEXT NOT NULL,
    load_dts                  TIMESTAMP NOT NULL,
    record_source             TEXT NOT NULL
)
DISTRIBUTED BY (hub_product_category_key);



-- HUB_SHIP_MODE
INSERT INTO student34.hub_ship_mode (hub_ship_mode_key, ship_mode_bk, load_dts, record_source)
SELECT DISTINCT
    md5(upper(trim("Ship Mode"))),
    upper(trim("Ship Mode")),
    now(),
    'samplesuperstore_clean'
FROM student34.samplesuperstore_clean
WHERE "Ship Mode" IS NOT NULL;

-- HUB_SEGMENT
INSERT INTO student34.hub_segment (hub_segment_key, segment_bk, load_dts, record_source)
SELECT DISTINCT
    md5(upper(trim("Segment"))),
    upper(trim("Segment")),
    now(),
    'samplesuperstore_clean'
FROM student34.samplesuperstore_clean
WHERE "Segment" IS NOT NULL;

-- HUB_LOCATION
INSERT INTO student34.hub_location (hub_location_key, location_bk, load_dts, record_source)
SELECT DISTINCT
    md5(upper(trim(concat_ws('|', "Country", "State", "City", "Postal Code", "Region")))),
    upper(trim(concat_ws('|', "Country", "State", "City", "Postal Code", "Region"))),
    now(),
    'samplesuperstore_clean'
FROM student34.samplesuperstore_clean
WHERE "Country" IS NOT NULL AND "City" IS NOT NULL;

-- HUB_PRODUCT_CATEGORY
INSERT INTO student34.hub_product_category (hub_product_category_key, product_category_bk, load_dts, record_source)
SELECT DISTINCT
    md5(upper(trim(concat_ws('|', "Category", "Sub-Category")))),
    upper(trim(concat_ws('|', "Category", "Sub-Category"))),
    now(),
    'samplesuperstore_clean'
FROM student34.samplesuperstore_clean
WHERE "Category" IS NOT NULL AND "Sub-Category" IS NOT NULL;


CREATE TABLE IF NOT EXISTS student34.lnk_sale_ctx (
    lnk_sale_ctx_key          CHAR(32) PRIMARY KEY,
    hub_ship_mode_key         CHAR(32) NOT NULL,
    hub_segment_key           CHAR(32) NOT NULL,
    hub_location_key          CHAR(32) NOT NULL,
    hub_product_category_key  CHAR(32) NOT NULL,
    load_dts                  TIMESTAMP NOT NULL,
    record_source             TEXT NOT NULL
)
DISTRIBUTED BY (lnk_sale_ctx_key);


INSERT INTO student34.lnk_sale_ctx (
    lnk_sale_ctx_key,
    hub_ship_mode_key,
    hub_segment_key,
    hub_location_key,
    hub_product_category_key,
    load_dts,
    record_source
)
SELECT DISTINCT
    md5(upper(trim(concat_ws('|',
        md5(upper(trim("Ship Mode"))),
        md5(upper(trim("Segment"))),
        md5(upper(trim(concat_ws('|', "Country", "State", "City", "Postal Code", "Region")))),
        md5(upper(trim(concat_ws('|', "Category", "Sub-Category"))))
    ))))                            AS lnk_sale_ctx_key,
    md5(upper(trim("Ship Mode")))     AS hub_ship_mode_key,
    md5(upper(trim("Segment")))       AS hub_segment_key,
    md5(upper(trim(concat_ws('|', "Country", "State", "City", "Postal Code", "Region")))) AS hub_location_key,
    md5(upper(trim(concat_ws('|', "Category", "Sub-Category")))) AS hub_product_category_key,
    now(),
    'samplesuperstore_clean'
FROM student34.samplesuperstore_clean s;

ALTER TABLE student34.samplesuperstore_clean
RENAME COLUMN "Ship Mode" TO ship_mode;
ALTER TABLE student34.samplesuperstore_clean
RENAME COLUMN "Segment" TO segment;
ALTER TABLE student34.samplesuperstore_clean
RENAME COLUMN "Country" TO country;
ALTER TABLE student34.samplesuperstore_clean
RENAME COLUMN "State" TO state;
ALTER TABLE student34.samplesuperstore_clean
RENAME COLUMN "City" TO city;
ALTER TABLE student34.samplesuperstore_clean
RENAME COLUMN "Postal Code" TO postal_code;
ALTER TABLE student34.samplesuperstore_clean
RENAME COLUMN "Region" TO region;
ALTER TABLE student34.samplesuperstore_clean
RENAME COLUMN "Category" TO category;
ALTER TABLE student34.samplesuperstore_clean
RENAME COLUMN "Sub-Category" TO sub_category;



drop table student34.sat_ship_mode_attr;
drop table student34.sat_segment_attr;
drop table student34.sat_location_attr;
drop table student34.sat_product_category_attr;

-- SAT_SHIP_MODE_ATTR
CREATE TABLE IF NOT EXISTS student34.sat_ship_mode_attr (
    hub_ship_mode_key  CHAR(32) NOT NULL,
    hashdiff           CHAR(32) NOT NULL,
    ship_mode          TEXT,
    start_date         DATE NOT NULL DEFAULT current_date,
    end_date           DATE NOT NULL DEFAULT DATE '9999-12-31',
    is_current         BOOLEAN NOT NULL DEFAULT TRUE,
    load_dts           TIMESTAMP NOT NULL,
    record_source      TEXT NOT NULL,
    PRIMARY KEY (hub_ship_mode_key, hashdiff)
)
DISTRIBUTED BY (hub_ship_mode_key);

-- SAT_SEGMENT_ATTR
CREATE TABLE IF NOT EXISTS student34.sat_segment_attr (
    hub_segment_key  CHAR(32) NOT NULL,
    hashdiff         CHAR(32) NOT NULL,
    segment          TEXT,
    start_date       DATE NOT NULL DEFAULT current_date,
    end_date         DATE NOT NULL DEFAULT DATE '9999-12-31',
    is_current       BOOLEAN NOT NULL DEFAULT TRUE,
    load_dts         TIMESTAMP NOT NULL,
    record_source    TEXT NOT NULL,
    PRIMARY KEY (hub_segment_key, hashdiff)
)
DISTRIBUTED BY (hub_segment_key);

-- SAT_LOCATION_ATTR
CREATE TABLE IF NOT EXISTS student34.sat_location_attr (
    hub_location_key  CHAR(32) NOT NULL,
    hashdiff          CHAR(32) NOT NULL,
    country           TEXT,
    state             TEXT,
    city              TEXT,
    postal_code       TEXT,
    region            TEXT,
    start_date        DATE NOT NULL DEFAULT current_date,
    end_date          DATE NOT NULL DEFAULT DATE '9999-12-31',
    is_current        BOOLEAN NOT NULL DEFAULT TRUE,
    load_dts          TIMESTAMP NOT NULL,
    record_source     TEXT NOT NULL,
    PRIMARY KEY (hub_location_key, hashdiff)
)
DISTRIBUTED BY (hub_location_key);

-- SAT_PRODUCT_CATEGORY_ATTR
CREATE TABLE IF NOT EXISTS student34.sat_product_category_attr (
    hub_product_category_key  CHAR(32) NOT NULL,
    hashdiff                  CHAR(32) NOT NULL,
    category                  TEXT,
    sub_category              TEXT,
    start_date                DATE NOT NULL DEFAULT current_date,
    end_date                  DATE NOT NULL DEFAULT DATE '9999-12-31',
    is_current                BOOLEAN NOT NULL DEFAULT TRUE,
    load_dts                  TIMESTAMP NOT NULL,
    record_source             TEXT NOT NULL,
    PRIMARY KEY (hub_product_category_key, hashdiff)
)
DISTRIBUTED BY (hub_product_category_key);


CREATE TABLE IF NOT EXISTS student34.sat_sale_metrics (
    lnk_sale_ctx_key  CHAR(32) NOT NULL,
    hashdiff          CHAR(32) NOT NULL,
    sales             NUMERIC(18,4),
    quantity          INTEGER,
    discount          NUMERIC(9,4),
    profit            NUMERIC(18,4),
    start_date        DATE NOT NULL DEFAULT current_date,
    end_date          DATE NOT NULL DEFAULT DATE '9999-12-31',
    is_current        BOOLEAN NOT NULL DEFAULT TRUE,
    load_dts          TIMESTAMP NOT NULL,
    record_source     TEXT NOT NULL,
    PRIMARY KEY (lnk_sale_ctx_key, hashdiff)
)
DISTRIBUTED BY (lnk_sale_ctx_key);



INSERT INTO student34.sat_ship_mode_attr (
    hub_ship_mode_key, hashdiff, ship_mode,
    start_date, end_date, is_current,
    load_dts, record_source
)
SELECT
    md5(upper(trim(ship_mode))) AS hub_ship_mode_key,
    md5(upper(trim(ship_mode))) AS hashdiff,
    ship_mode,
    current_date AS start_date,
    DATE '9999-12-31' AS end_date,
    TRUE AS is_current,
    now() AS load_dts,
    'samplesuperstore_clean' AS record_source
FROM student34.samplesuperstore_clean
WHERE ship_mode IS NOT NULL
GROUP BY ship_mode;


INSERT INTO student34.sat_segment_attr (
    hub_segment_key, hashdiff, segment,
    start_date, end_date, is_current,
    load_dts, record_source
)
SELECT
    md5(upper(trim(segment))) AS hub_segment_key,
    md5(upper(trim(segment))) AS hashdiff,
    segment,
    current_date AS start_date,
    DATE '9999-12-31' AS end_date,
    TRUE AS is_current,
    now() AS load_dts,
    'samplesuperstore_clean' AS record_source
FROM student34.samplesuperstore_clean
WHERE segment IS NOT NULL
GROUP BY segment;


INSERT INTO student34.sat_location_attr (
    hub_location_key, hashdiff,
    country, state, city, postal_code, region,
    start_date, end_date, is_current,
    load_dts, record_source
)
SELECT
    md5(upper(trim(concat_ws('|', country, state, city, postal_code, region)))) AS hub_location_key,
    md5(upper(trim(concat_ws('|', country, state, city, postal_code, region)))) AS hashdiff,
    country, state, city, postal_code, region,
    current_date AS start_date,
    DATE '9999-12-31' AS end_date,
    TRUE AS is_current,
    now() AS load_dts,
    'samplesuperstore_clean' AS record_source
FROM student34.samplesuperstore_clean
GROUP BY country, state, city, postal_code, region;


INSERT INTO student34.sat_product_category_attr (
    hub_product_category_key, hashdiff,
    category, sub_category,
    start_date, end_date, is_current,
    load_dts, record_source
)
SELECT
    md5(upper(trim(concat_ws('|', category, sub_category)))) AS hub_product_category_key,
    md5(upper(trim(concat_ws('|', category, sub_category)))) AS hashdiff,
    category, sub_category,
    current_date AS start_date,
    DATE '9999-12-31' AS end_date,
    TRUE AS is_current,
    now() AS load_dts,
    'samplesuperstore_clean' AS record_source
FROM student34.samplesuperstore_clean
GROUP BY category, sub_category;


INSERT INTO student34.sat_sale_metrics (
    lnk_sale_ctx_key, hashdiff,
    sales, quantity, discount, profit,
    start_date, end_date, is_current,
    load_dts, record_source
)
SELECT
    md5(upper(trim(concat_ws('|',
        md5(upper(trim(ship_mode))),
        md5(upper(trim(segment))),
        md5(upper(trim(concat_ws('|', country, state, city, postal_code, region)))),
        md5(upper(trim(concat_ws('|', category, sub_category))))
    )))) AS lnk_sale_ctx_key,
    md5(upper(trim(concat_ws('|',
        coalesce(to_char("Sales", 'FM9999999990D0000'), 'NULL'),
        coalesce("Quantity"::text, 'NULL'),
        coalesce(to_char("Discount", 'FM999990D0000'), 'NULL'),
        coalesce(to_char("Profit", 'FM9999999990D0000'), 'NULL')
    )))) AS hashdiff,
    "Sales", "Quantity", "Discount", "Profit",
    current_date AS start_date,
    DATE '9999-12-31' AS end_date,
    TRUE AS is_current,
    now() AS load_dts,
    'samplesuperstore_clean' AS record_source
FROM student34.samplesuperstore_clean;


SELECT COUNT(*) FROM student34.sat_sale_metrics;
SELECT COUNT(*) FROM student34.sat_ship_mode_attr;
SELECT COUNT(*) FROM student34.sat_segment_attr;
SELECT COUNT(*) FROM student34.sat_location_attr;
SELECT COUNT(*) FROM student34.sat_product_category_attr;



ALTER TABLE student34.lnk_sale_ctx
  ADD CONSTRAINT fk_lnk_sale_ship_mode
    FOREIGN KEY (hub_ship_mode_key)
    REFERENCES student34.hub_ship_mode (hub_ship_mode_key) NOT VALID;

ALTER TABLE student34.lnk_sale_ctx
  ADD CONSTRAINT fk_lnk_sale_segment
    FOREIGN KEY (hub_segment_key)
    REFERENCES student34.hub_segment (hub_segment_key) NOT VALID;

ALTER TABLE student34.lnk_sale_ctx
  ADD CONSTRAINT fk_lnk_sale_location
    FOREIGN KEY (hub_location_key)
    REFERENCES student34.hub_location (hub_location_key) NOT VALID;

ALTER TABLE student34.lnk_sale_ctx
  ADD CONSTRAINT fk_lnk_sale_product_category
    FOREIGN KEY (hub_product_category_key)
    REFERENCES student34.hub_product_category (hub_product_category_key) NOT VALID;



ALTER TABLE student34.sat_ship_mode_attr
  ADD CONSTRAINT fk_sat_ship_mode_attr
    FOREIGN KEY (hub_ship_mode_key)
    REFERENCES student34.hub_ship_mode (hub_ship_mode_key) NOT VALID;

ALTER TABLE student34.sat_segment_attr
  ADD CONSTRAINT fk_sat_segment_attr
    FOREIGN KEY (hub_segment_key)
    REFERENCES student34.hub_segment (hub_segment_key) NOT VALID;

ALTER TABLE student34.sat_location_attr
  ADD CONSTRAINT fk_sat_location_attr
    FOREIGN KEY (hub_location_key)
    REFERENCES student34.hub_location (hub_location_key) NOT VALID;

ALTER TABLE student34.sat_product_category_attr
  ADD CONSTRAINT fk_sat_product_category_attr
    FOREIGN KEY (hub_product_category_key)
    REFERENCES student34.hub_product_category (hub_product_category_key) NOT VALID;


ALTER TABLE student34.sat_sale_metrics
  ADD CONSTRAINT fk_sat_sale_metrics
    FOREIGN KEY (lnk_sale_ctx_key)
    REFERENCES student34.lnk_sale_ctx (lnk_sale_ctx_key) NOT VALID;