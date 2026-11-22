SELECT
    sales_agent,
    SUM(close_value) AS total_won_revenue,
    RANK() OVER (
        ORDER BY SUM(close_value) DESC
    ) AS revenue_rank
FROM sales_pipeline
WHERE deal_stage = 'Won'
GROUP BY sales_agent
ORDER BY revenue_rank;