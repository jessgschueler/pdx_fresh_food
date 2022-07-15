with farmers_markets as (
    SELECT
        CONCAT('fm',Farmers_Markets.OBJECTID) as id,
        Farmers_Markets.Market as name,
        Farmers_Markets.Location as location,
        Farmers_Markets.sextant as sextant,
    FROM deb-01-346001.pdx_fresh_food.Farmers_Markets
),

grocery_stores as (
    SELECT
        CONCAT('gs',Grocery_Stores.OBJECTID) as id,
        Grocery_Stores.Name as name,
        Grocery_Stores.Address as location,
        Grocery_Stores.sextant as sextant,
    FROM deb-01-346001.pdx_fresh_food.Grocery_Stores
),

csa_dropoff as (
    SELECT
        CONCAT('csa',CSA_Farm_Dropoff.OBJECTID) as id,
        CSA_Farm_Dropoff.Farm_Name as name,
        CSA_Farm_Dropoff.Location as location,
        CSA_Farm_Dropoff.sextant as sextant,
    FROM deb-01-346001.pdx_fresh_food.CSA_Farm_Dropoff
)


SELECT *
  FROM farmers_markets

 UNION ALL

 SELECT *
   FROM grocery_stores
    
UNION ALL

 SELECT *
   FROM csa_dropoff