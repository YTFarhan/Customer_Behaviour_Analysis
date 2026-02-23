select * from customer limit 20


-- What is the total revenue generated for male vs. female customers

select "Gender", SUM("Purchase Amount (USD)") as Revenue
from customer
group by "Gender";



-- Which customers used a discount but still spent more than the avg amount

select "Customer ID", "Purchase Amount (USD)"
from customer
where "Discount Applied" = 'Yes' and "Purchase Amount (USD)" >= (select avg("Purchase Amount (USD)") from customer);



-- What are the Top 5 products with the highest average review rating

select "Item Purchased", round(avg("Review Rating"::numeric), 2) as "Average Product Rating"
from customer
group by "Item Purchased"
order by avg("Review Rating") desc
limit 5;



-- Compare average purchase amounts between standard and express shipping

select "Shipping Type", 
round(avg("Purchase Amount (USD)"), 2)
from customer
where "Shipping Type" in ('Standard', 'Express')
group by "Shipping Type";



-- Do subscribed customers spend more?

select "Subscription Status",
count("Customer ID") as Total_Customer,
round(avg("Purchase Amount (USD)"), 2) as Avg_Spend,
round(sum("Purchase Amount (USD)"), 2) as Total_Revenue_Spend
from customer
group by "Subscription Status"
order by Total_Revenue_Spend, Avg_Spend desc;



-- Top 5 purchases that rely on discounts


select * from customer limit 20


select "Item Purchased",
round(100 * sum(case when "Discount Applied" = 'Yes' then 1 else 0 end)/count(*),2) as Discount_Rate
from customer
group by "Item Purchased"
order by Discount_Rate desc
limit 5;



-- Segmenting customers based on their total number of previous purchases

with "Customer Type" as (
select "Customer ID", "Previous Purchases",
case 
	when "Previous Purchases" = 1 then 'New'
	when "Previous Purchases" between 2 and 10 then 'Returning'
	else 'Loyal'
	end as Customer_Segment
from customer
)

select Customer_Segment, count(*) as "Number of Customers"
from "Customer Type"
group by Customer_Segment;



-- Top 3 most purchased products within each category 

with item_counts as (
select "Category",
"Item Purchased",
count("Customer ID") as Total_Orders,
row_number() over(partition by "Category" order by count("Customer ID") desc) as Item_Rank
from customer
group by "Category", "Item Purchased"
)


select Item_Rank, "Category", "Item Purchased", Total_Orders
from item_counts
where item_rank <= 3;



-- Are repeat customers likely to be subscribers

select * from customer limit 20


select "Subscription Status",
count("Customer ID") as Repeat_Buyers
from customer
where "Previous Purchases" > 5
group by "Subscription Status";



-- What is the revenue by age group

select * from customer limit 20


SELECT
  CASE
    WHEN "Age" < 18 THEN 'Under 18'
    WHEN "Age" BETWEEN 18 AND 24 THEN '18–24'
    WHEN "Age" BETWEEN 25 AND 34 THEN '25–34'
    WHEN "Age" BETWEEN 35 AND 44 THEN '35–44'
    WHEN "Age" BETWEEN 45 AND 54 THEN '45–54'
    WHEN "Age" BETWEEN 55 AND 64 THEN '55–64'
    ELSE '65+'
  END AS Age_Group,
  SUM("Purchase Amount (USD)") AS Revenue
FROM customer
GROUP BY Age_Group
ORDER BY Revenue DESC;











