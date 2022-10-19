create temp table agg_emp as 
SELECT EmployeeID, COUNT(*) as employee_order FROM Orders o GROUP BY EmployeeID;

select * from agg_emp;

create temp table average_employee as 
SELECT
	o2.CustomerID,
	o2.EmployeeID,
	o2.OrderDate,
	o2.RequiredDate,
	o2.ShippedDate,
	o2.ShipVia,
	o2.Freight,
	o2.ShipName,
	o2.ShipAddress,
	o2.ShipCity,
	o2.ShipRegion,
	o2.ShipPostalCode,
	o2.ShipCountry,
	ae.employee_order,
CASE WHEN ae.employee_order > 50
	THEN 'Promotion Deserved'
	ELSE 'No Promotion'
END as Promotion_Statue
FROM Orders o2
JOIN agg_emp ae ON ae.EmployeeID = o2.EmployeeID;

select * from average_employee;

