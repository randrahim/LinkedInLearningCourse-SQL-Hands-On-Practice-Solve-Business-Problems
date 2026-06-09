SELECT *,
       LEAD(movementdate, 1)
          OVER (
            PARTITION BY subscriptionid
            ORDER BY movementdate
          ) AS NextStatusMovementDate,
       
       LEAD(movementdate, 1)
          OVER (
            PARTITION BY subscriptionid
            ORDER BY movementdate
          ) - movementdate AS TimeinStatus
FROM paymentstatuslog
WHERE subscriptionid = '38844'
ORDER BY movementdate;