4.Perform Mean Normalization on all the numeric variables to rescale these variables (you
may add new columns for this)




-- minimum and maximum values 
SELECT
    MIN(LotFrontage) AS min_LotFrontage,
    MAX(LotFrontage) AS max_LotFrontage,
    MIN(lotarea) AS min_lotarea,
    MAX(lotarea) AS max_lotarea,
    MIN(garagearea) AS min_garagearea,
    MAX(garagearea) AS max_garagearea,
    MIN(grlivarea) AS min_grlivarea,
    MAX(grlivarea) AS max_grlivarea,
    MIN(totalbsmtsf) AS min_totalbsmtsf,
    MAX(totalbsmtsf) AS max_totalbsmtsf,
    MIN(saleprice) AS min_saleprice,
    MAX(saleprice) AS max_saleprice
INTO min_max_data
FROM property_sales;

-- creating columns
ALTER TABLE property_sales
ADD COLUMN  meannorm_LotFrontage NUMERIC,
ADD COLUMN	meannorm_lotarea NUMERIC,
ADD COLUMN	meannorm_garagearea NUMERIC,
ADD COLUMN	meannorm_grlivarea NUMERIC,
ADD COLUMN	meannorm_totalbsmtsf NUMERIC,
ADD COLUMN	meannorm_saleprice NUMERIC;

-- updating columns
UPDATE property_sales
SET meannorm_LotFrontage = (LotFrontage::numeric - min_max_data.min_LotFrontage) / (min_max_data.max_LotFrontage - min_max_data.min_LotFrontage),
    meannorm_lotarea = (lotarea::numeric - min_max_data.min_lotarea) / (min_max_data.max_lotarea - min_max_data.min_lotarea),
    meannorm_garagearea = (garagearea::numeric - min_max_data.min_garagearea) / (min_max_data.max_garagearea - min_max_data.min_garagearea),
    meannorm_grlivarea = (grlivarea::numeric - min_max_data.min_grlivarea) / (min_max_data.max_grlivarea - min_max_data.min_grlivarea),
    meannorm_totalbsmtsf = (totalbsmtsf::numeric - min_max_data.min_totalbsmtsf) / (min_max_data.max_totalbsmtsf - min_max_data.min_totalbsmtsf),
    meannorm_saleprice = (saleprice::numeric - min_max_data.min_saleprice) / (min_max_data.max_saleprice - min_max_data.min_saleprice)
FROM min_max_data;

-- retrieve the updated data
SELECT * FROM property_sales ORDER BY id;
