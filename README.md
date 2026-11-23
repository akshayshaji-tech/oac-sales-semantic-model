# Retail Sales Analytics – Oracle Analytics Cloud Semantic Model

An end-to-end Retail Sales Analytics project using **Oracle Autonomous Data Warehouse (ADW)**, **Oracle Analytics Cloud (OAC)**, SQL, and GitHub.

The project focuses on building a dimensional data warehouse, developing a reusable semantic model, and delivering business-oriented analytics.

> **Project status:** In Progress

## 1. Project Overview

The objective is to build a retail analytics solution that transforms sales data into business-ready information.

The project covers:

- Designing a dimensional data warehouse.
- Creating and loading dimension and fact tables using Oracle SQL.
- Establishing data relationships and validating data quality.
- Developing a semantic model in Oracle Analytics Cloud.
- Building analytical reports and dashboards.
- Managing SQL scripts and semantic model artifacts using GitHub.

## 2. Architecture

```text
       Retail Sales Data
               |
               v
   Oracle Autonomous Data Warehouse
               |
       +-------+-------+
       |               |
       v               v
  Dimension Tables  Fact Sales
       |               |
       +-------+-------+
               |
               v
      OAC Semantic Model
               |
               v
       OAC Dashboards
               |
               v
       Business Insights

      GitHub – Version Control
      SQL Scripts | Documentation
      Semantic Model | Validation
```

## 3. Technology Stack

| Technology | Purpose |
|---|---|
| Oracle Autonomous Data Warehouse | Data warehouse |
| Oracle SQL | Database development and transformations |
| Oracle Analytics Cloud | Semantic modelling and analytics |
| GitHub | Version control |
| Python | Semantic model validation utilities |
| GitHub Actions | Automated project checks |

## 4. Data Warehouse Design

The project follows a dimensional modelling approach with one fact table and four dimension tables.

### Fact Table

**FACT_SALES**

Grain: One row per order line.

Measures include:

- Quantity
- Gross Sales
- Discount Amount
- Net Revenue
- Cost of Goods Sold (COGS)

### Dimension Tables

| Dimension | Description |
|---|---|
| DIM_DATE | Date, month, quarter and year attributes |
| DIM_PRODUCT | Product, subcategory and category details |
| DIM_CUSTOMER | Customer and customer segment |
| DIM_GEOGRAPHY | Region, country, state and city |

### Data Model

```text
             DIM_DATE
                |
                |
DIM_PRODUCT -- FACT_SALES -- DIM_CUSTOMER
                |
                |
           DIM_GEOGRAPHY
```

## 5. Repository Structure

```text
oac-sales-semantic-model/
│
├── README.md
├── .gitignore
│
├── .github/
│   ├── workflows/
│   │   └── validate.yml
│   └── pull_request_template.md
│
├── sql/
│   └── adw/
│       ├── 00_admin_create_users.sql
│       ├── 01_ddl_tables.sql
│       ├── 02_load_dim_date.sql
│       ├── 03_load_dim_product.sql
│       ├── 04_load_dim_customer.sql
│       ├── 05_load_dim_geography.sql
│       ├── 06_load_fact_sales.sql
│       ├── 07_constraints_stats_grants.sql
│       └── 99_validation.sql
│
├── docs/
│   ├── architecture.md
│   ├── data-dictionary.md
│   ├── modeling-decisions.md
│   ├── interview-notes.md
│   └── screenshots/
│
├── tests/
│   └── expected_results.md
│
├── scripts/
│   └── check_smml.py
│
└── semantic-model/
```

## 6. Semantic Modelling

The semantic model will be developed in Oracle Analytics Cloud.

Planned modelling activities:

- Physical layer configuration.
- Logical fact and dimension tables.
- Logical joins and relationship configuration.
- Measure aggregation rules.
- Hierarchies and levels.
- Business-friendly presentation layer.
- Calculated measures and KPIs.
- Semantic model validation.

## 7. Analytics and Business KPIs

The planned analytics include:

- Total Sales
- Net Revenue
- Total Quantity Sold
- Total COGS
- Gross Profit
- Profit Margin
- Sales by Product Category
- Sales by Region
- Customer Segment Analysis
- Monthly and Quarterly Sales Trends

## 8. Data Validation and Automation

The project will include SQL-based validation checks for:

- Fact and dimension record counts.
- Primary key uniqueness.
- Missing dimension references.
- Null and invalid values.
- Revenue and sales calculations.
- Expected aggregation results.

GitHub Actions and Python utilities will be used for appropriate automated checks as the project evolves.

## 9. Reproducing the Project

The intended implementation sequence is:

1. Provision Oracle Autonomous Data Warehouse.
2. Configure database users and permissions.
3. Execute the SQL table creation scripts.
4. Load dimension and fact data.
5. Configure constraints and gather database statistics.
6. Run data validation queries.
7. Connect Oracle Analytics Cloud to ADW.
8. Develop the OAC semantic model.
9. Build dashboards and analytical reports.
10. Maintain project artifacts and documentation in GitHub.

## 10. Learning Objectives

This project is designed to develop practical experience in:

- Dimensional data modelling.
- Oracle SQL and database development.
- Oracle Autonomous Data Warehouse.
- Oracle Analytics Cloud semantic modelling.
- BI architecture and reporting.
- Data quality and validation.
- Git and GitHub version control.
- Basic CI/CD practices for analytics projects.

---

**Author:** Akshay Shaji

**Project:** Retail Sales Analytics – OAC Semantic Model

**Status:** In Progress
