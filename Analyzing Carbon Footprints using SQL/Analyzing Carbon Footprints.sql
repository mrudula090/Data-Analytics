-- Select all fields where the company name is Coca-Cola, limiting to the first six results
SELECT *
FROM product_emissions.product_emissions	
WHERE company LIKE 'Coca-Cola%'
LIMIT 6;

-- Return the most recent year for which data was collected
SELECT MAX(year)
FROM product_emissions.product_emissions;

-- Return industry_group and a rounded total of carbon_footprint_pcf, aliased as total_industry_footprint
-- Limit to data for 2017 and order by total_industry_footprint
SELECT industry_group, ROUND(SUM(carbon_footprint_pcf), 1) AS total_industry_footprint
FROM product_emissions.product_emissions
GROUP BY industry_group, year
HAVING year = 2017
ORDER BY total_industry_footprint DESC;

-- Return the industry groups and a count of the number of records for each group
-- Limit the results to only those from 2017 and alias the count as count_industry
-- Order by count_industry, descending
SELECT industry_group, COUNT(*) AS count_industry
FROM product_emissions.product_emissions
GROUP BY industry_group, year
HAVING year = 2017
ORDER BY count_industry DESC;

-- Return industry_group, company, and product_name for all records reporting in the Capital Goods industry during 2017
SELECT industry_group, company, product_name
FROM product_emissions.product_emissions
WHERE year = 2017
AND industry_group = 'Capital Goods';

-- Return product_name, company, and all stages of pcf emissions for Daikin in 2016
SELECT product_name, 
    company, 
    upstream_percent_total_pcf, 
    operations_percent_total_pcf, 
    downstream_percent_total_pcf
FROM product_emissions.product_emissions
WHERE year = 2016
    AND company = 'Daikin Industries, Ltd.';
	
-- Select all information from product_emissions
SELECT *
FROM product_emissions.product_emissions;

-- Group by country
-- Select country and the sum of total carbon_footprint_pcf by country, aliasing as total_country_footprint
SELECT country, SUM(carbon_footprint_pcf) AS total_country_footprint
FROM product_emissions.product_emissions
GROUP BY country;

-- Select company and carbon_footprint_pcf for companies in Spain
SELECT company, carbon_footprint_pcf
FROM product_emissions.product_emissions
WHERE country = 'Spain';