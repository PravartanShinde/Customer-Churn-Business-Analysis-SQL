# 🛒 Customer Churn Analysis using SQL

*A hypothesis-driven SQL project investigating customer churn by analyzing customer behavior, purchasing patterns, and customer lifetime value to support data-driven business decisions.*

---

# 📌 Project Overview

Customer churn is one of the biggest challenges faced by subscription-based and e-commerce businesses. Losing existing customers directly impacts revenue, customer lifetime value, and long-term business growth.

This project investigates customer churn by comparing the behavior of churned and retained customers using SQL. Instead of randomly exploring the data, the analysis follows a **hypothesis-driven approach**, where each business question tests a specific assumption about customer churn.

The project combines SQL with business analysis to identify customer behavior patterns associated with churn and translate those findings into actionable business implications.

---

# 🎯 Business Objective

The objective of this project is to investigate customer churn by comparing the behavior of churned and retained customers, identifying patterns associated with churn, and highlighting areas that may help the business make more informed customer retention decisions.

---

# 📂 Dataset

**Source:** *Replace this with the actual dataset source (Kaggle/GitHub/etc.)*

The project analyzes customer activity using five related tables.

| Table        | Description                                               |
| ------------ | --------------------------------------------------------- |
| Customers    | Customer information, customer segments, and churn status |
| Transactions | Purchase history and transaction outcomes                 |
| Sessions     | Customer browsing behavior and cart activity              |
| Products     | Product catalog                                           |
| Reviews      | Customer product reviews                                  |

### Dataset Summary

| Metric              |   Value |
| ------------------- | ------: |
| Customers           |  10,000 |
| Products            |   1,000 |
| Transactions        | 120,000 |
| Browsing Sessions   |  80,000 |
| Reviews             |  25,000 |
| Customer Churn Rate |  16.94% |

---

# 🔍 Methodology

Unlike a traditional SQL practice project, this analysis follows a **hypothesis-driven business analysis** approach.

Instead of writing queries solely to demonstrate SQL syntax, each query was designed to investigate a specific business hypothesis related to customer churn.

The workflow consisted of:

1. Inspecting and understanding the dataset.
2. Performing Exploratory Data Analysis (EDA).
3. Formulating business hypotheses.
4. Testing each hypothesis using SQL.
5. Interpreting the findings.
6. Translating insights into business implications.

This approach ensures that every SQL query contributes to answering the central business problem rather than serving as an isolated technical exercise.

---

# 📊 Exploratory Data Analysis

Before investigating customer churn, exploratory analysis was performed to understand the structure and composition of the dataset.

The EDA included:

* Total number of customers
* Total number of products
* Total transactions
* Total browsing sessions
* Customer churn distribution
* Customer segment distribution
* Country-wise customer distribution
* Transaction status distribution

This provided the necessary business context before beginning the churn analysis.

---

# 💼 Business Scenario

Imagine you have recently joined an e-commerce company as a Data Analyst.

Management has observed an increase in customer churn but does not understand the underlying reasons.

Your responsibility is to analyze customer behavior using SQL, identify patterns associated with churn, and provide data-driven insights that can support better customer retention decisions.

---

# ❓ Business Questions

The following hypotheses were investigated during the analysis:

1. Do churned customers spend less time browsing than retained customers?
2. Do churned customers add fewer items to their shopping carts?
3. Do churned customers make fewer completed purchases?
4. Do churned customers spend less money than retained customers?
5. Do churned customers experience a higher proportion of failed or refunded transactions?
6. Does customer churn vary across different customer segments?
7. Does customer churn vary across different countries?
8. Do churned customers have lower Customer Lifetime Value (CLV)?
9. Who are the Top 5 highest Customer Lifetime Value (CLV) customers within each customer segment?

---

# 📈 Key Findings

The analysis revealed a consistent behavioral pattern among churned customers.

Compared to retained customers, churned customers:

* Spent less time browsing the platform.
* Added fewer products to their shopping carts.
* Completed fewer purchases.
* Spent significantly less money.
* Had lower Customer Lifetime Value (CLV).

These findings indicate that churned customers consistently exhibited lower engagement and lower revenue contribution than retained customers.

The analysis also found that:

* Customer churn varies across customer segments.
* Customer churn varies across countries.
* Failed and refunded transaction rates were nearly identical between churned and retained customers, suggesting that payment failures were **not strongly associated** with churn in this dataset.

Finally, the analysis identified the highest Customer Lifetime Value customers within each customer segment, providing a basis for prioritizing customer retention efforts.

---

# 💡 Business Implications

Based on the findings of this analysis:

* Customer engagement appears to be closely associated with churn and should be monitored as an important business metric.
* Purchase frequency and customer spending are substantially lower among churned customers, indicating that these metrics may help identify customers at risk of churning.
* Customer churn varies across customer segments and countries, suggesting that retention performance should be monitored separately across different customer groups and geographic markets.
* Payment failures showed no meaningful difference between churned and retained customers in this dataset and therefore do not appear to be a primary factor associated with churn.
* The highest-value customers within each customer segment were identified, providing a basis for prioritizing retention efforts.

---

# 🛠 SQL Concepts Used

* Common Table Expressions (CTEs)
* Window Functions
* ROW_NUMBER()
* Aggregate Functions
* CASE WHEN
* INNER JOIN
* LEFT JOIN
* GROUP BY
* ORDER BY
* Conditional Aggregation
* Business-Oriented SQL Analysis

---

# 📁 Repository Structure

```text
customer-churn-analysis-sql/
│
├── customer_churn_analysis.sql
├── Customer_Churn_Report.pdf
├── README.md
└── screenshots/
```

---

# 🎯 Conclusion

This project provides a data-driven view of customer churn by examining behavioral differences between churned and retained customers.

Rather than relying on assumptions, the investigation identified which customer behaviors were consistently associated with churn, highlighted areas where no meaningful relationship was observed, and identified the customers who contribute the greatest long-term value.

By combining SQL with a hypothesis-driven analytical approach, this project demonstrates how structured business questions can be translated into meaningful insights that support informed decision-making.

---

# 👨‍💻 Author

**Pravartan Shinde**

If you found this project interesting or have suggestions for improvement, feel free to connect or reach out.
