CREATE DATABASE udacity


USE udacity;

IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	       FORMAT_OPTIONS (
			 FIELD_TERMINATOR = ',',
			 USE_TYPE_DEFAULT = FALSE
			))
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'toscanocontainer_adlsnycpayrolltoscano_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [toscanocontainer_adlsnycpayrolltoscano_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://toscanocontainer@adlsnycpayrolltoscano.dfs.core.windows.net' 
	)
GO



CREATE EXTERNAL TABLE [dbo].[NYC_Payroll_EMP_MD](
[EmployeeID] [varchar](10) NULL,
[LastName] [varchar](20) NULL,
[FirstName] [varchar](20) NULL
)
WITH (
LOCATION = '/dirstaging/',
DATA_SOURCE = [toscanocontainer_adlsnycpayrolltoscano_dfs_core_windows_net],
FILE_FORMAT = [SynapseDelimitedTextFormat]
)
GO



CREATE EXTERNAL TABLE [dbo].[NYC_Payroll_TITLE_MD](
[TitleCode] [varchar](10) NULL,
[TitleDescription] [varchar](100) NULL
)
WITH (
LOCATION = '/dirpayrollfiles/TitleMaster.csv',
DATA_SOURCE = [toscanocontainer_adlsnycpayrolltoscano_dfs_core_windows_net],
FILE_FORMAT = [SynapseDelimitedTextFormat]
)
GO



CREATE EXTERNAL TABLE [dbo].[NYC_Payroll_AGENCY_MD](
    [AgencyID] [varchar](10) NULL,
    [AgencyName] [varchar](50) NULL
) 
WITH (
LOCATION = '/dirpayrollfiles/AgencyMaster.csv',
DATA_SOURCE = [toscanocontainer_adlsnycpayrolltoscano_dfs_core_windows_net],
FILE_FORMAT = [SynapseDelimitedTextFormat]
)
GO



CREATE EXTERNAL TABLE [dbo].[NYC_Payroll_Data_2020](
    [FiscalYear] [int] NULL,
    [PayrollNumber] [int] NULL,
    [AgencyID] [varchar](10) NULL,
    [AgencyName] [varchar](50) NULL,
    [EmployeeID] [varchar](10) NULL,
    [LastName] [varchar](20) NULL,
    [FirstName] [varchar](20) NULL,
    [AgencyStartDate] [date] NULL,
    [WorkLocationBorough] [varchar](50) NULL,
    [TitleCode] [varchar](10) NULL,
    [TitleDescription] [varchar](100) NULL,
    [LeaveStatusasofJune30] [varchar](50) NULL,
    [BaseSalary] [float] NULL,
    [PayBasis] [varchar](50) NULL,
    [RegularHours] [float] NULL,
    [RegularGrossPaid] [float] NULL,
    [OTHours] [float] NULL,
    [TotalOTPaid] [float] NULL,
    [TotalOtherPay] [float] NULL
) 
WITH (
LOCATION = '/dirhistoryfiles/nycpayroll_2020.csv',
DATA_SOURCE = [toscanocontainer_adlsnycpayrolltoscano_dfs_core_windows_net],
FILE_FORMAT = [SynapseDelimitedTextFormat]
)
GO



CREATE EXTERNAL TABLE [dbo].[NYC_Payroll_Data_2021](
    [FiscalYear] [int] NULL,
    [PayrollNumber] [int] NULL,
    [AgencyCode] [varchar](10) NULL,
    [AgencyName] [varchar](50) NULL,
    [EmployeeID] [varchar](10) NULL,
    [LastName] [varchar](20) NULL,
    [FirstName] [varchar](20) NULL,
    [AgencyStartDate] [date] NULL,
    [WorkLocationBorough] [varchar](50) NULL,
    [TitleCode] [varchar](10) NULL,
    [TitleDescription] [varchar](100) NULL,
    [LeaveStatusasofJune30] [varchar](50) NULL,
    [BaseSalary] [float] NULL,
    [PayBasis] [varchar](50) NULL,
    [RegularHours] [float] NULL,
    [RegularGrossPaid] [float] NULL,
    [OTHours] [float] NULL,
    [TotalOTPaid] [float] NULL,
    [TotalOtherPay] [float] NULL
) 
WITH (
LOCATION = '/dirpayrollfiles/nycpayroll_2021.csv',
DATA_SOURCE = [toscanocontainer_adlsnycpayrolltoscano_dfs_core_windows_net],
FILE_FORMAT = [SynapseDelimitedTextFormat]
)
GO



CREATE EXTERNAL TABLE [dbo].[NYC_Payroll_Summary](
[FiscalYear] [int] NULL,
[AgencyName] [varchar](50) NULL,
[TotalPaid] [float] NULL
)
WITH (
LOCATION = '/',
DATA_SOURCE = [toscanocontainer_adlsnycpayrolltoscano_dfs_core_windows_net],
FILE_FORMAT = [SynapseDelimitedTextFormat]
)
GO