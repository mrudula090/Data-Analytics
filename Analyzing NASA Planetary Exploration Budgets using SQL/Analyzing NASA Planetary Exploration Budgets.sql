use nasa_mission_budgets;

select * from mission_budgets;

-- Calculate the total cost of all missions over all time
SELECT SUM(cost_MUSD) AS total_cost_MUSD
	FROM mission_budgets;
    
    -- Calculate the total cost of all missions over all time, adjusted for inflation
SELECT SUM(cost_MUSD * inflation_adjustment) AS adjusted_total_cost_MUSD
	FROM mission_budgets
    LEFT JOIN inflation
    	USING(fiscal_year);
	
-- Get the mission with the highest total cost
SELECT SUM(cost_MUSD * inflation_adjustment) AS adjusted_total_cost_MUSD
	FROM mission_budgets
    LEFT JOIN inflation
    	USING(fiscal_year)
    GROUP BY mission
    LIMIT 1;
    
-- Calculate the inflation adjusted total cost per year
SELECT fiscal_year, SUM(cost_MUSD * inflation_adjustment) AS adjusted_total_cost_MUSD
	FROM mission_budgets
    LEFT JOIN inflation
    	USING(fiscal_year)
    GROUP BY fiscal_year
    ORDER BY fiscal_year;
    
    -- Calculate the inflation adjusted total cost per destination
SELECT destination, SUM(cost_MUSD * inflation_adjustment) AS adjusted_total_cost_MUSD
	FROM mission_budgets
    LEFT JOIN inflation
    	USING(fiscal_year)
    LEFT JOIN mission_details
    	USING(mission)
    GROUP BY destination
    ORDER BY adjusted_total_cost_MUSD DESC;
    
    -- Calculate the inflation adjusted total cost per year per destination
SELECT fiscal_year, destination, SUM(cost_MUSD * inflation_adjustment) AS adjusted_total_cost_MUSD
	FROM mission_budgets
    LEFT JOIN inflation
    	USING(fiscal_year)
    LEFT JOIN mission_details
    	USING(mission)
    GROUP BY fiscal_year, destination
    ORDER BY fiscal_year, destination;
    
    