SELECT *,
       lead(movementdate, 1)
          over(partition by subscriptionid
            order by movementdate)
              as NextStatusMovementDate,
       
       lead(movementdate, 1)
          over(partition by subscriptionid
            order by movementdate)
              - movementdate 
              as TimeinStatus
FROM paymentstatuslog
WHERE subscriptionid = '38844'
ORDER BY movementdat;