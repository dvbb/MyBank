USE [master]
GO
/****** Object:  Database [MyBank]    Script Date: 2021/2/10 13:57:31 ******/
CREATE DATABASE [MyBank]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyBank', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MyBank.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyBank_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MyBank_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MyBank] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyBank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyBank] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyBank] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyBank] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyBank] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyBank] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyBank] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyBank] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyBank] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyBank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyBank] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyBank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyBank] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyBank] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyBank] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyBank] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyBank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyBank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyBank] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyBank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyBank] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyBank] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyBank] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyBank] SET RECOVERY FULL 
GO
ALTER DATABASE [MyBank] SET  MULTI_USER 
GO
ALTER DATABASE [MyBank] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyBank] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyBank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyBank] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyBank] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MyBank', N'ON'
GO
ALTER DATABASE [MyBank] SET QUERY_STORE = OFF
GO
USE [MyBank]
GO
/****** Object:  Table [dbo].[amountChange]    Script Date: 2021/2/10 13:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[amountChange](
	[pId] [uniqueidentifier] NOT NULL,
	[dId] [char](11) NOT NULL,
	[dName] [varchar](20) NOT NULL,
	[addr] [varchar](50) NOT NULL,
	[dType] [varchar](8) NOT NULL,
	[dTime] [datetime] NOT NULL,
	[rate] [float] NOT NULL,
	[deposit] [decimal](18, 0) NOT NULL,
	[dStatus] [bit] NOT NULL,
 CONSTRAINT [PK__amountCh__DD36D5625ADBC0E2] PRIMARY KEY CLUSTERED 
(
	[pId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[depositor]    Script Date: 2021/2/10 13:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[depositor](
	[dId] [char](11) NOT NULL,
	[pwd] [varchar](50) NOT NULL,
	[dName] [varchar](20) NOT NULL,
	[deposit] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK__deposito__D870D66E9F63EC3A] PRIMARY KEY CLUSTERED 
(
	[dId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 2021/2/10 13:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[eId] [char](8) NOT NULL,
	[pwd] [varchar](50) NOT NULL,
	[eName] [varchar](20) NOT NULL,
 CONSTRAINT [PK__employee__D9519B45AE6BF878] PRIMARY KEY CLUSTERED 
(
	[eId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'4d333751-1705-4176-b126-087bba293504', N'18877140000', N'aya', N'上海浦东', N'定期一年', CAST(N'2021-01-06T22:01:26.000' AS DateTime), 1.75, CAST(7800 AS Decimal(18, 0)), 1)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'052096a2-6269-4c92-8752-0d45151a425a', N'18877140000', N'aya', N'上海虹桥', N'定期三月', CAST(N'2021-01-06T22:33:00.000' AS DateTime), 1.35, CAST(5200 AS Decimal(18, 0)), 1)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'6b3cbbb4-333e-48d6-86c9-0f7895c4d4dd', N'18877140000', N'brain', N'上海浦东', N'定期一年', CAST(N'2020-01-06T20:42:35.000' AS DateTime), 1.75, CAST(555 AS Decimal(18, 0)), 1)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'2415882c-355d-4414-9e8e-1254ed5e5edd', N'18877140001', N'brain', N'上海虹桥', N'定期一年', CAST(N'2021-01-10T11:12:34.000' AS DateTime), 1.75, CAST(5200 AS Decimal(18, 0)), 1)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'9b2f825d-8968-4ed2-84f9-1f67619d9be9', N'18877140000', N'matt', N'上海浦东新区', N'定期三月', CAST(N'2021-01-03T15:36:55.000' AS DateTime), 0.6, CAST(12000 AS Decimal(18, 0)), 1)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'f1635256-2d7a-47e5-a4b5-390b7fb7ad61', N'18877140000', N'brain', N'上海浦东', N'定期一年', CAST(N'2021-01-06T20:42:30.000' AS DateTime), 1.75, CAST(1234 AS Decimal(18, 0)), 1)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'16cb644c-b6ec-4dbf-ba9b-3d9e121a2d72', N'18877140000', N'aya', N'上海浦东', N'活期', CAST(N'2021-01-06T22:01:18.000' AS DateTime), 0.3, CAST(666 AS Decimal(18, 0)), 1)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'8f54fc3e-c28c-4640-82d6-51dbb133e2d8', N'18877140001', N'aya', N'上海虹桥', N'定期三月', CAST(N'2021-01-10T11:06:34.000' AS DateTime), 1.35, CAST(5200 AS Decimal(18, 0)), 1)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'48db945a-4ac9-471c-a68d-55c0468706b7', N'18877140001', N'matt', N'上海浦东新区', N'定期三月', CAST(N'2021-01-03T15:31:33.000' AS DateTime), 0.6, CAST(12000 AS Decimal(18, 0)), 1)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'13491e07-24ab-4a25-a117-6193d467181f', N'18877140000', N'aya', N'上海浦东', N'活期', CAST(N'2021-01-06T14:13:56.000' AS DateTime), 0.3, CAST(3000 AS Decimal(18, 0)), 0)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'6dcff870-38a2-4b46-8da5-6403e4700b71', N'18877140001', N'brain', N'上海虹桥', N'活期', CAST(N'2021-01-10T11:06:26.000' AS DateTime), 0.3, CAST(5200 AS Decimal(18, 0)), 0)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'1ec4799b-fbbf-4e1e-8c90-662c9c2c195a', N'18877140001', N'ayxxx', N'上海虹桥', N'定期三月', CAST(N'2021-02-10T13:48:40.000' AS DateTime), 1.35, CAST(2214 AS Decimal(18, 0)), 0)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'8f021561-7865-426d-8e58-6df1bbef6c3f', N'18877140001', N'brain', N'上海虹桥', N'定期一年', CAST(N'2021-01-10T11:13:29.000' AS DateTime), 1.75, CAST(5200 AS Decimal(18, 0)), 0)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'920847a7-04e3-40be-b502-6f97e30478fe', N'18877140000', N'brain', N'上海浦东', N'定期一年', CAST(N'2021-01-06T20:42:27.000' AS DateTime), 1.75, CAST(6660 AS Decimal(18, 0)), 1)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'c8c93da4-41ee-40f7-9bd9-7b613ac0041a', N'18877140000', N'aya', N'上海浦东', N'定期一年', CAST(N'2021-01-06T22:01:24.000' AS DateTime), 1.75, CAST(7800 AS Decimal(18, 0)), 1)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'48453d68-5248-45c6-9e87-7c36e6b02084', N'18877140000', N'matt', N'上海浦东新区', N'活期', CAST(N'2021-01-03T14:35:23.000' AS DateTime), 0.34999999403953552, CAST(5000 AS Decimal(18, 0)), 1)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'55b0f5fc-e68c-40d9-b221-7d9717b641bb', N'18877140000', N'aya', N'上海虹桥', N'活期', CAST(N'2021-01-06T22:34:00.000' AS DateTime), 0.3, CAST(5200 AS Decimal(18, 0)), 0)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'8fb9cae6-1b79-416a-bfbc-855a92b13e31', N'18877140000', N'brain', N'上海浦东', N'定期一年', CAST(N'2021-01-06T20:42:22.000' AS DateTime), 1.75, CAST(66666 AS Decimal(18, 0)), 0)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'27e57007-031e-412d-a178-8d56e9aa42a3', N'13800002202', N'brain', N'上海浦东 ', N'活期', CAST(N'2021-01-06T20:44:00.000' AS DateTime), 0.3, CAST(6666 AS Decimal(18, 0)), 0)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'0bf0d833-dfb7-4313-97c0-8da92cc588cf', N'18877140001', N'aya', N'上海虹桥', N'活期', CAST(N'2021-01-09T16:43:56.000' AS DateTime), 0.3, CAST(5200 AS Decimal(18, 0)), 1)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'622c161f-d03b-4f09-8b0d-937173542c98', N'13800002202', N'brain', N'上海浦东 ', N'定期三月', CAST(N'2021-01-06T20:44:08.000' AS DateTime), 1.35, CAST(7500 AS Decimal(18, 0)), 0)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'f279ac4c-ec46-4d2f-9c11-97af63e3a73f', N'18877140000', N'aya', N'上海浦东', N'定期一年', CAST(N'2021-01-06T22:01:23.000' AS DateTime), 1.75, CAST(7800 AS Decimal(18, 0)), 0)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'ff624186-6d28-4add-a6e9-99d7f921575d', N'18877140000', N'brain', N'上海浦东', N'定期一年', CAST(N'2020-01-06T20:22:41.000' AS DateTime), 1.75, CAST(5000 AS Decimal(18, 0)), 1)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'624aeed4-e06b-48c5-9d9a-aec77daceae8', N'18877140000', N'matt', N'上海浦东新区', N'定期三月', CAST(N'2020-01-03T15:37:28.000' AS DateTime), 0.6, CAST(12000 AS Decimal(18, 0)), 0)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'd13255a7-2b84-4fbf-b77c-b0103734a507', N'18877140001', N'aya', N'上海虹桥', N'定期一年', CAST(N'2021-01-11T13:33:27.000' AS DateTime), 1.75, CAST(3000 AS Decimal(18, 0)), 1)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'1b7199a7-8947-412a-a901-c1e211026bda', N'18877140000', N'matt', N'上海浦东新区', N'定期三月', CAST(N'2020-09-03T15:29:47.000' AS DateTime), 0.6, CAST(3000 AS Decimal(18, 0)), 1)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'37f06fdd-08c0-410f-8774-c5ff45d237e0', N'18877140001', N'brain', N'上海虹桥', N'定期一年', CAST(N'2021-01-10T11:06:58.000' AS DateTime), 1.75, CAST(5200 AS Decimal(18, 0)), 1)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'9b9ebe73-d14e-4a65-90fc-cac0a3272725', N'18877140001', N'aya', N'上海虹桥', N'活期', CAST(N'2021-01-11T13:29:57.000' AS DateTime), 0.3, CAST(2214 AS Decimal(18, 0)), 0)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'7a05d024-d246-4cfb-8404-cc6b56d21b35', N'18877140000', N'aya', N'上海虹桥', N'定期三月', CAST(N'2021-01-06T22:32:36.000' AS DateTime), 1.35, CAST(5200 AS Decimal(18, 0)), 0)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'e9ddddf7-e783-4b7a-ab74-d3b2060e756b', N'18877140001', N'aya', N'上海虹桥', N'活期', CAST(N'2021-01-10T11:13:40.000' AS DateTime), 0.3, CAST(5200 AS Decimal(18, 0)), 0)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'29f5ae1f-8dfd-4c67-b0d2-e5407415f7c0', N'18877140001', N'aya', N'上海虹桥', N'定期三月', CAST(N'2021-01-10T11:17:04.000' AS DateTime), 1.35, CAST(2214 AS Decimal(18, 0)), 0)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'd8987def-7f9a-4737-aee2-e5ddb7fb9e16', N'18877140000', N'aya', N'上海虹桥', N'活期', CAST(N'2021-01-09T10:11:56.000' AS DateTime), 0.3, CAST(5200 AS Decimal(18, 0)), 0)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'dbcb1e02-345e-4ceb-831b-f38924de8e13', N'18877140000', N'aya', N'上海虹桥', N'活期', CAST(N'2021-01-09T10:12:07.000' AS DateTime), 0.3, CAST(5200 AS Decimal(18, 0)), 0)
INSERT [dbo].[amountChange] ([pId], [dId], [dName], [addr], [dType], [dTime], [rate], [deposit], [dStatus]) VALUES (N'7428323d-4832-4774-ae9f-fb98d5d45a63', N'13800002202', N'brain', N'上海浦东 ', N'活期', CAST(N'2021-01-06T20:44:04.000' AS DateTime), 0.3, CAST(7500 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[depositor] ([dId], [pwd], [dName], [deposit]) VALUES (N'10077140000', N'123456', N'ayxxx', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[depositor] ([dId], [pwd], [dName], [deposit]) VALUES (N'13800002200', N'578760600', N'aya', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[depositor] ([dId], [pwd], [dName], [deposit]) VALUES (N'13800002201', N'123456', N'andy', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[depositor] ([dId], [pwd], [dName], [deposit]) VALUES (N'13800002202', N'123456', N'brain', CAST(21666 AS Decimal(18, 0)))
INSERT [dbo].[depositor] ([dId], [pwd], [dName], [deposit]) VALUES (N'18877007700', N'123456', N'eric', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[depositor] ([dId], [pwd], [dName], [deposit]) VALUES (N'18877140000', N'123456', N'matt', CAST(68711 AS Decimal(18, 0)))
INSERT [dbo].[depositor] ([dId], [pwd], [dName], [deposit]) VALUES (N'18877140001', N'578760600', N'eric', CAST(22242 AS Decimal(18, 0)))
INSERT [dbo].[depositor] ([dId], [pwd], [dName], [deposit]) VALUES (N'18877140002', N'123456', N'allian', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[depositor] ([dId], [pwd], [dName], [deposit]) VALUES (N'18877140005', N'123456', N'hhh', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[depositor] ([dId], [pwd], [dName], [deposit]) VALUES (N'18877140010', N'123456', N'XXX', CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[employee] ([eId], [pwd], [eName]) VALUES (N'12011404', N'123456', N'沈希')
INSERT [dbo].[employee] ([eId], [pwd], [eName]) VALUES (N'12012012', N'000', N'陈康康')
GO
ALTER TABLE [dbo].[amountChange]  WITH CHECK ADD  CONSTRAINT [FK_amountChange_depositor] FOREIGN KEY([dId])
REFERENCES [dbo].[depositor] ([dId])
GO
ALTER TABLE [dbo].[amountChange] CHECK CONSTRAINT [FK_amountChange_depositor]
GO
/****** Object:  StoredProcedure [dbo].[proc_amountChange_all_insert]    Script Date: 2021/2/10 13:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






create proc [dbo].[proc_amountChange_all_insert]
	@pid uniqueidentifier,@did char(11),@dname varchar(20),@addr varchar(50),@dtype varchar(8),@dtime datetime,@rate float,@deposit decimal,@dstatus bit
as
	insert into amountChange(pId,dId,dName,addr,dType,dTime,rate,deposit,dStatus) 
	values
		(@pid,@did,@dname,@addr,@dtype,@dtime,@rate,@deposit,@dstatus);
GO
/****** Object:  StoredProcedure [dbo].[proc_amountChange_did_select]    Script Date: 2021/2/10 13:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[proc_amountChange_did_select]
	@did char(11)
as
	select *
	from amountChange
	where did=@did AND dStatus = '0'
GO
/****** Object:  StoredProcedure [dbo].[proc_amountChange_pid_delete]    Script Date: 2021/2/10 13:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




create proc [dbo].[proc_amountChange_pid_delete]
	@pid uniqueidentifier
as
	update amountChange
	set dStatus = 1
	where pId=@pid
GO
/****** Object:  StoredProcedure [dbo].[proc_amountChange_pid_select]    Script Date: 2021/2/10 13:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_amountChange_pid_select]
	@pid uniqueidentifier
as
	select *
	from amountChange
	where pId = @pid 
GO
/****** Object:  StoredProcedure [dbo].[proc_depositor_all_insert]    Script Date: 2021/2/10 13:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_depositor_all_insert]
	@did char(11),@pwd varchar(50),@dname varchar(20)
as
	insert into depositor(dId,pwd,dName,deposit) 
	values
		(@did,@pwd,@dname,0);
GO
/****** Object:  StoredProcedure [dbo].[proc_depositor_dId_select]    Script Date: 2021/2/10 13:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_depositor_dId_select]
	@did char(11)
as
	select * 
	from depositor 
	where dId = @did
GO
/****** Object:  StoredProcedure [dbo].[proc_depositor_none_select]    Script Date: 2021/2/10 13:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_depositor_none_select]
as
	select * 
	from depositor 
GO
/****** Object:  StoredProcedure [dbo].[proc_depositor_pwd_update]    Script Date: 2021/2/10 13:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_depositor_pwd_update]
 @dId char(11),@pwd varchar(50)
 as
	update depositor
	set pwd=@pwd
	where dId=@dId
GO
/****** Object:  StoredProcedure [dbo].[proc_employee_eId_select]    Script Date: 2021/2/10 13:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_employee_eId_select]
	@eid char(8)
as
	select * 
	from employee 
	where eId = @eid
GO
/****** Object:  StoredProcedure [dbo].[proc_employee_none_select]    Script Date: 2021/2/10 13:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create proc [dbo].[proc_employee_none_select]
as 
	select * from employee
GO
/****** Object:  StoredProcedure [dbo].[proc_employee_pwd_update]    Script Date: 2021/2/10 13:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_employee_pwd_update]
	@eid char(8),@pwd  varchar(50)
as
	update employee
	set pwd=@pwd
	where eId=@eid
GO
USE [master]
GO
ALTER DATABASE [MyBank] SET  READ_WRITE 
GO
