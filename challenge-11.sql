SELECT salesemployeeid,
       saledate,
       saleamount,
       sum(saleamount)
          over(partition by salesemployeeid
            order by saledate) as running_total,
       cast(sum(saleamount)
          over(partition by salesemployeeid
            order by saledate) as float)
          /
          quota as percent_quota,
FROM sales s 
JOIN employees e 
ON s.salesemployeeid = employeeid 
ORDER BY salesemployeeid, saledate