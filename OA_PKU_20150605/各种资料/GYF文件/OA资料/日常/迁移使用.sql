/******迁移步骤说明
第一步 将reimlisttable表改变为reimlisttable_原来	
	使用reimlisttable_原来表创建reimlisttable表
	将reimlisttable_原来表中的数据导入到reimlisttable表
第二步 	将reimlisttable表中老的数据、无效的数据、已经处理完的数据库，迁移到reimlisttable_old表
	同时在reimlisttable表中将这些数据库删除，在reimlisttable_old表中将无效数据删除。
第三步	人工OA处理财务数据（停止新建报销、借支），将所有的业务处理完毕，没有过程表单。
	同时开发就数据管理借口
第四步	将所有2014年之前的数据迁移到reimlisttable_old表，同时在reimlisttable表中删除。
第五步	将人员信息、项目信息更新
第六步	修改reimlisttable表中剩余数据（2014年的）的格式（主要是数据库表列的变化和字段更新）
第七步	修改完毕
*****/

/******第一步 将reimlisttable表改变为reimlisttable_原来
	使用reimlisttable_原来表创建reimlisttable表
	将reimlisttable_原来表中的数据导入到reimlisttable表*****/
/******手动将reimlisttable表改变为reimlisttable_原来*****/
/******创建reimlisttable表*****/
USE [finance]
GO
/****** 对象:  Table [dbo].[reimlisttable]    脚本日期: 01/29/2014 12:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reimlisttable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[stage] [int] NULL,
	[itemid] [int] NULL,
	[type] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[claimant] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[dept] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[deptleader] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[relclaimant] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[principal] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[projectDept] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[principaldeptLeader] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[finance] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[projectId] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[givecount] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[summary] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[remark] [nvarchar](max) COLLATE Chinese_PRC_CI_AS NULL,
	[billCount] [int] NULL,
	[money] [numeric](18, 2) NULL,
	[occurDate] [datetime] NULL,
	[reimburseDate] [datetime] NULL,
	[principalNotes] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[deptNotes] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[financialNotes] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[gManagerNotes] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[principalApprovalTime] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[deptApprovalTime] [datetime] NULL,
	[financialApprovalTime] [datetime] NULL,
	[gManagerApprovalTime] [datetime] NULL,
	[principalDissentTime] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[deptDissentTime] [datetime] NULL,
	[financialDissentTime] [datetime] NULL,
	[gManagerDissentTime] [datetime] NULL,
	[ch] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[notechen] [nvarchar](max) COLLATE Chinese_PRC_CI_AS NULL,
	[pzh] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[signtime] [datetime] NULL,
	[flag] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[yue] [real] NULL,
	[nowverify] [nvarchar](max) COLLATE Chinese_PRC_CI_AS NULL
) ON [PRIMARY]

INSERT INTO [finance].[dbo].[reimlisttable]
           ([stage]
           ,[itemid]
           ,[type]
           ,[claimant]
           ,[dept]
           ,[deptleader]
           ,[relclaimant]
           ,[principal]
           ,[projectDept]
           ,[principaldeptLeader]
           ,[finance]
           ,[projectId]
           ,[givecount]
           ,[summary]
           ,[remark]
           ,[billCount]
           ,[money]
           ,[occurDate]
           ,[reimburseDate]
           ,[principalNotes]
           ,[deptNotes]
           ,[financialNotes]
           ,[gManagerNotes]
           ,[principalApprovalTime]
           ,[deptApprovalTime]
           ,[financialApprovalTime]
           ,[gManagerApprovalTime]
           ,[principalDissentTime]
           ,[deptDissentTime]
           ,[financialDissentTime]
           ,[gManagerDissentTime]
           ,[ch]
           ,[notechen]
           ,[pzh]
           ,[signtime]
           ,[flag]
           ,[yue]
           ,[nowverify])
	select [stage]
           ,[itemid]
           ,[type]
           ,[claimant]
           ,[dept]
           ,[deptleader]
           ,[relclaimant]
           ,[principal]
           ,[projectDept]
           ,[principaldeptLeader]
           ,[finance]
           ,[projectId]
           ,[givecount]
           ,[summary]
           ,[remark]
           ,[billCount]
           ,[money]
           ,[occurDate]
           ,[reimburseDate]
           ,[principalNotes]
           ,[deptNotes]
           ,[financialNotes]
           ,[gManagerNotes]
           ,[principalApprovalTime]
           ,[deptApprovalTime]
           ,[financialApprovalTime]
           ,[gManagerApprovalTime]
           ,[principalDissentTime]
           ,[deptDissentTime]
           ,[financialDissentTime]
           ,[gManagerDissentTime]
           ,[ch]
           ,[notechen]
           ,[pzh]
           ,[signtime]
           ,[flag]
           ,[yue]
           ,[nowverify]
from reimlisttable_原来

/******第二步 	将reimlisttable表中老的数据、无效的数据、已经处理完的数据库，迁移到reimlisttable_old表
	同时在reimlisttable表中将这些数据库删除，在reimlisttable_old表中将无效数据删除。*****/
USE [finance]
GO
/****** 对象:  Table [dbo].[reimlisttable_old]    脚本日期: 01/29/2014 12:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reimlisttable_old](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[stage] [int] NULL,
	[itemid] [int] NULL,
	[type] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[claimant] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[dept] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[deptleader] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[relclaimant] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[principal] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[projectDept] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[principaldeptLeader] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[finance] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[projectId] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[givecount] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[summary] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[remark] [nvarchar](max) COLLATE Chinese_PRC_CI_AS NULL,
	[billCount] [int] NULL,
	[money] [numeric](18, 2) NULL,
	[occurDate] [datetime] NULL,
	[reimburseDate] [datetime] NULL,
	[principalNotes] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[deptNotes] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[financialNotes] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[gManagerNotes] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[principalApprovalTime] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[deptApprovalTime] [datetime] NULL,
	[financialApprovalTime] [datetime] NULL,
	[gManagerApprovalTime] [datetime] NULL,
	[principalDissentTime] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[deptDissentTime] [datetime] NULL,
	[financialDissentTime] [datetime] NULL,
	[gManagerDissentTime] [datetime] NULL,
	[ch] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[notechen] [nvarchar](max) COLLATE Chinese_PRC_CI_AS NULL,
	[pzh] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[signtime] [datetime] NULL,
	[flag] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[yue] [real] NULL,
	[nowverify] [nvarchar](max) COLLATE Chinese_PRC_CI_AS NULL
) ON [PRIMARY]


/******删除0,10,14,15,66阶段的无用数据*****/
delete from reimlisttable where stage in (0,10,14,15,66)

/******将老的数据、已经处理完成的数据迁移到reimlisttable_old表*****/
INSERT INTO [finance].[dbo].[reimlisttable_old]
           ([stage]
           ,[itemid]
           ,[type]
           ,[claimant]
           ,[dept]
           ,[deptleader]
           ,[relclaimant]
           ,[principal]
           ,[projectDept]
           ,[principaldeptLeader]
           ,[finance]
           ,[projectId]
           ,[givecount]
           ,[summary]
           ,[remark]
           ,[billCount]
           ,[money]
           ,[occurDate]
           ,[reimburseDate]
           ,[principalNotes]
           ,[deptNotes]
           ,[financialNotes]
           ,[gManagerNotes]
           ,[principalApprovalTime]
           ,[deptApprovalTime]
           ,[financialApprovalTime]
           ,[gManagerApprovalTime]
           ,[principalDissentTime]
           ,[deptDissentTime]
           ,[financialDissentTime]
           ,[gManagerDissentTime]
           ,[ch]
           ,[notechen]
           ,[pzh]
           ,[signtime]
           ,[flag]
           ,[yue]
           ,[nowverify])
	select [stage]
           ,[itemid]
           ,[type]
           ,[claimant]
           ,[dept]
           ,[deptleader]
           ,[relclaimant]
           ,[principal]
           ,[projectDept]
           ,[principaldeptLeader]
           ,[finance]
           ,[projectId]
           ,[givecount]
           ,[summary]
           ,[remark]
           ,[billCount]
           ,[money]
           ,[occurDate]
           ,[reimburseDate]
           ,[principalNotes]
           ,[deptNotes]
           ,[financialNotes]
           ,[gManagerNotes]
           ,[principalApprovalTime]
           ,[deptApprovalTime]
           ,[financialApprovalTime]
           ,[gManagerApprovalTime]
           ,[principalDissentTime]
           ,[deptDissentTime]
           ,[financialDissentTime]
           ,[gManagerDissentTime]
           ,[ch]
           ,[notechen]
           ,[pzh]
           ,[signtime]
           ,[flag]
           ,[yue]
           ,[nowverify]
from reimlisttable where stage in (8,9)

delete from reimlisttable where stage in (8,9)




/****
迁移说明
第一步 建立一个table_back的表，然后将原来的表中的数据迁移到table_back表中，然后将原来的表加后缀_原来(table_原来)
第二步 将table_back表的后缀去掉,变成table
第三步 建立一个old表table_old
第四步 将table中(0,10,14,15,66)的数据删除
第五步 将table中(8,9)的数据迁移到table_old中，并在迁移完成后删除table中（8，9）的数据
第六步 将table中实际报销人/经办人已经是被禁止的，迁移到table_old中，并在迁移之后在table中删除
年后回来 工作过程
第一 先将项目表梳理一下（将类型不对的，部门不对的，都先改过来）---改过来之后 项目的project id有了，但是还不能使用vreify函数，必须要等员工的组织结构完成之后的才行，那就先该项目表，然后改组织结构表（今天晚上再重新做一份）
第二步 给现有的报销/借支表 更改表结构 （今天就做，将没有的字段先添加上去）
第四步 使用Verify函数 将报销/借支表，根据stage和projectid来变更have/now/will(verify)字段以及其他字段
第五步 将2014年之前的数据迁移到老的表中,异常数据/未提交/经办人、报销人无效的数据删除
*****/

