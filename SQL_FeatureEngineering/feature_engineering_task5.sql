5. Perform Standardization on all the numeric variables to rescale these variables (you may
add new columns for this)


ALTER TABLE property_sales
ADD COLUMN std_LotFrontage NUMERIC,
ADD COLUMN std_LotArea NUMERIC,
ADD COLUMN std_GarageArea NUMERIC,
ADD COLUMN std_GrLivArea NUMERIC,
ADD COLUMN std_TotalBsmtSF NUMERIC,
ADD COLUMN std_SalePrice NUMERIC;

-- Calculate the mean and standard deviation for each column
SELECT
    AVG(LotFrontage::NUMERIC) AS mean_LotFrontage,
    STDDEV(LotFrontage::NUMERIC) AS stddev_LotFrontage,
    AVG(LotArea::NUMERIC) AS mean_LotArea,
    STDDEV(LotArea::NUMERIC) AS stddev_LotArea,
    AVG(GarageArea::NUMERIC) AS mean_GarageArea,
    STDDEV(GarageArea::NUMERIC) AS stddev_GarageArea,
    AVG(GrLivArea::NUMERIC) AS mean_GrLivArea,
    STDDEV(GrLivArea::NUMERIC) AS stddev_GrLivArea,
    AVG(TotalBsmtSF::NUMERIC) AS mean_TotalBsmtSF,
    STDDEV(TotalBsmtSF::NUMERIC) AS stddev_TotalBsmtSF,
    AVG(SalePrice::NUMERIC) AS mean_SalePrice,
    STDDEV(SalePrice::NUMERIC) AS stddev_SalePrice
INTO std_data
FROM property_sales;

-- Updating the standardized columns
UPDATE property_sales
SET
    std_LotFrontage = (LotFrontage::NUMERIC - std_data.mean_LotFrontage) / std_data.stddev_LotFrontage,
    std_LotArea = (LotArea::NUMERIC - std_data.mean_LotArea) / std_data.stddev_LotArea,
    std_GarageArea = (GarageArea::NUMERIC - std_data.mean_GarageArea) / std_data.stddev_GarageArea,
    std_GrLivArea = (GrLivArea::NUMERIC - std_data.mean_GrLivArea) / std_data.stddev_GrLivArea,
    std_TotalBsmtSF = (TotalBsmtSF::NUMERIC - std_data.mean_TotalBsmtSF) / std_data.stddev_TotalBsmtSF,
    std_SalePrice = (SalePrice::NUMERIC - std_data.mean_SalePrice) / std_data.stddev_SalePrice
FROM std_data;

-- Retrieve the standardized data
SELECT * FROM property_sales;
