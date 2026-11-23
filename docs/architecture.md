# Retail Sales Analytics – Solution Architecture

## 1. Overview

This project implements a Retail Sales Analytics solution using Oracle Autonomous Data Warehouse (ADW) and Oracle Analytics Cloud (OAC).

The architecture follows a dimensional data warehouse approach. ADW stores and organizes sales data, while OAC provides the semantic layer and business analytics.

GitHub is used for source control, documentation, and version management.

## 2. Architecture Components

### 2.1 Oracle Autonomous Data Warehouse

ADW acts as the central data warehouse.

Schema: `SALES_DW`

Database objects:

**Fact Table**
- FACT_SALES

**Dimension Tables**
- DIM_DATE
- DIM_PRODUCT
- DIM_CUSTOMER
- DIM_GEOGRAPHY

The fact table stores sales transactions at the grain of one row per order line.

### 2.2 Dimensional Data Model

The project uses a star-schema-oriented dimensional model.

FACT_SALES connects to four dimensions:

- DIM_DATE through DATE_KEY
- DIM_PRODUCT through PRODUCT_KEY
- DIM_CUSTOMER through CUSTOMER_KEY
- DIM_GEOGRAPHY through GEOGRAPHY_KEY

### 2.3 Oracle Analytics Cloud

OAC is responsible for semantic modelling and analytics.

The semantic model will contain three layers:

**Physical Layer**
- Connect to Oracle ADW.
- Import the five database tables.
- Configure physical relationships.

**Business Model and Mapping Layer**
- Create logical fact and dimension tables.
- Define logical relationships.
- Configure measure aggregation.
- Create hierarchies and calculated measures.

**Presentation Layer**
- Create the Retail Sales Analytics subject area.
- Organize business-friendly folders and columns.
- Expose reusable measures and dimensions to report developers.

### 2.4 GitHub

GitHub manages the project source code and documentation.

It contains:
- ADW SQL scripts.
- Architecture and modelling documentation.
- Validation scripts and expected results.
- OAC semantic model artifacts supported by Git integration.

## 3. Data Flow

1. SQL scripts create the ADW database objects.
2. Dimension tables are populated.
3. Fact sales data is loaded.
4. Constraints and database statistics are configured.
5. SQL validation checks are executed.
6. OAC connects to ADW using a dedicated read-only database account.
7. OAC semantic modelling organizes the data into a business-friendly structure.
8. Dashboards and analytical reports provide business insights.

## 4. Security and Access

- `ADMIN` is used for administrative database operations.
- `SALES_DW` owns the warehouse tables.
- `OAC_RO` is the read-only account used by OAC.
- Database access is granted using appropriate object-level permissions.
- Wallets, passwords, private keys and access tokens are excluded from GitHub.

## 5. Technology Stack

| Component | Technology |
|---|---|
| Data Warehouse | Oracle ADW |
| Database Development | Oracle SQL |
| Analytics Platform | Oracle Analytics Cloud |
| Version Control | GitHub |
| Automation | GitHub Actions |
| Validation Utilities | Python |

## 6. Implementation Status

- ADW database setup: Completed
- Dimensional tables: Created
- Data loading: Implemented
- SQL validation: Implemented
- OAC connection: In progress
- Semantic model: Planned
- Dashboards: Planned
- Git integration: Planned

## 7. Future Enhancements

- Traditional RPD development using Oracle Analytics Client Tools.
- Advanced semantic modelling.
- Row-level security.
- Aggregate navigation and performance tuning.
- Automated data quality checks.
- CI/CD improvements for project artifacts.
