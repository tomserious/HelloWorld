USE [Tom_OA]
GO
/****** Object:  Table [dbo].[AllApplies]    Script Date: 2015/4/17 20:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllApplies](
	[ApplyID] [int] IDENTITY(1,1) NOT NULL,
	[RecordID] [int] NOT NULL,
	[ApplyStaff] [nchar](10) NOT NULL,
	[ApplyDate] [date] NOT NULL,
	[ApplyType] [nvarchar](50) NOT NULL,
	[NextApprover] [nchar](10) NOT NULL,
	[Result] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AllCashFlow]    Script Date: 2015/4/17 20:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllCashFlow](
	[CashFlowID] [int] IDENTITY(1,1) NOT NULL,
	[RecordID] [int] NOT NULL,
	[HappenDate] [date] NOT NULL,
	[ProjectCode] [nvarchar](20) NOT NULL,
	[ProjectAccount] [nvarchar](50) NOT NULL,
	[CashType] [nvarchar](20) NOT NULL,
	[Income] [float] NOT NULL,
	[Expense] [float] NOT NULL,
	[Department] [nvarchar](20) NOT NULL,
	[Summary] [nvarchar](50) NULL,
	[Remark] [nvarchar](50) NULL,
	[Handler] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BasicInfo]    Script Date: 2015/4/17 20:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BasicInfo](
	[UserID] [int] NOT NULL,
	[StaffName] [nvarchar](50) NOT NULL,
	[Gender] [bit] NULL,
	[Birthday] [date] NULL,
	[Race] [nvarchar](50) NULL,
	[Department] [nvarchar](50) NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Contact] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[UrgentContact] [nvarchar](50) NULL,
	[UrgentPerson] [nvarchar](50) NULL,
	[CardID] [nvarchar](18) NULL,
	[Politics] [nvarchar](50) NULL,
	[Marriage] [nvarchar](50) NULL,
	[School] [nvarchar](50) NULL,
	[Education] [nvarchar](50) NULL,
	[Major] [nvarchar](50) NULL,
	[OldName] [nvarchar](50) NULL,
	[Computer] [nvarchar](50) NULL,
	[ForeignLan] [nvarchar](50) NULL,
	[ForeignLev] [nvarchar](50) NULL,
	[EnterDate] [date] NULL,
	[FileAddr] [nvarchar](50) NULL,
	[OnJob] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BusinessTripApplies]    Script Date: 2015/4/17 20:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessTripApplies](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[StaffName] [nvarchar](20) NULL,
	[Department] [nvarchar](20) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[ApplyDate] [date] NOT NULL,
	[ProjectName] [nvarchar](50) NOT NULL,
	[ProjectAccount] [nvarchar](50) NOT NULL,
	[Reason] [nvarchar](200) NOT NULL,
	[Traffic] [nvarchar](200) NOT NULL,
	[Cars] [nvarchar](200) NOT NULL,
	[Hotel] [nvarchar](200) NOT NULL,
	[Meal] [nvarchar](200) NOT NULL,
	[Others] [nvarchar](200) NOT NULL,
	[MoneyEstimate] [float] NOT NULL,
	[ApproveProcess] [nvarchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BusinessTripRei]    Script Date: 2015/4/17 20:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessTripRei](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[StaffName] [nvarchar](20) NOT NULL,
	[Department] [nvarchar](20) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[ApplyDate] [date] NOT NULL,
	[ProjectName] [nvarchar](50) NOT NULL,
	[ProjectAccount] [nvarchar](50) NOT NULL,
	[Reason] [nvarchar](100) NOT NULL,
	[Traffic] [nvarchar](200) NOT NULL,
	[Cars] [nvarchar](200) NOT NULL,
	[Hotel] [nvarchar](200) NOT NULL,
	[Meal] [nvarchar](200) NOT NULL,
	[Others] [nvarchar](200) NOT NULL,
	[MoneyEstimate] [float] NOT NULL,
	[MoneyRei] [float] NOT NULL,
	[ApproveProcess] [nvarchar](100) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BusinessTripSummary]    Script Date: 2015/4/17 20:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessTripSummary](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[StaffName] [nvarchar](20) NOT NULL,
	[Department] [nvarchar](20) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[ProjectName] [nvarchar](50) NOT NULL,
	[Location] [nvarchar](50) NOT NULL,
	[Expense] [nvarchar](200) NOT NULL,
	[Travel] [nvarchar](200) NOT NULL,
	[Reason] [nvarchar](200) NOT NULL,
	[Finished] [nvarchar](200) NOT NULL,
	[Unfinished] [nvarchar](200) NOT NULL,
	[ApproveProcess] [nvarchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BusinessUnit]    Script Date: 2015/4/17 20:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessUnit](
	[UnitID] [int] IDENTITY(1,1) NOT NULL,
	[UnitName] [nvarchar](50) NOT NULL,
	[Responsible] [nvarchar](50) NOT NULL,
	[UnitCode] [nchar](10) NULL,
 CONSTRAINT [PK_BusinessUnit] PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CarUseApplies]    Script Date: 2015/4/17 20:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarUseApplies](
	[ApplyID] [int] IDENTITY(1,1) NOT NULL,
	[StaffName] [nvarchar](20) NOT NULL,
	[Department] [nvarchar](20) NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[AlongCount] [int] NOT NULL,
	[AlongName] [nvarchar](50) NOT NULL,
	[Reason] [nvarchar](200) NOT NULL,
	[Destination] [nvarchar](50) NOT NULL,
	[Driver] [nvarchar](20) NOT NULL,
	[CarNum] [nvarchar](10) NOT NULL,
	[Note] [nvarchar](100) NOT NULL,
	[ApproveProcess] [nvarchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CarUseRecord]    Script Date: 2015/4/17 20:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CarUseRecord](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[ApplyID] [int] NOT NULL,
	[Durings] [varchar](50) NOT NULL,
	[Destination] [varchar](50) NOT NULL,
	[MilesBefore] [float] NOT NULL,
	[MilesAfter] [float] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContractApplies]    Script Date: 2015/4/17 20:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractApplies](
	[ApplyID] [int] IDENTITY(1,1) NOT NULL,
	[StaffName] [nvarchar](10) NOT NULL,
	[Department] [nvarchar](20) NOT NULL,
	[ContractName] [nvarchar](50) NOT NULL,
	[ProjectName] [nvarchar](50) NOT NULL,
	[ProjectCode] [nvarchar](50) NOT NULL,
	[Money] [float] NOT NULL,
	[PartyBName] [nvarchar](50) NOT NULL,
	[PartyBAddress] [nvarchar](100) NOT NULL,
	[PartyBContact] [nvarchar](20) NOT NULL,
	[PartyBTelephone] [nvarchar](20) NOT NULL,
	[BusinessLicense] [bit] NOT NULL,
	[IndustoryLicense] [bit] NOT NULL,
	[Others] [nvarchar](50) NULL,
	[ApproveProcess] [nvarchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departments]    Script Date: 2015/4/17 20:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
	[Responsible] [nvarchar](50) NOT NULL,
	[Parent] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MealApplies]    Script Date: 2015/4/17 20:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MealApplies](
	[ApplyID] [int] IDENTITY(1,1) NOT NULL,
	[StaffName] [nvarchar](20) NOT NULL,
	[Department] [nvarchar](20) NOT NULL,
	[Position] [nvarchar](20) NOT NULL,
	[MealDate] [date] NOT NULL,
	[Persons] [int] NOT NULL,
	[Money] [float] NOT NULL,
	[Standard] [nvarchar](20) NOT NULL,
	[Reason] [nvarchar](50) NOT NULL,
	[Style] [bit] NOT NULL,
	[Legal] [bit] NOT NULL,
	[ApproveProcess] [nvarchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MoneyApplies]    Script Date: 2015/4/17 20:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoneyApplies](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[StaffName] [nvarchar](10) NOT NULL,
	[Department] [nvarchar](50) NOT NULL,
	[Telephone] [nvarchar](20) NOT NULL,
	[Money] [float] NOT NULL,
	[ProjectCode] [nvarchar](50) NOT NULL,
	[Style] [nvarchar](10) NOT NULL,
	[Usage] [nvarchar](50) NOT NULL,
	[PayPlan] [nvarchar](100) NOT NULL,
	[Payee] [nvarchar](20) NULL,
	[PayDate] [date] NOT NULL,
	[ApproveProcess] [nvarchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OfficeSupplies]    Script Date: 2015/4/17 20:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfficeSupplies](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[ApplyID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Version] [nvarchar](20) NOT NULL,
	[Price] [float] NOT NULL,
	[Counter] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OfficeSupplyApplies]    Script Date: 2015/4/17 20:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfficeSupplyApplies](
	[ApplyID] [int] IDENTITY(1,1) NOT NULL,
	[StaffName] [nvarchar](20) NOT NULL,
	[Department] [nvarchar](20) NOT NULL,
	[Money] [float] NOT NULL,
	[Reason] [nvarchar](100) NOT NULL,
	[ApplyDate] [date] NOT NULL,
	[ApproveProcess] [nvarchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PayAssigned]    Script Date: 2015/4/17 20:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayAssigned](
	[ApplyID] [int] IDENTITY(1,1) NOT NULL,
	[StaffName] [nvarchar](20) NOT NULL,
	[School] [nvarchar](50) NOT NULL,
	[ProjectName] [nvarchar](50) NOT NULL,
	[Payee] [nvarchar](50) NOT NULL,
	[Payed] [float] NOT NULL,
	[Income] [float] NOT NULL,
	[Assigned] [float] NOT NULL,
	[Instrument] [nvarchar](20) NOT NULL,
	[Hardware] [nvarchar](50) NOT NULL,
	[FundingID] [nvarchar](20) NOT NULL,
	[ToUniversity] [float] NULL,
	[ToUniversityDetail] [nvarchar](50) NULL,
	[ToSchool] [float] NULL,
	[ToSchoolDetail] [nvarchar](50) NULL,
	[Fundings] [float] NULL,
	[FundingsDetail] [nvarchar](50) NULL,
	[Welfare] [float] NULL,
	[WelfareDetail] [nvarchar](50) NULL,
	[Management] [float] NULL,
	[Labor] [float] NULL,
	[Consult] [float] NULL,
	[BusinessTax] [float] NULL,
	[AddedValueTax] [float] NULL,
	[Note] [nvarchar](100) NULL,
	[ApproveProcess] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Projects]    Script Date: 2015/4/17 20:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectCode] [nvarchar](50) NOT NULL,
	[ProjectName] [nvarchar](50) NOT NULL,
	[ProjectAccount] [nvarchar](50) NOT NULL,
	[Manager] [nvarchar](50) NOT NULL,
	[Members] [nvarchar](200) NOT NULL,
	[Budget] [int] NOT NULL,
	[Collected] [int] NOT NULL,
	[ApplyDate] [date] NOT NULL,
	[Remark] [nvarchar](200) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[ProjectCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reimbursements]    Script Date: 2015/4/17 20:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reimbursements](
	[ReimbursementID] [int] IDENTITY(1,1) NOT NULL,
	[StaffName] [nchar](10) NULL,
	[Department] [nvarchar](50) NULL,
	[Manager] [nchar](10) NULL,
	[ProjectCode] [nvarchar](50) NULL,
	[ProjectAccount] [nvarchar](50) NULL,
	[HappenDate] [date] NULL,
	[ReimburseDate] [date] NULL,
	[Payee] [nchar](10) NULL,
	[Bill] [int] NULL,
	[Expense] [float] NULL,
	[AllExpense] [float] NULL,
	[PayeeDate] [date] NULL,
	[Remark] [nvarchar](50) NULL,
	[Note] [nvarchar](50) NULL,
	[ApproveProcess] [nvarchar](150) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RepairApplies]    Script Date: 2015/4/17 20:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepairApplies](
	[ApplyID] [int] IDENTITY(1,1) NOT NULL,
	[EquipmentName] [nvarchar](20) NOT NULL,
	[EquipmentType] [nvarchar](20) NOT NULL,
	[StaffName] [nvarchar](20) NOT NULL,
	[Department] [nvarchar](20) NOT NULL,
	[BuyDate] [date] NOT NULL,
	[BugDate] [date] NOT NULL,
	[BugDetail] [nvarchar](50) NOT NULL,
	[FixDate] [date] NOT NULL,
	[SentToRepair] [date] NOT NULL,
	[DuringGuarantee] [bit] NOT NULL,
	[RepairSelf] [bit] NOT NULL,
	[Budget] [float] NOT NULL,
	[SettleType] [nvarchar](10) NOT NULL,
	[ApproveProcess] [nvarchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2015/4/17 20:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[CostLimit] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SettleApplies]    Script Date: 2015/4/17 20:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SettleApplies](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[StaffName] [nvarchar](20) NOT NULL,
	[Department] [nvarchar](50) NOT NULL,
	[Position] [nvarchar](20) NOT NULL,
	[Money] [float] NOT NULL,
	[Reason] [nvarchar](100) NOT NULL,
	[SettleDate] [date] NOT NULL,
	[Legal] [bit] NOT NULL,
	[InnerBudget] [bit] NOT NULL,
	[CheckBill] [nvarchar](50) NOT NULL,
	[ApproveProcess] [nvarchar](100) NULL,
	[ProjectAccount] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 2015/4/17 20:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[PasswordHash] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
