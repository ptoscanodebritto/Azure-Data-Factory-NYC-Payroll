# Azure-Data-Factory-NYC-Payroll

The City of New York would like to develop a Data Analytics platform on Azure Synapse Analytics to accomplish two primary objectives:

1. Analyze how the City's financial resources are allocated and how much of the City's budget is being devoted to overtime.

2. Make the data available to the interested public to show how the City’s budget is being spent on salary and overtime pay for all municipal employees.

In this project as a Data Engineer, I created a data pipeline that is dynamic, can be automated, and monitored for efficient operation.

The source data resides in Azure Data Lake and needs to be processed in a NYC data warehouse. The source datasets consist of CSV files with Employee master data and monthly payroll data entered by various City agencies

This project consists of the following steps:

1. Creating Resources (Azure Data Lake Gen 2, Azure SQL Database, Azure Synapse Analytics, Azure Data Factory)

2. Creating tables on Azure SQL Database and Synapse (external table)

3. Creating Linked Services (Azure Data Lake Gen 2, Azure SQL Database, Azure Synapse Analytics) on Azure Data Factory

4. Creating Datasets on Azure Data Factory

5. Create Summary Data Flow on Azure Data Factory

6. Create Pipeline on Azure Data Factory

7. Run Pipeline and check the Tables on Azure SQL Database, Synapse and the summary file on your container on Azure Data Lake Gen2


## Data Schema
![nyc-payroll-db-schema](https://github.com/ptoscanodebritto/Azure-Data-Factory-NYC-Payroll/assets/169722367/df97a030-069b-4582-857e-401b74f97209) 

## Pipeline Framework

![New Data Flow](https://github.com/ptoscanodebritto/Azure-Data-Factory-NYC-Payroll/assets/169722367/1508ab3e-bbec-47a9-9c91-f96e9912a6de)
