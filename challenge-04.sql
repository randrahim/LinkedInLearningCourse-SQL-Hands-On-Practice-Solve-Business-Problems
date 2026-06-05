with max_status_reached as (
  SELECT subscriptionid,
         max(statusid) as MaxStatus 
  FROM paymentstatuslog
  GROUP BY subscriptionid
),

paymentfunnelstages as (
SELECT subs.subscriptionid,
       case 
        when maxstatus = 1 then 'PaymentWidgetOpened'
        when maxstatus = 2 then 'PaymentEntered'
        when maxstatus = 3 and currentstatus = 0 then 'User Enter'
        when maxstatus = 3 and currentstatus != 0 then 'PaymentEntered'
        when maxstatus = 4 and currentstatus = 0 then 'PaymentEntered'
        when maxstatus = 4 and currentstatus != 0 then 'PaymentEntered'
        when maxstatus = 5 then 'Complete'
        when maxstatus is null then 'User did not start payment'
       end as paymentfunnelstage
FROM subscriptionid subs 
LEFT JOIN 
    max_status_reached m 
ON subs.subscriptionid = m.subscriptionid 
)

SELECT paymentfunnelstage, 
       count(subscriptionid) as subscriptions 
FROM paymentfunnelstages 
GROUP BY paymentfunnelstage;
