2) Perform Ordinal or Label encoding on one or more Categorical Variables in the dataset

--ordinal encoding for  Ordinal Overallqual--
SELECT id,Overallqual,
        CASE
            WHEN Overallqual = 'Very Poor' THEN 1
            WHEN Overallqual = 'Poor' THEN 2
            WHEN Overallqual = 'Below Average' THEN 3
            WHEN Overallqual = 'Average' THEN 4
            WHEN Overallqual = 'Above Average' THEN 5
            WHEN Overallqual = 'Fair' THEN 6
            WHEN Overallqual = 'Good' THEN 7
            WHEN Overallqual = 'Very Good' THEN 8
            WHEN Overallqual = 'Excellent' THEN 9
            WHEN Overallqual = 'Very Excellent' THEN 10
            ELSE NULL 
END AS Ordinal_Overallqual
from property_sales order by id;

--ordinal encoding for  Ordinal Overallcond--

SELECT id,Overallcond,
        CASE
            WHEN Overallcond = 'Very Poor' THEN 1
            WHEN Overallcond = 'Poor' THEN 2
            WHEN Overallcond = 'Below Average' THEN 3
            WHEN Overallcond = 'Average' THEN 4
            WHEN Overallcond = 'Above Average' THEN 5
            WHEN Overallcond = 'Fair' THEN 6
            WHEN Overallcond = 'Good' THEN 7
            WHEN Overallcond = 'Very Good' THEN 8
            WHEN Overallcond = 'Excellent' THEN 9
            WHEN Overallcond = 'Very Excellent' THEN 10
            ELSE NULL 
END AS Ordinal_Overallcond
from property_sales order by id;
