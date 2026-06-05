SELECT CustomerID,
       count(productid) as num_products,
       sum(numberofusers) as total_users,
       case when count(productid) = 1
            OR sum(numberofusers) >= 5000
            then 1 else 0
            end as upsell_opprtunity
FROM subscriptions
GROUP BY CustomerID;