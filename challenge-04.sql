WITH max_status_reached AS (
  SELECT
    subscriptionid,
    MAX(statusid) AS maxstatus
  FROM paymentstatuslog
  GROUP BY subscriptionid
),

paymentfunnelstages AS (
  SELECT
    subs.subscriptionid,
    CASE 
      WHEN m.maxstatus = 1 THEN 'PaymentWidgetOpened'
      WHEN m.maxstatus = 2 THEN 'PaymentEntered'
      WHEN m.maxstatus = 3 AND subs.currentstatus = 0 THEN 'User Error with Payment Submission'
      WHEN m.maxstatus = 3 AND subs.currentstatus <> 0 THEN 'Payment Submitted'
      WHEN m.maxstatus = 4 AND subs.currentstatus = 0 THEN 'Payment Processing Error with Vendor'
      WHEN m.maxstatus = 4 AND subs.currentstatus <> 0 THEN 'Payment Success'
      WHEN m.maxstatus = 5 THEN 'Complete'
      WHEN m.maxstatus IS NULL THEN 'User did not start payment process'
    END AS paymentfunnelstage
  FROM subscriptions subs
  LEFT JOIN max_status_reached m
    ON subs.subscriptionid = m.subscriptionid
)

SELECT
  paymentfunnelstage,
  COUNT(subscriptionid) AS subscriptions
FROM paymentfunnelstages
GROUP BY paymentfunnelstage;