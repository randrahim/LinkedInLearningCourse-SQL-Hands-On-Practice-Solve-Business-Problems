# SQL Hands-On Practice: Solve Business Problems

## Overview
This repository contains my SQL practice work from the LinkedIn Learning course **SQL Hands-On Practice: Solve Business Problems**.

The course focuses on using SQL to answer realistic business questions, analyze customer data, and create useful summaries for decision-making.

## Course Focus
This project practices SQL in a business context, including how to:
- Understand a business request
- Ask clarifying questions before writing a query
- Summarize customer data for leadership
- Write SQL queries that return clear and useful results
- Use SQL to support business decisions

## Business Scenario
One scenario in the course involves a leadership team asking for a high-level summary of customer subscription data for a board meeting.

The goal is to calculate the **all-time average number of registered users purchased per customer**.

If a customer has more than one subscription, such as Basic and Expert, the registered users from both subscriptions are combined before calculating the customer average.

## Skills Practiced
- SELECT statements
- Aggregation
- GROUP BY
- SUM
- AVG
- Business data analysis
- Writing SQL for real-world questions
- Interpreting business requirements

## Files

| File Name | Description |
|---|---|
| `schema.sql` | Creates the database tables |
| `data.sql` | Inserts sample or practice data |
| `queries.sql` | Contains SQL solutions for the course challenges |

## Example Business Question
How many registered users does each customer purchase on average?

Example query structure:

```sql
SELECT 
    customer_id,
    SUM(registered_users) AS total_registered_users
FROM subscriptions
GROUP BY customer_id;

<img width="2596" height="2006" alt="CertificateOfCompletion_SQL HandsOn Practice Solve Business Problems" src="https://github.com/user-attachments/assets/3c25c117-16b9-41eb-bf3b-c5505ae176ff" />

