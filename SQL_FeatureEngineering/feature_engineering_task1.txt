1) Perform One-Hot Encoding on the variable on one or more Categorical Variables in the
dataset


--i update the column landslope for uniform dataset--
UPDATE property_sales
SET landslope = INITCAP(landslope);

--ONE HOT CODING FOR LANDSLOPE--
SELECT 
    id,
	landslope,
    CASE WHEN landslope = 'Gentle Slope' THEN 1 ELSE 0 END AS gentle_slope,
    CASE WHEN landslope = 'Moderate Slope' THEN 1 ELSE 0 END AS moderate_slope,
    CASE WHEN landslope = 'Severe Slope' THEN 1 ELSE 0 END AS severe_slope
FROM property_sales
ORDER BY id

-- ONE HOT CODING FOR HouseStyle--

SELECT 
    id,
    HouseStyle,
    CASE WHEN HouseStyle = 'One and one-half story: 2nd level finished' THEN 1 ELSE 0 END AS One_Half_Finished,
    CASE WHEN HouseStyle = 'One and one-half story: 2nd level unfinished' THEN 1 ELSE 0 END AS One_Half_Unfinished,
    CASE WHEN HouseStyle = 'One story' THEN 1 ELSE 0 END AS One_story,
    CASE WHEN HouseStyle = 'Split Foyer' THEN 1 ELSE 0 END AS Split_Foyer,
    CASE WHEN HouseStyle = 'Split Level' THEN 1 ELSE 0 END AS Split_Level,
    CASE WHEN HouseStyle = 'Two and one-half story: 2nd level finished' THEN 1 ELSE 0 END AS Two_half_finished,
    CASE WHEN HouseStyle = 'Two and one-half story: 2nd level unfinished' THEN 1 ELSE 0 END AS Two_half_unfinished,
    CASE WHEN HouseStyle = 'Two story' THEN 1 ELSE 0 END AS Two_story
FROM property_sales
ORDER BY id



 -- ONE HOT CODING FOR landcontour--
SELECT 
    id,
    landcontour,
    CASE WHEN landcontour = 'Depression' THEN 1 ELSE 0 END AS Depression,
    CASE WHEN landcontour = 'Hillside - Significant slope from side to side' THEN 1 ELSE 0 END AS hillside,
    CASE WHEN landcontour = 'Banked - Quick and significant rise from street grade to building' THEN 1 ELSE 0 END AS banked,
    CASE WHEN landcontour = 'Near Flat/Level' THEN 1 ELSE 0 END AS Near_Flat_Level
FROM property_sales
ORDER BY id

-- ONE HOT CODING FOR bldgtype--

SELECT 
    id,
	bldgtype,
	CASE WHEN bldgtype ='Townhouse Inside Unit' THEN 1 ELSE 0 END AS Townhouse_Inside_Unit,
	CASE WHEN bldgtype ='Duplex' THEN 1 ELSE 0 END AS Duplex,
	CASE WHEN bldgtype ='Two-family Conversion; originally built as one-family dwelling' THEN 1 ELSE 0 END AS Two_family_Conversion,
	CASE WHEN bldgtype ='Single-family Detached' THEN 1 ELSE 0 END AS Single_family_Detached,
	CASE WHEN bldgtype ='Townhouse End Unit' THEN 1 ELSE 0 END AS Townhouse_End_Unit
FROM property_sales
ORDER BY id
