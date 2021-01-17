USE [master]
GO
/****** Object:  Database [MyBank]    Script Date: 2021/1/17 14:30:11 ******/
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
/****** Object:  Table [dbo].[amountChange]    Script Date: 2021/1/17 14:30:11 ******/
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
/****** Object:  Table [dbo].[depositor]    Script Date: 2021/1/17 14:30:11 ******/
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
/****** Object:  Table [dbo].[employee]    Script Date: 2021/1/17 14:30:11 ******/
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
ALTER TABLE [dbo].[amountChange]  WITH CHECK ADD  CONSTRAINT [FK_amountChange_depositor] FOREIGN KEY([dId])
REFERENCES [dbo].[depositor] ([dId])
GO
ALTER TABLE [dbo].[amountChange] CHECK CONSTRAINT [FK_amountChange_depositor]
GO
/****** Object:  StoredProcedure [dbo].[proc_amountChange_all_insert]    Script Date: 2021/1/17 14:30:11 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_amountChange_did_select]    Script Date: 2021/1/17 14:30:11 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_amountChange_pid_delete]    Script Date: 2021/1/17 14:30:11 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_amountChange_pid_select]    Script Date: 2021/1/17 14:30:11 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_depositor_all_insert]    Script Date: 2021/1/17 14:30:11 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_depositor_dId_select]    Script Date: 2021/1/17 14:30:11 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_depositor_none_select]    Script Date: 2021/1/17 14:30:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_depositor_none_select]
as
	select * 
	from depositor 
GO
/****** Object:  StoredProcedure [dbo].[proc_depositor_pwd_update]    Script Date: 2021/1/17 14:30:11 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_employee_eId_select]    Script Date: 2021/1/17 14:30:11 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_employee_none_select]    Script Date: 2021/1/17 14:30:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create proc [dbo].[proc_employee_none_select]
as 
	select * from employee
GO
/****** Object:  StoredProcedure [dbo].[proc_employee_pwd_update]    Script Date: 2021/1/17 14:30:11 ******/
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
