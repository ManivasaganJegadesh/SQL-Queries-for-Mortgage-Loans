# Overview
This project involves analyzing a mortgage loan dataset with various attributes about loan applications, approvals, and borrower demographics using SQL. It covers an end-to-end process of normalizing a denormalized dataset, performing SQL queries of varying complexity (easy, medium). The primary goals of the project are to practice basic to intermediate SQL skills and generate valuable insights related to loan statuses, approval rates, and borrower information.

```sql
CREATE TABLE mortgage_loans (
    loan_id SERIAL PRIMARY KEY,
    borrower_name VARCHAR(100),
    loan_amount DECIMAL(10,2),
    interest_rate DECIMAL(5,2),
    loan_status VARCHAR(50),  -- (Approved, Rejected, Pending)
    loan_purpose VARCHAR(100),
    credit_score INT,
    income DECIMAL(10,2),
    property_value DECIMAL(10,2),
    state VARCHAR(50),
    application_date DATE
);
```
## Project Steps

### 1.Data Exploration
Before diving into SQL, it’s important to understand the dataset thoroughly. The dataset contains attributes such as:
- `Loan ID`: The unique identifier for each loan.
- `State`: The state where the loan was issued.
- `Loan Amount`: The total amount of the loan.
- `Loan Status`: The current status of the loan (e.g., Approved, Denied, Pending).
- `Credit Score`: The credit score range of the borrower.
- `Loan Type`: The type of loan (e.g., Fixed, Adjustable).
- `Interest Rate`: The interest rate associated with the loan.
- `Approval Date`: The date when the loan was approved or denied.

### 2. Querying the Data
After the data is inserted, various SQL queries can be written to explore and analyze the data. Queries are categorized into **easy**, **medium** levels to help progressively develop SQL proficiency.

#### Easy Queries
- Simple data retrieval, filtering, and basic aggregations.
  
#### Medium Queries
- More complex queries involving grouping, aggregation functions

## 15 Practice Questions

### Easy Level
1. Total Number of Loans in the Database
2. Loan Count by State
3. Total Loan Amount by Loan Status (Approved vs. Rejected)
4. Loans by Purpose (Home Purchase, Refinance, etc.)
5. Average Interest Rate by Loan Purpose
6. Loans in the Last Year

### Medium Level
1. Loan Approval Rate
2. Average Interest Rate Based on Credit Score Ranges
3. What is the approval rate of loans by state?
4. Which states have the highest loan approval rates?
5. Monthly Loan Applications Trend
6. Maximum Loan Amount by Credit Score Range
7. Loans Approved per Month
8. Loans with Credit Score Above 700 and Approved Status

