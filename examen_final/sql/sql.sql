CREATE TABLE IF NOT EXISTS memory.dds.hub_customer (
  customer_hk     VARBINARY,
  customer_bk     VARCHAR,
  navi_date       TIMESTAMP,
  record_source   VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.hub_supplier (
  supplier_hk     VARBINARY,
  supplier_bk     VARCHAR,
  navi_date       TIMESTAMP,
  record_source   VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.hub_part (
  part_hk         VARBINARY,
  part_bk         VARCHAR,
  navi_date       TIMESTAMP,
  record_source   VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.hub_order (
  order_hk        VARBINARY,
  order_bk        VARCHAR,
  navi_date       TIMESTAMP,
  record_source   VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.hub_lineitem (
  lineitem_hk     VARBINARY,
  lineitem_bk     VARCHAR,   -- ORDERKEY|LINENUMBER
  navi_date       TIMESTAMP,
  record_source   VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.hub_nation (
  nation_hk       VARBINARY,
  nation_bk       VARCHAR,
  navi_date       TIMESTAMP,
  record_source   VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.hub_region (
  region_hk       VARBINARY,
  region_bk       VARCHAR,
  navi_date       TIMESTAMP,
  record_source   VARCHAR
);


CREATE TABLE IF NOT EXISTS memory.dds.lnk_order_customer (
  lnk_hk          VARBINARY,
  order_hk        VARBINARY,
  customer_hk     VARBINARY,
  navi_date       TIMESTAMP,
  record_source   VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.lnk_lineitem_order (
  lnk_hk          VARBINARY,
  lineitem_hk     VARBINARY,
  order_hk        VARBINARY,
  navi_date       TIMESTAMP,
  record_source   VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.lnk_lineitem_part (
  lnk_hk          VARBINARY,
  lineitem_hk     VARBINARY,
  part_hk         VARBINARY,
  navi_date       TIMESTAMP,
  record_source   VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.lnk_lineitem_supplier (
  lnk_hk          VARBINARY,
  lineitem_hk     VARBINARY,
  supplier_hk     VARBINARY,
  navi_date       TIMESTAMP,
  record_source   VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.lnk_customer_nation (
  lnk_hk          VARBINARY,
  customer_hk     VARBINARY,
  nation_hk       VARBINARY,
  navi_date       TIMESTAMP,
  record_source   VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.lnk_supplier_nation (
  lnk_hk          VARBINARY,
  supplier_hk     VARBINARY,
  nation_hk       VARBINARY,
  navi_date       TIMESTAMP,
  record_source   VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.lnk_nation_region (
  lnk_hk          VARBINARY,
  nation_hk       VARBINARY,
  region_hk       VARBINARY,
  navi_date       TIMESTAMP,
  record_source   VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.lnk_part_supplier (
  lnk_hk          VARBINARY,
  part_hk         VARBINARY,
  supplier_hk     VARBINARY,
  navi_date       TIMESTAMP,
  record_source   VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.sat_customer_attr (
  customer_hk     VARBINARY,
  c_name          VARCHAR,
  c_address       VARCHAR,
  c_phone         VARCHAR,
  c_acctbal       DOUBLE,
  c_mktsegment    VARCHAR,
  c_comment       VARCHAR,
  hashdiff        VARBINARY,
  start_date      DATE,
  end_date        DATE,
  is_current      BOOLEAN,
  navi_date       TIMESTAMP,
  record_source   VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.sat_supplier_attr (
  supplier_hk     VARBINARY,
  s_name          VARCHAR,
  s_address       VARCHAR,
  s_phone         VARCHAR,
  s_acctbal       DOUBLE,
  s_comment       VARCHAR,
  hashdiff        VARBINARY,
  start_date      DATE,
  end_date        DATE,
  is_current      BOOLEAN,
  navi_date       TIMESTAMP,
  record_source   VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.sat_part_attr (
  part_hk         VARBINARY,
  p_name          VARCHAR,
  p_mfgr          VARCHAR,
  p_brand         VARCHAR,
  p_type          VARCHAR,
  p_size          INTEGER,
  p_container     VARCHAR,
  p_retailprice   DOUBLE,
  p_comment       VARCHAR,
  hashdiff        VARBINARY,
  start_date      DATE,
  end_date        DATE,
  is_current      BOOLEAN,
  navi_date       TIMESTAMP,
  record_source   VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.sat_order_attr (
  order_hk        VARBINARY,
  o_orderstatus   VARCHAR,
  o_totalprice    DOUBLE,
  o_orderdate     DATE,
  o_orderpriority VARCHAR,
  o_clerk         VARCHAR,
  o_shippriority  INTEGER,
  o_comment       VARCHAR,
  hashdiff        VARBINARY,
  start_date      DATE,
  end_date        DATE,
  is_current      BOOLEAN,
  navi_date       TIMESTAMP,
  record_source   VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.sat_lineitem_attr (
  lineitem_hk     VARBINARY,
  l_quantity      DOUBLE,
  l_extendedprice DOUBLE,
  l_discount      DOUBLE,
  l_tax           DOUBLE,
  l_returnflag    VARCHAR,
  l_linestatus    VARCHAR,
  l_shipdate      DATE,
  l_commitdate    DATE,
  l_receiptdate   DATE,
  l_shipinstruct  VARCHAR,
  l_shipmode      VARCHAR,
  l_comment       VARCHAR,
  hashdiff        VARBINARY,
  start_date      DATE,
  end_date        DATE,
  is_current      BOOLEAN,
  navi_date       TIMESTAMP,
  record_source   VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.sat_nation_attr (
  nation_hk       VARBINARY,
  n_name          VARCHAR,
  n_comment       VARCHAR,
  hashdiff        VARBINARY,
  start_date      DATE,
  end_date        DATE,
  is_current      BOOLEAN,
  navi_date       TIMESTAMP,
  record_source   VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.sat_region_attr (
  region_hk       VARBINARY,
  r_name          VARCHAR,
  r_comment       VARCHAR,
  hashdiff        VARBINARY,
  start_date      DATE,
  end_date        DATE,
  is_current      BOOLEAN,
  navi_date       TIMESTAMP,
  record_source   VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.sat_part_supplier_attr (
  lnk_hk          VARBINARY,  -- satellite of LNK_PART_SUPPLIER
  ps_availqty     INTEGER,
  ps_supplycost   DOUBLE,
  ps_comment      VARCHAR,
  hashdiff        VARBINARY,
  start_date      DATE,
  end_date        DATE,
  is_current      BOOLEAN,
  navi_date       TIMESTAMP,
  record_source   VARCHAR
);


INSERT INTO memory.dds.hub_customer
SELECT DISTINCT
  md5(to_utf8(upper(trim(cast(custkey as varchar)))))   AS customer_hk,
  upper(trim(cast(custkey as varchar)))                 AS customer_bk,
  current_timestamp                                     AS navi_date,
  'tpch.tiny.customer'                                  AS record_source
FROM tpch.tiny.customer;

INSERT INTO memory.dds.hub_supplier
SELECT DISTINCT
  md5(to_utf8(upper(trim(cast(suppkey as varchar)))))   AS supplier_hk,
  upper(trim(cast(suppkey as varchar)))                 AS supplier_bk,
  current_timestamp,
  'tpch.tiny.supplier'
FROM tpch.tiny.supplier;

INSERT INTO memory.dds.hub_part
SELECT DISTINCT
  md5(to_utf8(upper(trim(cast(partkey as varchar)))))   AS part_hk,
  upper(trim(cast(partkey as varchar)))                 AS part_bk,
  current_timestamp,
  'tpch.tiny.part'
FROM tpch.tiny.part;

INSERT INTO memory.dds.hub_order
SELECT DISTINCT
  md5(to_utf8(upper(trim(cast(orderkey as varchar)))))   AS order_hk,
  upper(trim(cast(orderkey as varchar)))                                      AS order_bk,
  current_timestamp,
  'tpch.tiny.orders'
FROM tpch.tiny.orders;

INSERT INTO memory.dds.hub_lineitem
SELECT DISTINCT
  md5(to_utf8(upper(trim(concat_ws('|',
      cast(orderkey as varchar),
      cast(linenumber as varchar)
  )))))                                                                        AS lineitem_hk,
  upper(trim(concat_ws('|',
      cast(orderkey as varchar),
      cast(linenumber as varchar)
  )))                                                                         AS lineitem_bk,
  current_timestamp,
  'tpch.tiny.lineitem'
FROM tpch.tiny.lineitem;

INSERT INTO memory.dds.hub_nation
SELECT DISTINCT
  md5(to_utf8(upper(trim(cast(nationkey as varchar)))))                                AS nation_hk,
  upper(trim(cast(nationkey as varchar)))                                     AS nation_bk,
  current_timestamp,
  'tpch.tiny.nation'
FROM tpch.tiny.nation;

INSERT INTO memory.dds.hub_region
SELECT DISTINCT
  md5(to_utf8(upper(trim(cast(regionkey as varchar)))))                                AS region_hk,
  upper(trim(cast(regionkey as varchar)))                                     AS region_bk,
  current_timestamp,
  'tpch.tiny.region'
FROM tpch.tiny.region;


INSERT INTO memory.dds.hub_customer
SELECT DISTINCT
  md5(to_utf8(upper(trim(cast(custkey as varchar)))))   AS customer_hk,
  upper(trim(cast(custkey as varchar)))                 AS customer_bk,
  current_timestamp                                     AS navi_date,
  'tpch.tiny.customer'                                  AS record_source
FROM tpch.tiny.customer;

INSERT INTO memory.dds.lnk_order_customer
SELECT
  md5(to_utf8(upper(trim(concat_ws('|',
      cast(o.orderkey as varchar),
      cast(o.custkey as varchar)
  )))))                                                                        AS lnk_hk,
  md5(to_utf8(upper(trim(cast(o.orderkey as varchar)))))                               AS order_hk,
  md5(to_utf8(upper(trim(cast(o.custkey as varchar)))))                                AS customer_hk,
  current_timestamp                                                           AS navi_date,
  'tpch.tiny.orders'                                                          AS record_source
FROM tpch.tiny.orders o;

INSERT INTO memory.dds.lnk_lineitem_order
SELECT
  md5(to_utf8(upper(trim(concat_ws('|',
      cast(l.orderkey as varchar),
      cast(l.linenumber as varchar),
      cast(l.orderkey as varchar)
  )))))                                                                        AS lnk_hk,
  md5(to_utf8(upper(trim(concat_ws('|', cast(l.orderkey as varchar), cast(l.linenumber as varchar)))))) AS lineitem_hk,
  md5(to_utf8(upper(trim(cast(l.orderkey as varchar)))))                               AS order_hk,
  current_timestamp,
  'tpch.tiny.lineitem'
FROM tpch.tiny.lineitem l;

INSERT INTO memory.dds.lnk_lineitem_part
SELECT
  md5(to_utf8(upper(trim(concat_ws('|',
      cast(l.orderkey as varchar),
      cast(l.linenumber as varchar),
      cast(l.partkey as varchar)
  )))))                                                                        AS lnk_hk,
  md5(to_utf8(upper(trim(concat_ws('|', cast(l.orderkey as varchar), cast(l.linenumber as varchar)))))) AS lineitem_hk,
  md5(to_utf8(upper(trim(cast(l.partkey as varchar)))))                                AS part_hk,
  current_timestamp,
  'tpch.tiny.lineitem'
FROM tpch.tiny.lineitem l;

INSERT INTO memory.dds.lnk_lineitem_supplier
SELECT
  md5(to_utf8(upper(trim(concat_ws('|',
      cast(l.orderkey as varchar),
      cast(l.linenumber as varchar),
      cast(l.suppkey as varchar)
  )))))                                                                        AS lnk_hk,
  md5(to_utf8(upper(trim(concat_ws('|', cast(l.orderkey as varchar), cast(l.linenumber as varchar)))))) AS lineitem_hk,
  md5(to_utf8(upper(trim(cast(l.suppkey as varchar)))))                                AS supplier_hk,
  current_timestamp,
  'tpch.tiny.lineitem'
FROM tpch.tiny.lineitem l;

INSERT INTO memory.dds.lnk_customer_nation
SELECT
  md5(to_utf8(upper(trim(concat_ws('|',
      cast(c.custkey as varchar),
      cast(c.nationkey as varchar)
  )))))                                                                        AS lnk_hk,
  md5(to_utf8(upper(trim(cast(c.custkey as varchar)))))                                AS customer_hk,
  md5(to_utf8(upper(trim(cast(c.nationkey as varchar)))))                              AS nation_hk,
  current_timestamp,
  'tpch.tiny.customer'
FROM tpch.tiny.customer c;

INSERT INTO memory.dds.lnk_supplier_nation
SELECT
  md5(to_utf8(upper(trim(concat_ws('|',
      cast(s.suppkey as varchar),
      cast(s.nationkey as varchar)
  )))))                                                                        AS lnk_hk,
  md5(to_utf8(upper(trim(cast(s.suppkey as varchar)))))                                AS supplier_hk,
  md5(to_utf8(upper(trim(cast(s.nationkey as varchar)))))                              AS nation_hk,
  current_timestamp,
  'tpch.tiny.supplier'
FROM tpch.tiny.supplier s;

INSERT INTO memory.dds.lnk_nation_region
SELECT
  md5(to_utf8(upper(trim(concat_ws('|',
      cast(n.nationkey as varchar),
      cast(n.regionkey as varchar)
  )))))                                                                        AS lnk_hk,
  md5(to_utf8(upper(trim(cast(n.nationkey as varchar)))))                              AS nation_hk,
  md5(to_utf8(upper(trim(cast(n.regionkey as varchar)))))                              AS region_hk,
  current_timestamp,
  'tpch.tiny.nation'
FROM tpch.tiny.nation n;

INSERT INTO memory.dds.lnk_part_supplier
SELECT
  md5(to_utf8(upper(trim(concat_ws('|',
      cast(ps.partkey as varchar),
      cast(ps.suppkey as varchar)
  )))))                                                                        AS lnk_hk,
  md5(to_utf8(upper(trim(cast(ps.partkey as varchar)))))                               AS part_hk,
  md5(to_utf8(upper(trim(cast(ps.suppkey as varchar)))))                               AS supplier_hk,
  current_timestamp,
  'tpch.tiny.partsupp'
FROM tpch.tiny.partsupp ps;


INSERT INTO memory.dds.hub_customer
SELECT DISTINCT
  md5(to_utf8(upper(trim(cast(custkey as varchar)))))   AS customer_hk,
  upper(trim(cast(custkey as varchar)))                 AS customer_bk,
  current_timestamp                                     AS navi_date,
  'tpch.tiny.customer'                                  AS record_source
FROM tpch.tiny.customer;

INSERT INTO memory.dds.sat_customer_attr
SELECT
  md5(to_utf8(upper(trim(cast(c.custkey as varchar))))) AS customer_hk,
  c.name, c.address, c.phone, c.acctbal, c.mktsegment, c.comment,
  md5(to_utf8(upper(trim(concat_ws('|',
      coalesce(c.name,''),
      coalesce(c.address,''),
      coalesce(c.phone,''),
      cast(coalesce(c.acctbal, 0.0) as varchar),
      coalesce(c.mktsegment,''),
      coalesce(c.comment,'')
  ))))) AS hashdiff,
  current_date AS start_date,
  DATE '9999-12-31' AS end_date,
  true AS is_current,
  current_timestamp AS navi_date,
  'tpch.tiny.customer' AS record_source
FROM tpch.tiny.customer c;

INSERT INTO memory.dds.sat_supplier_attr
SELECT
  md5(to_utf8(upper(trim(cast(s.suppkey as varchar))))) AS supplier_hk,
  s.name, s.address, s.phone, s.acctbal, s.comment,
  md5(to_utf8(upper(trim(concat_ws('|',
      coalesce(s.name,''),
      coalesce(s.address,''),
      coalesce(s.phone,''),
      cast(coalesce(s.acctbal, 0.0) as varchar),
      coalesce(s.comment,'')
  ))))) AS hashdiff,
  current_date,
  DATE '9999-12-31',
  true,
  current_timestamp,
  'tpch.tiny.supplier'
FROM tpch.tiny.supplier s;

INSERT INTO memory.dds.sat_part_attr
SELECT
  md5(to_utf8(upper(trim(cast(p.partkey as varchar))))) AS part_hk,
  p.name, p.mfgr, p.brand, p.type, p.size, p.container, p.retailprice, p.comment,
  md5(to_utf8(upper(trim(concat_ws('|',
      coalesce(p.name,''),
      coalesce(p.mfgr,''),
      coalesce(p.brand,''),
      coalesce(p.type,''),
      cast(coalesce(p.size, 0) as varchar),
      coalesce(p.container,''),
      cast(coalesce(p.retailprice, 0.0) as varchar),
      coalesce(p.comment,'')
  ))))) AS hashdiff,
  current_date,
  DATE '9999-12-31',
  true,
  current_timestamp,
  'tpch.tiny.part'
FROM tpch.tiny.part p;

INSERT INTO memory.dds.sat_order_attr
SELECT
  md5(to_utf8(upper(trim(cast(o.orderkey as varchar))))) AS order_hk,
  o.orderstatus, o.totalprice, o.orderdate, o.orderpriority, o.clerk, o.shippriority, o.comment,
  md5(to_utf8(upper(trim(concat_ws('|',
      coalesce(o.orderstatus,''),
      cast(coalesce(o.totalprice, 0.0) as varchar),
      cast(o.orderdate as varchar),
      coalesce(o.orderpriority,''),
      coalesce(o.clerk,''),
      cast(coalesce(o.shippriority, 0) as varchar),
      coalesce(o.comment,'')
  ))))) AS hashdiff,
  o.orderdate AS start_date,
  DATE '9999-12-31' AS end_date,
  true AS is_current,
  current_timestamp AS navi_date,
  'tpch.tiny.orders' AS record_source
FROM tpch.tiny.orders o;

INSERT INTO memory.dds.sat_lineitem_attr
SELECT
  md5(to_utf8(upper(trim(concat_ws('|', cast(l.orderkey as varchar), cast(l.linenumber as varchar)))))) AS lineitem_hk,
  l.quantity, l.extendedprice, l.discount, l.tax, l.returnflag, l.linestatus,
  l.shipdate, l.commitdate, l.receiptdate, l.shipinstruct, l.shipmode, l.comment,
  md5(to_utf8(upper(trim(concat_ws('|',
      cast(coalesce(l.quantity, 0.0) as varchar),
      cast(coalesce(l.extendedprice, 0.0) as varchar),
      cast(coalesce(l.discount, 0.0) as varchar),
      cast(coalesce(l.tax, 0.0) as varchar),
      coalesce(l.returnflag,''),
      coalesce(l.linestatus,''),
      cast(l.shipdate as varchar),
      cast(l.commitdate as varchar),
      cast(l.receiptdate as varchar),
      coalesce(l.shipinstruct,''),
      coalesce(l.shipmode,''),
      coalesce(l.comment,'')
  ))))) AS hashdiff,
  l.shipdate AS start_date,
  DATE '9999-12-31',
  true,
  current_timestamp,
  'tpch.tiny.lineitem'
FROM tpch.tiny.lineitem l;

INSERT INTO memory.dds.sat_nation_attr
SELECT
  md5(to_utf8(upper(trim(cast(n.nationkey as varchar))))) AS nation_hk,
  n.name, n.comment,
  md5(to_utf8(upper(trim(concat_ws('|',
      coalesce(n.name,''),
      coalesce(n.comment,'')
  ))))) AS hashdiff,
  current_date,
  DATE '9999-12-31',
  true,
  current_timestamp,
  'tpch.tiny.nation'
FROM tpch.tiny.nation n;

INSERT INTO memory.dds.sat_region_attr
SELECT
  md5(to_utf8(upper(trim(cast(r.regionkey as varchar))))) AS region_hk,
  r.name, r.comment,
  md5(to_utf8(upper(trim(concat_ws('|',
      coalesce(r.name,''),
      coalesce(r.comment,'')
  ))))) AS hashdiff,
  current_date,
  DATE '9999-12-31',
  true,
  current_timestamp,
  'tpch.tiny.region'
FROM tpch.tiny.region r;

INSERT INTO memory.dds.sat_part_supplier_attr
SELECT
  md5(to_utf8(upper(trim(concat_ws('|', cast(ps.partkey as varchar), cast(ps.suppkey as varchar)))))) AS lnk_hk,
  ps.availqty, ps.supplycost, ps.comment,
  md5(to_utf8(upper(trim(concat_ws('|',
      cast(coalesce(ps.availqty, 0) as varchar),
      cast(coalesce(ps.supplycost, 0.0) as varchar),
      coalesce(ps.comment,'')
  ))))) AS hashdiff,
  current_date,
  DATE '9999-12-31',
  true,
  current_timestamp,
  'tpch.tiny.partsupp'
FROM tpch.tiny.partsupp ps;


SELECT 'hub_customer' AS obj, count(*) cnt FROM memory.dds.hub_customer
UNION ALL SELECT 'hub_orders', count(*) FROM memory.dds.hub_order
UNION ALL SELECT 'hub_lineitem', count(*) FROM memory.dds.hub_lineitem
UNION ALL SELECT 'lnk_order_customer', count(*) FROM memory.dds.lnk_order_customer
UNION ALL SELECT 'sat_order_attr', count(*) FROM memory.dds.sat_order_attr
UNION ALL SELECT 'sat_lineitem_attr', count(*) FROM memory.dds.sat_lineitem_attr;

SELECT
  hc.customer_bk,
  sc.c_name,
  round(sum(so.o_totalprice),2) AS total_price
FROM memory.dds.lnk_order_customer loc
JOIN memory.dds.hub_customer hc
  ON hc.customer_hk = loc.customer_hk
JOIN memory.dds.hub_order ho
  ON ho.order_hk = loc.order_hk
JOIN memory.dds.sat_customer_attr sc
  ON sc.customer_hk = hc.customer_hk AND sc.is_current
JOIN memory.dds.sat_order_attr so
  ON so.order_hk = ho.order_hk AND so.is_current
GROUP BY 1,2
ORDER BY total_price DESC
LIMIT 10;

SELECT
  hs.supplier_bk,
  ss.s_name,
  round(sum(sl.l_extendedprice * (1 - sl.l_discount)),2) AS revenue
FROM memory.dds.lnk_lineitem_supplier lis
JOIN memory.dds.hub_supplier hs
  ON hs.supplier_hk = lis.supplier_hk
JOIN memory.dds.sat_supplier_attr ss
  ON ss.supplier_hk = hs.supplier_hk AND ss.is_current
JOIN memory.dds.sat_lineitem_attr sl
  ON sl.lineitem_hk = lis.lineitem_hk AND sl.is_current
GROUP BY 1,2
ORDER BY revenue DESC
LIMIT 10;

SELECT
  so.o_orderdate,
  count(*) AS orders_cnt,
  round(sum(so.o_totalprice),2) AS total_price
FROM memory.dds.sat_order_attr so
WHERE so.is_current
GROUP BY 1
ORDER BY 1 desc
limit 10;


INSERT INTO memory.dds.hub_order
SELECT DISTINCT
  md5(to_utf8(upper(trim(cast(o.orderkey as varchar)))))       AS order_hk,
  upper(trim(cast(o.orderkey as varchar)))                     AS order_bk,
  current_timestamp                                            AS navi_date,
  'tpch.tiny.orders'                                           AS record_source
FROM tpch.tiny.orders o
WHERE o.orderdate = DATE '${run_date}';


INSERT INTO memory.dds.lnk_order_customer
SELECT
  md5(to_utf8(upper(trim(concat_ws('|',
      cast(o.orderkey as varchar),
      cast(o.custkey as varchar)
  )))))                                                        AS lnk_hk,
  md5(to_utf8(upper(trim(cast(o.orderkey as varchar)))))       AS order_hk,
  md5(to_utf8(upper(trim(cast(o.custkey as varchar)))))        AS customer_hk,
  current_timestamp                                            AS navi_date,
  'tpch.tiny.orders'                                           AS record_source
FROM tpch.tiny.orders o
WHERE o.orderdate = DATE '${run_date}';


UPDATE memory.dds.sat_order_attr
SET
  end_date   = date_add('day', -1, DATE '${run_date}'),
  is_current = false,
  navi_date  = current_timestamp
WHERE is_current = true
  AND EXISTS (
    SELECT 1
    FROM tpch.tiny.orders o
    WHERE o.orderdate = DATE '${run_date}'
      AND order_hk = md5(to_utf8(upper(trim(cast(o.orderkey as varchar)))))
      AND hashdiff <> md5(to_utf8(upper(trim(concat_ws('|',
            coalesce(o.orderstatus,''),
            cast(coalesce(o.totalprice, 0.0) as varchar),
            cast(o.orderdate as varchar),
            coalesce(o.orderpriority,''),
            coalesce(o.clerk,''),
            cast(coalesce(o.shippriority, 0) as varchar),
            coalesce(o.comment,'')
      )))))
  );


  INSERT INTO memory.dds.sat_order_attr
SELECT
  md5(to_utf8(upper(trim(cast(o.orderkey as varchar))))) AS order_hk,
  o.orderstatus, o.totalprice, o.orderdate, o.orderpriority, o.clerk, o.shippriority, o.comment,
  md5(to_utf8(upper(trim(concat_ws('|',
      coalesce(o.orderstatus,''),
      cast(coalesce(o.totalprice, 0.0) as varchar),
      cast(o.orderdate as varchar),
      coalesce(o.orderpriority,''),
      coalesce(o.clerk,''),
      cast(coalesce(o.shippriority, 0) as varchar),
      coalesce(o.comment,'')
  ))))) AS hashdiff,
  DATE '${run_date}' AS start_date,
  DATE '9999-12-31' AS end_date,
  true AS is_current,
  current_timestamp AS navi_date,
  'tpch.tiny.orders' AS record_source
FROM tpch.tiny.orders o
WHERE o.orderdate = DATE '${run_date}'
  AND NOT EXISTS (
    SELECT 1
    FROM memory.dds.sat_order_attr cur
    WHERE cur.order_hk = md5(to_utf8(upper(trim(cast(o.orderkey as varchar)))))
      AND cur.is_current = true
      AND cur.hashdiff = md5(to_utf8(upper(trim(concat_ws('|',
          coalesce(o.orderstatus,''),
          cast(coalesce(o.totalprice, 0.0) as varchar),
          cast(o.orderdate as varchar),
          coalesce(o.orderpriority,''),
          coalesce(o.clerk,''),
          cast(coalesce(o.shippriority, 0) as varchar),
          coalesce(o.comment,'')
      )))))
  );



  DROP TABLE IF EXISTS memory.dds.sat_order_attr_new;

CREATE TABLE memory.dds.sat_order_attr_new AS
WITH src AS (
  SELECT
    md5(to_utf8(upper(trim(cast(o.orderkey as varchar))))) AS order_hk,
    o.orderstatus, o.totalprice, o.orderdate, o.orderpriority, o.clerk, o.shippriority, o.comment,
    md5(to_utf8(upper(trim(concat_ws('|',
      coalesce(o.orderstatus,''),
      cast(coalesce(o.totalprice, 0.0) as varchar),
      cast(o.orderdate as varchar),
      coalesce(o.orderpriority,''),
      coalesce(o.clerk,''),
      cast(coalesce(o.shippriority, 0) as varchar),
      coalesce(o.comment,'')
    ))))) AS hashdiff
  FROM tpch.tiny.orders o
  WHERE o.orderdate = DATE '1996-01-01'
),
closed_old AS (
  SELECT
    t.order_hk,
    t.o_orderstatus, t.o_totalprice, t.o_orderdate, t.o_orderpriority, t.o_clerk, t.o_shippriority, t.o_comment,
    t.hashdiff,
    t.start_date,
    CASE
      WHEN t.is_current = true
           AND s.order_hk IS NOT NULL
           AND t.hashdiff <> s.hashdiff
      THEN date_add('day', -1, DATE '1996-01-01')
      ELSE t.end_date
    END AS end_date,
    CASE
      WHEN t.is_current = true
           AND s.order_hk IS NOT NULL
           AND t.hashdiff <> s.hashdiff
      THEN false
      ELSE t.is_current
    END AS is_current,
    current_timestamp AS navi_date,
    t.record_source
  FROM memory.dds.sat_order_attr t
  LEFT JOIN src s
    ON s.order_hk = t.order_hk
),
new_versions AS (
  SELECT
    s.order_hk,
    s.orderstatus AS o_orderstatus,
    s.totalprice  AS o_totalprice,
    s.orderdate   AS o_orderdate,
    s.orderpriority AS o_orderpriority,
    s.clerk       AS o_clerk,
    s.shippriority AS o_shippriority,
    s.comment     AS o_comment,
    s.hashdiff,
    DATE '1996-01-01' AS start_date,
    DATE '9999-12-31' AS end_date,
    true AS is_current,
    current_timestamp AS navi_date,
    'tpch.tiny.orders' AS record_source
  FROM src s
  LEFT JOIN memory.dds.sat_order_attr cur
    ON cur.order_hk = s.order_hk AND cur.is_current = true
  WHERE cur.order_hk IS NULL OR cur.hashdiff <> s.hashdiff
)
SELECT * FROM closed_old
UNION ALL
SELECT * FROM new_versions;


DROP TABLE memory.dds.sat_order_attr;
ALTER TABLE memory.dds.sat_order_attr_new RENAME TO sat_order_attr;