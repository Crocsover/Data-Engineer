3) Perform Mean encoding on one or more Categorical Variables in the dataset (hint: you
may want to use OVER() and PARTITION() commands)






--Mean encoding with single category
SELECT
    BldgType,
    AVG(SalePrice) AS MeanEncodedValue
FROM
    property_sales
GROUP BY
    BldgType;

--Mean encoding within partitions defined by the 'bldgtype' column

SELECT
    MSSubClass,
    BldgType,
    AVG(SalePrice) OVER (PARTITION BY BldgType) AS MeanEncodedValue
FROM
    property_sales;

	
