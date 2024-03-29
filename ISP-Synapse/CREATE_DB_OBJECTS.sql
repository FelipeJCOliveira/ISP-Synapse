USE [master]
GO
/****** Object:  Database [DB_Synapse]    Script Date: 4/5/2019 11:37:45 AM ******/
CREATE DATABASE [DB_Synapse]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_Synapse', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DB_Synapse.mdf' , SIZE = 466944KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_Synapse_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DB_Synapse_log.ldf' , SIZE = 6889472KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DB_Synapse] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_Synapse].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_Synapse] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_Synapse] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_Synapse] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_Synapse] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_Synapse] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_Synapse] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_Synapse] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_Synapse] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_Synapse] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_Synapse] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_Synapse] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_Synapse] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_Synapse] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_Synapse] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_Synapse] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_Synapse] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_Synapse] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_Synapse] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_Synapse] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_Synapse] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_Synapse] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_Synapse] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_Synapse] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_Synapse] SET  MULTI_USER 
GO
ALTER DATABASE [DB_Synapse] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_Synapse] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_Synapse] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_Synapse] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_Synapse] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_Synapse', N'ON'
GO
ALTER DATABASE [DB_Synapse] SET QUERY_STORE = OFF
GO
USE [DB_Synapse]
GO
USE [DB_Synapse]
GO
/****** Object:  Sequence [dbo].[seq_codigo_origem]    Script Date: 4/5/2019 11:37:46 AM ******/
CREATE SEQUENCE [dbo].[seq_codigo_origem] 
 AS [int]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -2147483648
 MAXVALUE 2147483647
 CACHE 
GO
/****** Object:  Table [dbo].[TB_Hierarquia_Parametro_Regional]    Script Date: 4/5/2019 11:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Hierarquia_Parametro_Regional](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Versao] [int] NOT NULL,
	[Data_Inclusao] [datetime] NOT NULL,
	[Data_Desativacao] [datetime] NULL,
	[Ativo] [bit] NULL,
	[cod_Regional] [varchar](6) NOT NULL,
	[desc_Regional] [varchar](50) NOT NULL,
	[userID] [varchar](14) NULL,
	[Data_Alteracao] [datetime] NULL,
 CONSTRAINT [PK_id_Regional] PRIMARY KEY CLUSTERED 
(
	[cod_Regional] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Hierarquia_Parametro_Unidade]    Script Date: 4/5/2019 11:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Hierarquia_Parametro_Unidade](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Versao] [int] NOT NULL,
	[Data_Inclusao] [datetime] NOT NULL,
	[Data_Desativacao] [datetime] NULL,
	[Ativo] [bit] NULL,
	[cod_Unidade] [varchar](8) NOT NULL,
	[desc_Unidade] [varchar](50) NOT NULL,
	[userID] [varchar](14) NULL,
 CONSTRAINT [PK_id_Unidade] PRIMARY KEY CLUSTERED 
(
	[cod_Unidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Agroview_Parametros_Categoria]    Script Date: 4/5/2019 11:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Agroview_Parametros_Categoria](
	[Codigo_Categoria] [varchar](10) NOT NULL,
	[Descricao_Categoria_Cliente] [varchar](50) NULL,
	[Data_Inclusao] [datetime] NOT NULL,
	[Data_Alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo_Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Agroview_Parametros_Cultura]    Script Date: 4/5/2019 11:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Agroview_Parametros_Cultura](
	[Codigo] [varchar](20) NOT NULL,
	[Descricao] [varchar](50) NULL,
	[Data_Inclusao] [datetime] NOT NULL,
	[Data_Alteracao] [datetime] NULL,
 CONSTRAINT [PK_Cultura] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Agroview_Parametros_Grupo]    Script Date: 4/5/2019 11:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Agroview_Parametros_Grupo](
	[Codigo] [int] NOT NULL,
	[Descricao] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Agroview_Parametros_Safra]    Script Date: 4/5/2019 11:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Agroview_Parametros_Safra](
	[Indice] [int] NOT NULL,
	[Data_Inicio] [date] NULL,
	[Data_Fim] [date] NULL,
	[Indice_Anterior] [int] NULL,
	[Descricao] [varchar](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[Indice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Agroview_Transacional_Consumo]    Script Date: 4/5/2019 11:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Agroview_Transacional_Consumo](
	[Indice] [int] IDENTITY(1,1) NOT NULL,
	[CFOP_Dist] [varchar](16) NULL,
	[Produto] [varchar](50) NULL,
	[Safra] [int] NULL,
	[Cultura] [varchar](20) NULL,
	[Grupo] [int] NULL,
	[Sub_Grupo] [varchar](10) NULL,
	[Categoria_Cliente] [varchar](10) NULL,
	[Municipio] [int] NULL,
	[Cliente] [varchar](15) NULL,
	[CFOP] [varchar](5) NULL,
	[Ano] [int] NULL,
	[Mes] [varchar](3) NULL,
	[Data] [date] NULL,
	[Numero_NF] [int] NULL,
	[Serie_NF] [int] NULL,
	[Situacao] [varchar](12) NULL,
	[Fabricante_Agrupado] [varchar](10) NULL,
	[Codigo_Corporativo] [int] NULL,
	[Codigo_Agrupado] [varchar](10) NULL,
	[RTV_Codigo_Chave] [varchar](20) NULL,
	[Fonte] [varchar](11) NULL,
	[CFOP_Multiplicador] [int] NULL,
	[CPF_CNPJ] [varchar](14) NULL,
	[Regra_Rateio] [varchar](20) NULL,
	[Produto_Origem] [varchar](10) NULL,
	[Operacao] [varchar](25) NULL,
	[Status_Caixa] [varchar](10) NULL,
	[Volume] [int] NULL,
	[Valor] [real] NULL,
	[Preco_Cogs] [real] NULL,
	[Preco_SIP] [real] NULL,
	[Preco_Adesao_Dist] [real] NULL,
	[Preco_Adesao_SPOCA] [real] NULL,
	[Preco_Adesao_SPOCA_Completo] [real] NULL,
	[Preco_Adesao_Regional] [real] NULL,
	[Preco_Adesao_Unidade] [real] NULL,
	[Preco_Adesao_Filial] [real] NULL,
	[RTV_SPOCA] [varchar](10) NULL,
	[Preco_CMT] [real] NULL,
	[Valor_CMT] [real] NULL,
	[Valor_COGS] [real] NULL,
	[Valor_SIP] [real] NULL,
	[Cliente_Transferencia] [varchar](2) NULL,
	[Cliente_Codigo_Distribuidor] [varchar](20) NULL,
	[Cliente_Tipo_Acesso] [varchar](20) NULL,
	[Regra_Rateio_Descricao] [varchar](30) NULL,
	[Area_Atuacao] [varchar](20) NULL,
	[Unidade] [varchar](8) NULL,
	[Filial] [varchar](10) NULL,
	[Regional] [varchar](6) NULL,
	[Filial_Distribuidor] [varchar](30) NOT NULL,
	[Vendedor] [varchar](15) NULL,
	[Prazo_Recebimento] [varchar](20) NULL,
	[Modalidade_Venda] [varchar](30) NULL,
	[Distribuidor_Agricola] [varchar](15) NULL,
	[CFOP_Considera] [varchar](3) NULL,
	[Data_Inclusao] [datetime] NOT NULL,
	[Data_Alteracao] [datetime] NULL,
	[ChaveClienteVendedor] [varchar](31) NULL,
PRIMARY KEY CLUSTERED 
(
	[Indice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Agroview_Parametros_CFOP]    Script Date: 4/5/2019 11:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Agroview_Parametros_CFOP](
	[Codigo] [varchar](5) NOT NULL,
	[Descricao] [varchar](150) NULL,
	[Identificador] [varchar](20) NULL,
	[Multiplicador] [int] NULL,
	[Consumo] [varchar](4) NULL,
	[Operacao] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Agroview_Parametros_CFOPCanais]    Script Date: 4/5/2019 11:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Agroview_Parametros_CFOPCanais](
	[Chave] [varchar](16) NOT NULL,
	[Dist] [int] NOT NULL,
	[Codigo] [varchar](5) NOT NULL,
	[Descricao] [varchar](150) NULL,
	[Identificador] [varchar](20) NULL,
	[Multiplicador] [int] NULL,
	[Consumo] [varchar](4) NULL,
	[Operacao] [varchar](30) NULL,
	[Data_Inclusao] [datetime] NOT NULL,
	[Data_Alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Chave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Hierarquia_Parametro_Filial]    Script Date: 4/5/2019 11:37:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Hierarquia_Parametro_Filial](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Versao] [int] NOT NULL,
	[Data_Inclusao] [datetime] NOT NULL,
	[Data_Desativacao] [datetime] NULL,
	[Ativo] [bit] NULL,
	[cod_Filial] [varchar](10) NOT NULL,
	[desc_Filial] [varchar](50) NOT NULL,
	[userID] [varchar](14) NULL,
 CONSTRAINT [PK_id_Filial] PRIMARY KEY CLUSTERED 
(
	[cod_Filial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_BDO_Consumo]    Script Date: 4/5/2019 11:37:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* WHERE co.Operacao = 'Venda Normal';*/
CREATE VIEW [dbo].[View_BDO_Consumo]
AS
SELECT        co.Indice, co.CFOP_Dist, CFOPCanais.Codigo AS CFOP_Dist_Codigo, CFOPCanais.Descricao AS CFOP_Dist_Descricao, co.Produto, co.Safra, safra.Data_Inicio AS Safra_Data_Inicio, safra.Data_Fim AS Safra_Data_Fim, 
                         safra.Indice_Anterior AS Safra_Indice_Anterior, safra.Descricao AS Safra_Descricao, co.Cultura, cultura.Descricao AS Cultura_Descricao, co.Grupo, grupo.Descricao AS Grupo_Descricao, co.Sub_Grupo, co.Categoria_Cliente, 
                         categoria.Descricao_Categoria_Cliente AS Categoria_Cliente_Descricao, co.Municipio, co.Cliente, co.ChaveClienteVendedor, co.CFOP, CFOP.Descricao AS CFOP_Descricao, co.Ano, co.Mes, co.Data, co.Numero_NF, co.Serie_NF, 
                         co.Situacao, co.Fabricante_Agrupado, co.Codigo_Corporativo, co.Codigo_Agrupado, co.RTV_Codigo_Chave, co.Fonte, co.CFOP_Multiplicador, co.CPF_CNPJ, co.Regra_Rateio, co.Produto_Origem, co.Operacao, co.Status_Caixa, 
                         co.Volume, co.Valor, co.Preco_Cogs, co.Preco_SIP, co.Preco_Adesao_Dist, co.Preco_Adesao_SPOCA, co.Preco_Adesao_SPOCA_Completo, co.Preco_Adesao_Regional, co.Preco_Adesao_Unidade, co.Preco_Adesao_Filial, 
                         co.RTV_SPOCA, co.Preco_CMT, co.Valor_CMT, co.Valor_COGS, co.Valor_SIP, co.Cliente_Transferencia, co.Cliente_Codigo_Distribuidor, co.Cliente_Tipo_Acesso, co.Regra_Rateio_Descricao, co.Area_Atuacao, co.Unidade, 
                         unidade.desc_Unidade AS Unidade_Descricao, co.Filial, filial.desc_Filial AS Filial_Descricao, co.Regional, regional.desc_Regional AS Regional_Descricao, co.Filial_Distribuidor, co.Vendedor, co.Prazo_Recebimento, 
                         co.Modalidade_Venda, co.Distribuidor_Agricola, co.CFOP_Considera, co.Data_Inclusao, co.Data_Alteracao
FROM            dbo.TB_Agroview_Transacional_Consumo AS co LEFT OUTER JOIN
                         dbo.TB_Agroview_Parametros_Safra AS safra ON safra.Indice = co.Safra LEFT OUTER JOIN
                         dbo.TB_Hierarquia_Parametro_Regional AS regional ON regional.cod_Regional = co.Regional LEFT OUTER JOIN
                         dbo.TB_Hierarquia_Parametro_Filial AS filial ON filial.cod_Filial = co.Filial LEFT OUTER JOIN
                         dbo.TB_Agroview_Parametros_Grupo AS grupo ON grupo.Codigo = co.Grupo LEFT OUTER JOIN
                         dbo.TB_Agroview_Parametros_Cultura AS cultura ON cultura.Codigo = co.Cultura LEFT OUTER JOIN
                         dbo.TB_Agroview_Parametros_Categoria AS categoria ON categoria.Codigo_Categoria = co.Categoria_Cliente LEFT OUTER JOIN
                         dbo.TB_Agroview_Parametros_CFOP AS CFOP ON CFOP.Codigo = co.CFOP LEFT OUTER JOIN
                         dbo.TB_Agroview_Parametros_CFOPCanais AS CFOPCanais ON CFOPCanais.Chave = co.CFOP_Dist LEFT OUTER JOIN
                         dbo.TB_Hierarquia_Parametro_Unidade AS unidade ON unidade.cod_Unidade = co.Unidade
GO
/****** Object:  Table [dbo].[TB_Agroview_Parametros_Cliente]    Script Date: 4/5/2019 11:37:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Agroview_Parametros_Cliente](
	[Codigo] [bigint] NOT NULL,
	[Chave] [varchar](15) NULL,
	[CPF_CNPJ] [varchar](14) NULL,
	[Cliente_Principal] [int] NULL,
	[DIST] [int] NULL,
	[Categoria] [varchar](10) NULL,
	[Nome] [varchar](255) NULL,
	[Data_Inclusao] [datetime] NOT NULL,
	[Data_Alteracao] [datetime] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_CHAVE] UNIQUE NONCLUSTERED 
(
	[Chave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_BDO_Agroview_Cliente]    Script Date: 4/5/2019 11:37:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_BDO_Agroview_Cliente]
AS
SELECT        Chave, Codigo, CPF_CNPJ, Cliente_Principal, DIST, Categoria, Nome
FROM            dbo.TB_Agroview_Parametros_Cliente
GO
/****** Object:  Table [dbo].[TB_Agroview_Parametros_DistribuidorSyngenta]    Script Date: 4/5/2019 11:37:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Agroview_Parametros_DistribuidorSyngenta](
	[CodigoOrigem] [varchar](10) NOT NULL,
	[NomeAgrupado] [varchar](80) NULL,
	[SegmentoCodigo] [varchar](10) NULL,
	[Segmento] [varchar](25) NULL,
	[Unidade] [varchar](20) NULL,
	[UnidadeCodigo] [varchar](10) NULL,
	[Filial] [varchar](15) NULL,
	[Regional] [varchar](35) NULL,
	[RegionalCodigo] [varchar](10) NULL,
	[TipoAcesso] [varchar](20) NULL,
	[CodigoAgrupado] [varchar](20) NULL,
	[RtvSpoca] [varchar](10) NULL,
	[RtvSpocaNome] [varchar](50) NULL,
	[CpfCnpj] [varchar](14) NULL,
	[Data_Inclusao] [datetime] NOT NULL,
	[Data_Alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoOrigem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_BDO_DistribuidorSyngenta]    Script Date: 4/5/2019 11:37:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_BDO_DistribuidorSyngenta]
AS
SELECT        CodigoOrigem, NomeAgrupado, SegmentoCodigo, Segmento, Unidade, UnidadeCodigo, Filial, Regional, RegionalCodigo, TipoAcesso, CodigoAgrupado, RtvSpoca, RtvSpocaNome, CpfCnpj, Data_Inclusao, Data_Alteracao
FROM            dbo.TB_Agroview_Parametros_DistribuidorSyngenta
GO
/****** Object:  Table [dbo].[TB_Acesso_Parametro_Dashboard]    Script Date: 4/5/2019 11:37:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Acesso_Parametro_Dashboard](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nome do Dashboard] [varchar](50) NOT NULL,
	[Descrição do Dashboard] [varchar](100) NOT NULL,
 CONSTRAINT [PK_id_Dashboard] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Acesso_Transacional_Permissoes_Acesso]    Script Date: 4/5/2019 11:37:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Acesso_Transacional_Permissoes_Acesso](
	[id] [int] NOT NULL,
	[Acesso Valido] [bit] NOT NULL,
	[Dashboard] [int] NOT NULL,
	[Usuário] [varchar](10) NOT NULL,
	[Permissao] [varchar](5) NOT NULL,
 CONSTRAINT [PK_id_Permissoes_Acesso] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Acesso_Parametro_Usuario]    Script Date: 4/5/2019 11:37:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Acesso_Parametro_Usuario](
	[UserID] [varchar](10) NOT NULL,
	[Regiao] [varchar](8) NULL,
	[Nome do Usuario] [varchar](50) NULL,
	[Situacao] [bit] NULL,
	[NTNAME]  AS (([Regiao]+'\')+[UserID]),
 CONSTRAINT [PK_UserID] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Section_Access]    Script Date: 4/5/2019 11:37:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_Section_Access] 
AS SELECT 
	permissoes.Permissao
    ,usuario.NTNAME 
	,dashboard.[Nome do Dashboard]
FROM TB_Acesso_Parametro_Usuario as usuario
	left join TB_Acesso_Transacional_Permissoes_Acesso as permissoes on permissoes.Usuário = usuario.UserID
		left join TB_Acesso_Parametro_Dashboard as dashboard on dashboard.id = permissoes.Dashboard
    WHERE usuario.Situacao = '1';
GO
/****** Object:  Table [dbo].[PACKAGELOG]    Script Date: 4/5/2019 11:37:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PACKAGELOG](
	[LOGID] [int] IDENTITY(1,1) NOT NULL,
	[EXECUTIONID] [uniqueidentifier] NULL,
	[PACKAGENAME] [nvarchar](255) NULL,
	[PACKAGEID] [varchar](50) NULL,
	[USERNAME] [nvarchar](100) NULL,
	[MACHINENAME] [nvarchar](255) NULL,
	[STARTDATETIME] [datetime] NULL,
	[ENDDATETIME] [datetime] NULL,
	[SOURCENAME] [varchar](255) NULL,
	[MESSAGE] [nvarchar](max) NULL,
	[MESSAGECODE] [int] NULL,
	[LOGDATETIME] [datetime] NULL,
	[INTERACTIVEMODE] [bit] NULL,
	[SOURCEDESCRIPTION] [varchar](255) NULL,
	[TASKNAME] [varchar](255) NULL,
	[TASKID] [nvarchar](255) NULL,
	[EXECSTATUS] [bit] NULL,
	[SERVERNAME] [nvarchar](255) NULL,
 CONSTRAINT [PK_PACKAGELOG] PRIMARY KEY CLUSTERED 
(
	[LOGID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Acesso_Parametro_Permissoes]    Script Date: 4/5/2019 11:37:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Acesso_Parametro_Permissoes](
	[Permissao] [varchar](5) NOT NULL,
	[Descricao] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Permissao] PRIMARY KEY CLUSTERED 
(
	[Permissao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Agroview_Parametros_DistribuidorAgroview]    Script Date: 4/5/2019 11:37:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Agroview_Parametros_DistribuidorAgroview](
	[DistCodigo] [int] NOT NULL,
	[DistNome] [varchar](25) NULL,
	[DistNomeExibicao] [varchar](20) NULL,
	[DistPath] [int] NULL,
	[DistSecurityCode] [int] NULL,
	[DistTipo] [varchar](15) NULL,
	[DistContratoAssinado] [varchar](3) NULL,
	[DistIgnorar] [real] NULL,
	[DistCodigoCampanha] [int] NULL,
	[DistCodigoCorporativo] [int] NULL,
	[DistPossuiCFOPsTratadas] [varchar](1) NULL,
	[DistUnidade] [varchar](10) NULL,
	[DistGerenteProjeto] [varchar](15) NULL,
	[DistFocalizado] [varchar](3) NULL,
	[DistDescricao] [varchar](20) NULL,
	[DistChave] [varchar](15) NOT NULL,
	[DistReduzirDados] [varchar](1) NULL,
	[DistLastUpdate] [datetime] NULL,
	[Data_Inclusao] [datetime] NOT NULL,
	[Data_Alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[DistCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_DISTCHAVE] UNIQUE NONCLUSTERED 
(
	[DistChave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Agroview_Parametros_Filial_Distribuidor]    Script Date: 4/5/2019 11:37:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Agroview_Parametros_Filial_Distribuidor](
	[Chave] [varchar](30) NOT NULL,
	[Distribuidor_Codigo] [varchar](30) NULL,
	[Distribuidor_Descricao] [varchar](60) NULL,
	[CNPJ] [varchar](14) NOT NULL,
	[Municipio_IBGE] [int] NULL,
	[Data_Inclusao] [datetime] NOT NULL,
	[Data_Alteracao] [datetime] NULL,
 CONSTRAINT [PK__TB_Agrov__AA57D6B5E110C954] PRIMARY KEY CLUSTERED 
(
	[Chave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNICO_Chave] UNIQUE NONCLUSTERED 
(
	[Chave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Agroview_Parametros_Municipio]    Script Date: 4/5/2019 11:37:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Agroview_Parametros_Municipio](
	[Codigo] [int] NOT NULL,
	[Descricao] [varchar](50) NULL,
	[Nome] [varchar](50) NULL,
	[Codigo_UF] [int] NULL,
	[UF] [varchar](18) NULL,
	[Regiao] [varchar](18) NULL,
	[Latitude] [real] NULL,
	[Longitude] [real] NULL,
	[Microregiao] [varchar](40) NULL,
	[Microregiao_Codigo] [int] NULL,
	[Mesoregiao] [varchar](40) NULL,
	[Mesoregiao_Codigo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Agroview_Parametros_Produto]    Script Date: 4/5/2019 11:37:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Agroview_Parametros_Produto](
	[Codigo] [varchar](50) NOT NULL,
	[Descricao] [varchar](70) NULL,
	[Familia] [varchar](80) NULL,
	[Unidade] [varchar](3) NULL,
	[Base] [varchar](20) NULL,
	[Linha] [varchar](25) NOT NULL,
	[Empresa] [varchar](20) NULL,
	[Data_Inclusao] [datetime] NOT NULL,
	[Data_Alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Agroview_Parametros_Sub_Grupo]    Script Date: 4/5/2019 11:37:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Agroview_Parametros_Sub_Grupo](
	[Codigo] [varchar](10) NOT NULL,
	[Descricao] [varchar](50) NULL,
	[Data_Inclusao] [datetime] NOT NULL,
	[Data_Alteracao] [datetime] NULL,
 CONSTRAINT [PK_Sub_Grupo] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Agroview_Parametros_Vendedor]    Script Date: 4/5/2019 11:37:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Agroview_Parametros_Vendedor](
	[Chave] [varchar](15) NOT NULL,
	[Codigo] [int] NULL,
	[Descricao] [varchar](60) NULL,
	[CPF_CNPJ] [varchar](14) NULL,
	[Superior] [varchar](20) NULL,
	[Descricao_Equipe_Comercial] [varchar](80) NULL,
	[Data_Inclusao] [datetime] NOT NULL,
	[Data_Alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Chave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Agroview_Transacional_Consumo_Concorrencia]    Script Date: 4/5/2019 11:37:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Agroview_Transacional_Consumo_Concorrencia](
	[Indice] [int] IDENTITY(1,1) NOT NULL,
	[CodigoCorporativo] [int] NULL,
	[CFOPDist] [varchar](16) NULL,
	[MunicipioIBGE] [int] NULL,
	[Ano] [int] NULL,
	[Mes] [varchar](3) NULL,
	[CFOP] [varchar](5) NULL,
	[FabricanteAgrupado] [varchar](10) NULL,
	[Cultura] [varchar](2) NULL,
	[FilialDistribuidor] [varchar](7) NULL,
	[Safra] [int] NULL,
	[GrupoDescricao] [varchar](20) NULL,
	[SubgrupoDescricao] [varchar](50) NULL,
	[Vendedor] [varchar](15) NULL,
	[Produto] [varchar](50) NULL,
	[Subgrupo] [varchar](20) NULL,
	[Grupo] [varchar](15) NULL,
	[Cliente] [varchar](15) NULL,
	[Volume] [real] NULL,
	[Valor] [real] NULL,
	[Fonte] [varchar](11) NULL,
	[CFOPMultiplicador] [int] NULL,
	[Operacao] [varchar](25) NULL,
	[CodigoAgrupado] [varchar](10) NULL,
	[Unidade] [varchar](8) NULL,
	[Filial] [varchar](10) NULL,
	[Regional] [varchar](6) NULL,
	[Dt_Inclusao] [datetime] NOT NULL,
	[Dt_Alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Indice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Agroview_Transacional_Venda_Agroview]    Script Date: 4/5/2019 11:37:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Agroview_Transacional_Venda_Agroview](
	[Indice] [int] IDENTITY(1,1) NOT NULL,
	[Codigo_Corporativo] [int] NULL,
	[CFOP] [int] NULL,
	[Filial] [varchar](4) NULL,
	[Fabricante] [varchar](4) NULL,
	[Data] [date] NULL,
	[Ano] [int] NULL,
	[Mes] [varchar](3) NULL,
	[Filial_CNPJ] [varchar](14) NULL,
	[Data_Emissao] [date] NULL,
	[Data_Recebimento] [date] NULL,
	[Data_Vencimento] [date] NULL,
	[Numero_NF] [int] NULL,
	[Serie_NF] [int] NULL,
	[CFOP_Original] [int] NULL,
	[Valor_Item] [real] NULL,
	[Fabricante_Agrupado] [varchar](10) NULL,
	[Produto_Syngenta] [varchar](10) NULL,
	[Grupo_Syngenta] [int] NULL,
	[Sub_Grupo_Syngenta] [varchar](10) NULL,
	[Volume_Synapse] [int] NULL,
	[CFOP_Multiplicador] [int] NULL,
	[Codigo_Agrupado] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Indice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Agroview_Transacional_VPM]    Script Date: 4/5/2019 11:37:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Agroview_Transacional_VPM](
	[Ano] [int] NULL,
	[Municipio_IBGE] [int] NULL,
	[UF] [varchar](2) NULL,
	[Codigo_Corporativo] [int] NULL,
	[Codigo_Agrupado] [int] NULL,
	[Indice_Tecnologico] [real] NULL,
	[VPM] [real] NULL,
	[Codigo_RTV] [varchar](6) NULL,
	[Unidade] [varchar](8) NULL,
	[Regional] [varchar](6) NULL,
	[Empresa_Codigo] [int] NULL,
	[Setor_Codigo] [int] NULL,
	[Cultura_Codigo] [varchar](20) NULL,
	[Safra_Indice] [int] NULL,
	[Setor] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Carga_Categoria_Cliente]    Script Date: 4/5/2019 11:37:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Carga_Categoria_Cliente](
	[Codigo_Categoria] [varchar](10) NULL,
	[Descricao_Categoria_Cliente] [varchar](50) NULL,
	[Data_Inclusao] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Carga_CFOP]    Script Date: 4/5/2019 11:37:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Carga_CFOP](
	[Codigo] [nvarchar](8) NULL,
	[Descricao] [nvarchar](150) NULL,
	[Identificador] [nvarchar](20) NULL,
	[Multiplicador] [nvarchar](10) NULL,
	[Consumo] [nvarchar](4) NULL,
	[Operacao] [nvarchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Carga_CFOPCanais]    Script Date: 4/5/2019 11:37:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Carga_CFOPCanais](
	[CFOPChave] [varchar](16) NULL,
	[Dist] [varchar](10) NULL,
	[Codigo] [varchar](5) NULL,
	[Descricao] [varchar](150) NULL,
	[Identificador] [varchar](20) NULL,
	[Multiplicador] [varchar](10) NULL,
	[Consumo] [varchar](4) NULL,
	[Operacao] [varchar](30) NULL,
	[Data_Inclusao] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Carga_Cliente]    Script Date: 4/5/2019 11:37:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Carga_Cliente](
	[Chave] [varchar](50) NULL,
	[Codigo] [varchar](50) NULL,
	[CPF_CNPJ] [varchar](50) NULL,
	[Cliente_Principal] [varchar](50) NULL,
	[DIST] [varchar](50) NULL,
	[Categoria] [varchar](50) NULL,
	[Nome] [varchar](50) NULL,
	[Data_Inclusao] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Carga_CNPJ_Dist]    Script Date: 4/5/2019 11:37:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Carga_CNPJ_Dist](
	[CPF_CNPJ] [nvarchar](14) NULL,
	[Tipo_Acesso] [nvarchar](20) NULL,
	[Codigo_Agrupado] [nvarchar](10) NULL,
	[Nome] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Carga_Consumo]    Script Date: 4/5/2019 11:37:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Carga_Consumo](
	[CFOP_Dist] [varchar](16) NULL,
	[Produto] [varchar](10) NULL,
	[Safra] [varchar](2) NULL,
	[Cultura] [varchar](20) NULL,
	[Grupo] [varchar](10) NULL,
	[Sub_Grupo] [varchar](10) NULL,
	[Categoria_Cliente] [varchar](10) NULL,
	[Municipio] [varchar](10) NULL,
	[Cliente] [varchar](15) NULL,
	[CFOP] [varchar](5) NULL,
	[Ano] [varchar](4) NULL,
	[Mes] [varchar](3) NULL,
	[Data] [varchar](10) NULL,
	[Numero_NF] [varchar](10) NULL,
	[Serie_NF] [varchar](5) NULL,
	[Situacao] [varchar](12) NULL,
	[Fabricante_Agrupado] [varchar](10) NULL,
	[Codigo_Corporativo] [varchar](10) NULL,
	[Codigo_Agrupado] [varchar](10) NULL,
	[RTV_Codigo_Chave] [varchar](20) NULL,
	[Fonte] [varchar](11) NULL,
	[CFOP_Multiplicador] [varchar](2) NULL,
	[CPF_CNPJ] [varchar](14) NULL,
	[Regra_Rateio] [varchar](20) NULL,
	[Produto_Origem] [varchar](10) NULL,
	[Operacao] [varchar](25) NULL,
	[Status_Caixa] [varchar](10) NULL,
	[Volume] [varchar](15) NULL,
	[Valor] [varchar](20) NULL,
	[Preco_Cogs] [varchar](20) NULL,
	[Preco_SIP] [varchar](10) NULL,
	[Preco_Adesao_Dist] [varchar](10) NULL,
	[Preco_Adesao_SPOCA] [varchar](10) NULL,
	[Preco_Adesao_SPOCA_Completo] [varchar](10) NULL,
	[Preco_Adesao_Regional] [varchar](10) NULL,
	[Preco_Adesao_Unidade] [varchar](20) NULL,
	[Preco_Adesao_Filial] [varchar](20) NULL,
	[RTV_SPOCA] [varchar](10) NULL,
	[Preco_CMT] [varchar](20) NULL,
	[Valor_CMT] [varchar](20) NULL,
	[Valor_COGS] [varchar](20) NULL,
	[Valor_SIP] [varchar](10) NULL,
	[Cliente_Transferencia] [varchar](2) NULL,
	[Cliente_Codigo_Distribuidor] [varchar](20) NULL,
	[Cliente_Tipo_Acesso] [varchar](20) NULL,
	[Regra_Rateio_Descricao] [varchar](30) NULL,
	[Area_Atuacao] [varchar](20) NULL,
	[Unidade] [varchar](10) NULL,
	[Filial] [varchar](10) NULL,
	[Regional] [varchar](10) NULL,
	[Filial_Distribuidor] [varchar](10) NULL,
	[Vendedor] [varchar](20) NULL,
	[Prazo_Recebimento] [varchar](20) NULL,
	[Modalidade_Venda] [varchar](30) NULL,
	[Distribuidor_Agricola] [varchar](10) NULL,
	[CFOP_Considera] [varchar](3) NULL,
	[TipoFato] [varchar](15) NULL,
	[DistribuidorIgnorarShelfShare] [varchar](1) NULL,
	[DataCompleta] [varchar](10) NULL,
	[Data_Inclusao] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Carga_Consumo_Concorrencia]    Script Date: 4/5/2019 11:37:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Carga_Consumo_Concorrencia](
	[CodigoCorporativo] [varchar](10) NULL,
	[CFOPDist] [varchar](20) NULL,
	[MunicipioIBGE] [varchar](10) NULL,
	[Ano] [varchar](4) NULL,
	[Mes] [varchar](3) NULL,
	[CFOP] [varchar](5) NULL,
	[FabricanteAgrupado] [varchar](10) NULL,
	[Cultura] [varchar](2) NULL,
	[FilialDistribuidor] [varchar](7) NULL,
	[Safra] [varchar](3) NULL,
	[GrupoDescricao] [varchar](20) NULL,
	[SubgrupoDescricao] [varchar](50) NULL,
	[Vendedor] [varchar](15) NULL,
	[Produto] [varchar](50) NULL,
	[Subgrupo] [varchar](20) NULL,
	[Grupo] [varchar](15) NULL,
	[Cliente] [varchar](15) NULL,
	[Volume] [varchar](20) NULL,
	[Valor] [varchar](20) NULL,
	[Fonte] [varchar](11) NULL,
	[CFOPMultiplicador] [varchar](2) NULL,
	[Operacao] [varchar](25) NULL,
	[CodigoAgrupado] [varchar](10) NULL,
	[Unidade] [varchar](8) NULL,
	[Filial] [varchar](10) NULL,
	[Regional] [varchar](6) NULL,
	[Dt_Inclusao] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Carga_Cultura]    Script Date: 4/5/2019 11:37:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Carga_Cultura](
	[Codigo] [varchar](20) NULL,
	[Descricao] [varchar](50) NULL,
	[Data_Inclusao] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Carga_DistribuidorAgroview]    Script Date: 4/5/2019 11:37:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Carga_DistribuidorAgroview](
	[DistCodigo] [varchar](10) NULL,
	[DistNome] [varchar](50) NULL,
	[DistNomeExibicao] [varchar](50) NULL,
	[DistPath] [varchar](50) NULL,
	[DistSecurityCode] [varchar](50) NULL,
	[DistTipo] [varchar](50) NULL,
	[DistContratoAssinado] [varchar](50) NULL,
	[DistIgnorar] [varchar](50) NULL,
	[DistCodigoCampanha] [varchar](50) NULL,
	[DistCodigoCorporativo] [varchar](50) NULL,
	[DistPossuiCFOPsTratadas] [varchar](1) NULL,
	[DistUnidade] [varchar](10) NULL,
	[DistGerenteProjeto] [varchar](15) NULL,
	[DistFocalizado] [varchar](3) NULL,
	[DistDescricao] [varchar](20) NULL,
	[DistChave] [varchar](15) NULL,
	[DistReduzirDados] [varchar](1) NULL,
	[DistLastUpdate] [varchar](20) NULL,
	[Data_Inclusao] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Carga_DistribuidorSyngenta]    Script Date: 4/5/2019 11:37:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Carga_DistribuidorSyngenta](
	[CodigoOrigem] [varchar](10) NULL,
	[NomeAgrupado] [varchar](80) NULL,
	[SegmentoCodigo] [varchar](10) NULL,
	[Segmento] [varchar](25) NULL,
	[Unidade] [varchar](20) NULL,
	[UnidadeCodigo] [varchar](10) NULL,
	[Filial] [varchar](15) NULL,
	[Regional] [varchar](35) NULL,
	[RegionalCodigo] [varchar](10) NULL,
	[TipoAcesso] [varchar](20) NULL,
	[CodigoAgrupado] [varchar](20) NULL,
	[RtvSpoca] [varchar](10) NULL,
	[RtvSpocaNome] [varchar](50) NULL,
	[CpfCnpj] [varchar](14) NULL,
	[Data_Inclusao] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Carga_Filial]    Script Date: 4/5/2019 11:37:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Carga_Filial](
	[Codigo] [varchar](10) NULL,
	[Descricao] [varchar](10) NULL,
	[Data_Inclusao] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Carga_Filial_Distribuidor]    Script Date: 4/5/2019 11:37:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Carga_Filial_Distribuidor](
	[Chave] [nvarchar](30) NULL,
	[Distribuidor_Codigo] [nvarchar](30) NULL,
	[Distribuidor_Descricao] [nvarchar](60) NULL,
	[CNPJ] [nvarchar](14) NULL,
	[Municipio_IBGE] [nvarchar](10) NULL,
	[Data_Inclusao] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Carga_Grupo]    Script Date: 4/5/2019 11:37:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Carga_Grupo](
	[Codigo] [nvarchar](10) NULL,
	[Descricao] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Carga_Inventario]    Script Date: 4/5/2019 11:37:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Carga_Inventario](
	[Year] [varchar](4) NULL,
	[Month] [varchar](2) NULL,
	[FND_Customer] [varchar](8) NULL,
	[Customer] [varchar](255) NULL,
	[Codigo_Correto] [varchar](10) NULL,
	[Sum_Inventory] [varchar](12) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Carga_LOG_Arquivo]    Script Date: 4/5/2019 11:37:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Carga_LOG_Arquivo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Data_Carga] [date] NOT NULL,
	[Nome_Arquivo] [varchar](20) NOT NULL,
	[Qtd_Registros] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Carga_LOG_Campos]    Script Date: 4/5/2019 11:37:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Carga_LOG_Campos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Data_Carga] [date] NOT NULL,
	[Nome_Tabela] [varchar](20) NOT NULL,
	[Nome_Campo] [varchar](20) NOT NULL,
	[Valor_Carregado] [varchar](255) NOT NULL,
	[Situacao_Carga] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Carga_Municipio]    Script Date: 4/5/2019 11:37:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Carga_Municipio](
	[Codigo] [varchar](10) NULL,
	[Descricao] [varchar](50) NULL,
	[Nome] [varchar](50) NULL,
	[Microrregiao_Codigo] [varchar](10) NULL,
	[Microrregiao] [varchar](40) NULL,
	[Mesorregiao_Codigo] [varchar](10) NULL,
	[Mesorregiao] [varchar](40) NULL,
	[Codigo_UF] [varchar](10) NULL,
	[UF] [varchar](18) NULL,
	[Regiao] [varchar](18) NULL,
	[Latitude] [varchar](10) NULL,
	[Longitude] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Carga_Produto]    Script Date: 4/5/2019 11:37:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Carga_Produto](
	[Codigo] [varchar](50) NULL,
	[Descricao] [varchar](70) NULL,
	[Familia] [varchar](80) NULL,
	[Unidade] [varchar](3) NULL,
	[Base] [varchar](20) NULL,
	[Linha] [varchar](25) NULL,
	[Empresa] [varchar](20) NULL,
	[Data_Inclusao] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Carga_Regional]    Script Date: 4/5/2019 11:37:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Carga_Regional](
	[Codigo] [varchar](10) NULL,
	[Descricao] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Carga_Safra]    Script Date: 4/5/2019 11:37:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Carga_Safra](
	[Indice] [nvarchar](3) NULL,
	[Data_Inicio] [nvarchar](10) NULL,
	[Data_Fim] [nvarchar](10) NULL,
	[Indice_Anterior] [nvarchar](3) NULL,
	[Descricao] [nvarchar](8) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Carga_Sub_Grupo]    Script Date: 4/5/2019 11:37:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Carga_Sub_Grupo](
	[Codigo] [nvarchar](10) NULL,
	[Descricao] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Carga_Unidade]    Script Date: 4/5/2019 11:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Carga_Unidade](
	[Codigo] [varchar](10) NULL,
	[Descricao] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Carga_Venda_Agroview]    Script Date: 4/5/2019 11:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Carga_Venda_Agroview](
	[Codigo_Corporativo] [nvarchar](10) NULL,
	[CFOP] [nvarchar](5) NULL,
	[Filial] [nvarchar](10) NULL,
	[Fabricante] [nvarchar](20) NULL,
	[Data] [nvarchar](10) NULL,
	[Ano] [nvarchar](4) NULL,
	[Mes] [nvarchar](3) NULL,
	[Filial_CNPJ] [nvarchar](50) NULL,
	[Data_Emissao] [nvarchar](10) NULL,
	[Data_Recebimento] [nvarchar](10) NULL,
	[Data_Vencimento] [nvarchar](10) NULL,
	[Numero_NF] [nvarchar](20) NULL,
	[Serie_NF] [nvarchar](10) NULL,
	[CFOP_Original] [nvarchar](10) NULL,
	[Valor_Item] [nvarchar](20) NULL,
	[Fabricante_Agrupado] [nvarchar](10) NULL,
	[Produto_Syngenta] [nvarchar](20) NULL,
	[Grupo_Syngenta] [nvarchar](10) NULL,
	[Sub_Grupo_Syngenta] [nvarchar](20) NULL,
	[Volume_Synapse] [nvarchar](20) NULL,
	[CFOP_Multiplicador] [nvarchar](2) NULL,
	[Codigo_Agrupado] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Carga_Vendedor]    Script Date: 4/5/2019 11:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Carga_Vendedor](
	[Chave] [varchar](15) NULL,
	[Codigo] [varchar](10) NULL,
	[Descricao] [varchar](60) NULL,
	[CPF_CNPJ] [varchar](14) NULL,
	[Superior] [varchar](20) NULL,
	[Descricao_Equipe_Comercial] [varchar](80) NULL,
	[Data_Inclusao] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Carga_VPM]    Script Date: 4/5/2019 11:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Carga_VPM](
	[Ano] [varchar](4) NULL,
	[Municipio_IBGE] [varchar](7) NULL,
	[UF] [varchar](2) NULL,
	[Codigo_Corporativo] [varchar](10) NULL,
	[Codigo_Agrupado] [varchar](10) NULL,
	[Indice_Tecnologico] [varchar](20) NULL,
	[VPM] [varchar](20) NULL,
	[Codigo_RTV] [varchar](10) NULL,
	[Unidade] [varchar](8) NULL,
	[Regional] [varchar](7) NULL,
	[Empresa_Codigo] [varchar](2) NULL,
	[Setor_Codigo] [varchar](2) NULL,
	[Cultura_Codigo] [varchar](3) NULL,
	[Safra_Indice] [varchar](1) NULL,
	[Setor] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Hierarquia_Parametro_DTM]    Script Date: 4/5/2019 11:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Hierarquia_Parametro_DTM](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Versao] [int] NOT NULL,
	[Data_Inclusao] [datetime] NOT NULL,
	[Data_Desativacao] [datetime] NULL,
	[Ativo] [bit] NULL,
	[cod_DTM] [varchar](6) NOT NULL,
	[desc_DTM] [varchar](50) NOT NULL,
	[userID] [varchar](14) NULL,
 CONSTRAINT [PK_cd_DTM] PRIMARY KEY CLUSTERED 
(
	[cod_DTM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Hierarquia_Parametro_Gerente_DTM]    Script Date: 4/5/2019 11:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Hierarquia_Parametro_Gerente_DTM](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Versao] [int] NOT NULL,
	[Data_Inclusao] [datetime] NOT NULL,
	[Data_Desativacao] [datetime] NULL,
	[Ativo] [bit] NULL,
	[cod_Gerente_DTM] [varchar](6) NOT NULL,
	[desc_Gerente_DTM] [varchar](50) NOT NULL,
	[userID] [varchar](14) NULL,
 CONSTRAINT [PK_id_Gerente_DTM] PRIMARY KEY CLUSTERED 
(
	[cod_Gerente_DTM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Hierarquia_Parametro_Pais]    Script Date: 4/5/2019 11:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Hierarquia_Parametro_Pais](
	[id] [int] NULL,
	[cod_Pais] [varchar](3) NOT NULL,
	[dec_Pais] [varchar](50) NOT NULL,
	[Abreviatura_Pais] [varchar](3) NOT NULL,
 CONSTRAINT [PK_table1_cod_Pais] PRIMARY KEY CLUSTERED 
(
	[cod_Pais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Hierarquia_Parametro_RTV]    Script Date: 4/5/2019 11:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Hierarquia_Parametro_RTV](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Versao] [int] NOT NULL,
	[Data_Inclusao] [datetime] NOT NULL,
	[Data_Desativacao] [datetime] NULL,
	[Ativo] [bit] NULL,
	[cod_RTV] [varchar](6) NOT NULL,
	[desc_RTV] [varchar](50) NOT NULL,
	[userID] [varchar](14) NULL,
 CONSTRAINT [PK_id_RTV] PRIMARY KEY CLUSTERED 
(
	[cod_RTV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Hierarquia_Transacional_Estrutura_Comercial]    Script Date: 4/5/2019 11:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Hierarquia_Transacional_Estrutura_Comercial](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Versao] [int] NOT NULL,
	[Data_Inclusao] [datetime] NOT NULL,
	[Data_Desativacao] [datetime] NULL,
	[Ativo] [bit] NOT NULL,
	[cd_Pais] [varchar](3) NULL,
	[cd_Unidade] [varchar](8) NULL,
	[cd_Filial] [varchar](10) NULL,
	[cd_Regional] [varchar](6) NULL,
	[cod_RTV] [varchar](6) NULL,
 CONSTRAINT [PK_TB_Hierarquia_Transacional_Estrutura_DTM_id_copy] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Hierarquia_Transacional_Estrutura_DTM]    Script Date: 4/5/2019 11:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Hierarquia_Transacional_Estrutura_DTM](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Versao] [int] NOT NULL,
	[Data_Inclusao] [datetime] NOT NULL,
	[Data_Desativacao] [datetime] NULL,
	[Ativo] [bit] NOT NULL,
	[cd_Pais] [varchar](3) NULL,
	[cd_Unidade] [varchar](8) NULL,
	[cd_Filial] [varchar](10) NULL,
	[cd_Regional] [varchar](6) NULL,
	[cod_RTV] [varchar](6) NULL,
	[cod_DTM] [varchar](6) NULL,
	[cd_Gerente_DTM] [varchar](6) NULL,
 CONSTRAINT [PK_TB_Hierarquia_Transacional_Estrutura_DTM_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PACKAGELOG] ADD  CONSTRAINT [DF_PACKAGELOG_EXECSTATUS]  DEFAULT ((0)) FOR [EXECSTATUS]
GO
ALTER TABLE [dbo].[TB_Acesso_Transacional_Permissoes_Acesso]  WITH CHECK ADD  CONSTRAINT [FK_Dashboard] FOREIGN KEY([Dashboard])
REFERENCES [dbo].[TB_Acesso_Parametro_Dashboard] ([id])
GO
ALTER TABLE [dbo].[TB_Acesso_Transacional_Permissoes_Acesso] CHECK CONSTRAINT [FK_Dashboard]
GO
ALTER TABLE [dbo].[TB_Acesso_Transacional_Permissoes_Acesso]  WITH CHECK ADD  CONSTRAINT [FK_Permissoes] FOREIGN KEY([Permissao])
REFERENCES [dbo].[TB_Acesso_Parametro_Permissoes] ([Permissao])
GO
ALTER TABLE [dbo].[TB_Acesso_Transacional_Permissoes_Acesso] CHECK CONSTRAINT [FK_Permissoes]
GO
ALTER TABLE [dbo].[TB_Acesso_Transacional_Permissoes_Acesso]  WITH CHECK ADD  CONSTRAINT [FK_Permissoes_Acesso_Usuario] FOREIGN KEY([Usuário])
REFERENCES [dbo].[TB_Acesso_Parametro_Usuario] ([UserID])
GO
ALTER TABLE [dbo].[TB_Acesso_Transacional_Permissoes_Acesso] CHECK CONSTRAINT [FK_Permissoes_Acesso_Usuario]
GO
ALTER TABLE [dbo].[TB_Agroview_Parametros_Filial_Distribuidor]  WITH NOCHECK ADD  CONSTRAINT [FK_Filial_Distribuidor_Municipio] FOREIGN KEY([Municipio_IBGE])
REFERENCES [dbo].[TB_Agroview_Parametros_Municipio] ([Codigo])
GO
ALTER TABLE [dbo].[TB_Agroview_Parametros_Filial_Distribuidor] CHECK CONSTRAINT [FK_Filial_Distribuidor_Municipio]
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo]  WITH CHECK ADD  CONSTRAINT [FK_Consumo_Categoria_Cliente] FOREIGN KEY([Categoria_Cliente])
REFERENCES [dbo].[TB_Agroview_Parametros_Categoria] ([Codigo_Categoria])
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo] CHECK CONSTRAINT [FK_Consumo_Categoria_Cliente]
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo]  WITH CHECK ADD  CONSTRAINT [FK_Consumo_CFOP] FOREIGN KEY([CFOP])
REFERENCES [dbo].[TB_Agroview_Parametros_CFOP] ([Codigo])
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo] CHECK CONSTRAINT [FK_Consumo_CFOP]
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo]  WITH CHECK ADD  CONSTRAINT [FK_Consumo_CFOPCanais] FOREIGN KEY([CFOP_Dist])
REFERENCES [dbo].[TB_Agroview_Parametros_CFOPCanais] ([Chave])
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo] CHECK CONSTRAINT [FK_Consumo_CFOPCanais]
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo]  WITH CHECK ADD  CONSTRAINT [FK_Consumo_Cliente] FOREIGN KEY([Cliente])
REFERENCES [dbo].[TB_Agroview_Parametros_Cliente] ([Chave])
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo] CHECK CONSTRAINT [FK_Consumo_Cliente]
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo]  WITH CHECK ADD  CONSTRAINT [FK_Consumo_Cultura] FOREIGN KEY([Cultura])
REFERENCES [dbo].[TB_Agroview_Parametros_Cultura] ([Codigo])
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo] CHECK CONSTRAINT [FK_Consumo_Cultura]
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo]  WITH CHECK ADD  CONSTRAINT [FK_Consumo_DistribuidorAgroview] FOREIGN KEY([Distribuidor_Agricola])
REFERENCES [dbo].[TB_Agroview_Parametros_DistribuidorAgroview] ([DistChave])
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo] CHECK CONSTRAINT [FK_Consumo_DistribuidorAgroview]
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo]  WITH CHECK ADD  CONSTRAINT [FK_Consumo_DistribuidorSyngenta] FOREIGN KEY([Codigo_Agrupado])
REFERENCES [dbo].[TB_Agroview_Parametros_DistribuidorSyngenta] ([CodigoOrigem])
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo] CHECK CONSTRAINT [FK_Consumo_DistribuidorSyngenta]
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo]  WITH CHECK ADD  CONSTRAINT [FK_Consumo_Filial] FOREIGN KEY([Filial])
REFERENCES [dbo].[TB_Hierarquia_Parametro_Filial] ([cod_Filial])
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo] CHECK CONSTRAINT [FK_Consumo_Filial]
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo]  WITH CHECK ADD  CONSTRAINT [FK_Consumo_Filial_Distribuidor] FOREIGN KEY([Filial_Distribuidor])
REFERENCES [dbo].[TB_Agroview_Parametros_Filial_Distribuidor] ([Chave])
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo] CHECK CONSTRAINT [FK_Consumo_Filial_Distribuidor]
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo]  WITH CHECK ADD  CONSTRAINT [FK_Consumo_Grupo] FOREIGN KEY([Grupo])
REFERENCES [dbo].[TB_Agroview_Parametros_Grupo] ([Codigo])
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo] CHECK CONSTRAINT [FK_Consumo_Grupo]
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo]  WITH CHECK ADD  CONSTRAINT [FK_Consumo_Municipio] FOREIGN KEY([Municipio])
REFERENCES [dbo].[TB_Agroview_Parametros_Municipio] ([Codigo])
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo] CHECK CONSTRAINT [FK_Consumo_Municipio]
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo]  WITH CHECK ADD  CONSTRAINT [FK_Consumo_Produto] FOREIGN KEY([Produto])
REFERENCES [dbo].[TB_Agroview_Parametros_Produto] ([Codigo])
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo] CHECK CONSTRAINT [FK_Consumo_Produto]
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo]  WITH CHECK ADD  CONSTRAINT [FK_Consumo_Regional] FOREIGN KEY([Regional])
REFERENCES [dbo].[TB_Hierarquia_Parametro_Regional] ([cod_Regional])
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo] CHECK CONSTRAINT [FK_Consumo_Regional]
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo]  WITH CHECK ADD  CONSTRAINT [FK_Consumo_Safra] FOREIGN KEY([Safra])
REFERENCES [dbo].[TB_Agroview_Parametros_Safra] ([Indice])
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo] CHECK CONSTRAINT [FK_Consumo_Safra]
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo]  WITH CHECK ADD  CONSTRAINT [FK_Consumo_Sub_Grupo] FOREIGN KEY([Sub_Grupo])
REFERENCES [dbo].[TB_Agroview_Parametros_Sub_Grupo] ([Codigo])
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo] CHECK CONSTRAINT [FK_Consumo_Sub_Grupo]
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo]  WITH CHECK ADD  CONSTRAINT [FK_Consumo_Unidade] FOREIGN KEY([Unidade])
REFERENCES [dbo].[TB_Hierarquia_Parametro_Unidade] ([cod_Unidade])
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo] CHECK CONSTRAINT [FK_Consumo_Unidade]
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo]  WITH CHECK ADD  CONSTRAINT [FK_Consumo_Vendedor] FOREIGN KEY([Vendedor])
REFERENCES [dbo].[TB_Agroview_Parametros_Vendedor] ([Chave])
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Consumo] CHECK CONSTRAINT [FK_Consumo_Vendedor]
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Venda_Agroview]  WITH NOCHECK ADD  CONSTRAINT [FK_Venda_Grupo] FOREIGN KEY([Grupo_Syngenta])
REFERENCES [dbo].[TB_Agroview_Parametros_Grupo] ([Codigo])
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Venda_Agroview] CHECK CONSTRAINT [FK_Venda_Grupo]
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Venda_Agroview]  WITH NOCHECK ADD  CONSTRAINT [FK_Venda_Sub_Grupo] FOREIGN KEY([Sub_Grupo_Syngenta])
REFERENCES [dbo].[TB_Agroview_Parametros_Sub_Grupo] ([Codigo])
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_Venda_Agroview] CHECK CONSTRAINT [FK_Venda_Sub_Grupo]
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_VPM]  WITH CHECK ADD  CONSTRAINT [FK_VPM_Cultura] FOREIGN KEY([Cultura_Codigo])
REFERENCES [dbo].[TB_Agroview_Parametros_Cultura] ([Codigo])
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_VPM] CHECK CONSTRAINT [FK_VPM_Cultura]
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_VPM]  WITH CHECK ADD  CONSTRAINT [FK_VPM_Municipio] FOREIGN KEY([Municipio_IBGE])
REFERENCES [dbo].[TB_Agroview_Parametros_Municipio] ([Codigo])
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_VPM] CHECK CONSTRAINT [FK_VPM_Municipio]
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_VPM]  WITH CHECK ADD  CONSTRAINT [FK_VPM_Regional] FOREIGN KEY([Regional])
REFERENCES [dbo].[TB_Hierarquia_Parametro_Regional] ([cod_Regional])
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_VPM] CHECK CONSTRAINT [FK_VPM_Regional]
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_VPM]  WITH CHECK ADD  CONSTRAINT [FK_VPM_RTV] FOREIGN KEY([Codigo_RTV])
REFERENCES [dbo].[TB_Hierarquia_Parametro_RTV] ([cod_RTV])
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_VPM] CHECK CONSTRAINT [FK_VPM_RTV]
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_VPM]  WITH CHECK ADD  CONSTRAINT [FK_VPM_Safra] FOREIGN KEY([Safra_Indice])
REFERENCES [dbo].[TB_Agroview_Parametros_Safra] ([Indice])
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_VPM] CHECK CONSTRAINT [FK_VPM_Safra]
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_VPM]  WITH CHECK ADD  CONSTRAINT [FK_VPM_Unidade] FOREIGN KEY([Unidade])
REFERENCES [dbo].[TB_Hierarquia_Parametro_Unidade] ([cod_Unidade])
GO
ALTER TABLE [dbo].[TB_Agroview_Transacional_VPM] CHECK CONSTRAINT [FK_VPM_Unidade]
GO
ALTER TABLE [dbo].[TB_Hierarquia_Transacional_Estrutura_Comercial]  WITH CHECK ADD  CONSTRAINT [FK_Hierarquia_Comercial_Filial] FOREIGN KEY([cd_Filial])
REFERENCES [dbo].[TB_Hierarquia_Parametro_Filial] ([cod_Filial])
GO
ALTER TABLE [dbo].[TB_Hierarquia_Transacional_Estrutura_Comercial] CHECK CONSTRAINT [FK_Hierarquia_Comercial_Filial]
GO
ALTER TABLE [dbo].[TB_Hierarquia_Transacional_Estrutura_Comercial]  WITH CHECK ADD  CONSTRAINT [FK_Hierarquia_Comercial_Pais] FOREIGN KEY([cd_Pais])
REFERENCES [dbo].[TB_Hierarquia_Parametro_Pais] ([cod_Pais])
GO
ALTER TABLE [dbo].[TB_Hierarquia_Transacional_Estrutura_Comercial] CHECK CONSTRAINT [FK_Hierarquia_Comercial_Pais]
GO
ALTER TABLE [dbo].[TB_Hierarquia_Transacional_Estrutura_Comercial]  WITH CHECK ADD  CONSTRAINT [FK_Hierarquia_Comercial_Regional] FOREIGN KEY([cd_Regional])
REFERENCES [dbo].[TB_Hierarquia_Parametro_Regional] ([cod_Regional])
GO
ALTER TABLE [dbo].[TB_Hierarquia_Transacional_Estrutura_Comercial] CHECK CONSTRAINT [FK_Hierarquia_Comercial_Regional]
GO
ALTER TABLE [dbo].[TB_Hierarquia_Transacional_Estrutura_Comercial]  WITH CHECK ADD  CONSTRAINT [FK_Hierarquia_Comercial_RTV] FOREIGN KEY([cod_RTV])
REFERENCES [dbo].[TB_Hierarquia_Parametro_RTV] ([cod_RTV])
GO
ALTER TABLE [dbo].[TB_Hierarquia_Transacional_Estrutura_Comercial] CHECK CONSTRAINT [FK_Hierarquia_Comercial_RTV]
GO
ALTER TABLE [dbo].[TB_Hierarquia_Transacional_Estrutura_Comercial]  WITH CHECK ADD  CONSTRAINT [FK_Hierarquia_Comercial_Unidade] FOREIGN KEY([cd_Unidade])
REFERENCES [dbo].[TB_Hierarquia_Parametro_Unidade] ([cod_Unidade])
GO
ALTER TABLE [dbo].[TB_Hierarquia_Transacional_Estrutura_Comercial] CHECK CONSTRAINT [FK_Hierarquia_Comercial_Unidade]
GO
ALTER TABLE [dbo].[TB_Hierarquia_Transacional_Estrutura_DTM]  WITH CHECK ADD  CONSTRAINT [FK_Hierarquia_DTM] FOREIGN KEY([cod_DTM])
REFERENCES [dbo].[TB_Hierarquia_Parametro_DTM] ([cod_DTM])
GO
ALTER TABLE [dbo].[TB_Hierarquia_Transacional_Estrutura_DTM] CHECK CONSTRAINT [FK_Hierarquia_DTM]
GO
ALTER TABLE [dbo].[TB_Hierarquia_Transacional_Estrutura_DTM]  WITH CHECK ADD  CONSTRAINT [FK_Hierarquia_Filial] FOREIGN KEY([cd_Filial])
REFERENCES [dbo].[TB_Hierarquia_Parametro_Filial] ([cod_Filial])
GO
ALTER TABLE [dbo].[TB_Hierarquia_Transacional_Estrutura_DTM] CHECK CONSTRAINT [FK_Hierarquia_Filial]
GO
ALTER TABLE [dbo].[TB_Hierarquia_Transacional_Estrutura_DTM]  WITH CHECK ADD  CONSTRAINT [FK_Hierarquia_Gerente_DTM] FOREIGN KEY([cd_Gerente_DTM])
REFERENCES [dbo].[TB_Hierarquia_Parametro_Gerente_DTM] ([cod_Gerente_DTM])
GO
ALTER TABLE [dbo].[TB_Hierarquia_Transacional_Estrutura_DTM] CHECK CONSTRAINT [FK_Hierarquia_Gerente_DTM]
GO
ALTER TABLE [dbo].[TB_Hierarquia_Transacional_Estrutura_DTM]  WITH CHECK ADD  CONSTRAINT [FK_Hierarquia_Pais] FOREIGN KEY([cd_Pais])
REFERENCES [dbo].[TB_Hierarquia_Parametro_Pais] ([cod_Pais])
GO
ALTER TABLE [dbo].[TB_Hierarquia_Transacional_Estrutura_DTM] CHECK CONSTRAINT [FK_Hierarquia_Pais]
GO
ALTER TABLE [dbo].[TB_Hierarquia_Transacional_Estrutura_DTM]  WITH CHECK ADD  CONSTRAINT [FK_Hierarquia_Regional] FOREIGN KEY([cd_Regional])
REFERENCES [dbo].[TB_Hierarquia_Parametro_Regional] ([cod_Regional])
GO
ALTER TABLE [dbo].[TB_Hierarquia_Transacional_Estrutura_DTM] CHECK CONSTRAINT [FK_Hierarquia_Regional]
GO
ALTER TABLE [dbo].[TB_Hierarquia_Transacional_Estrutura_DTM]  WITH CHECK ADD  CONSTRAINT [FK_Hierarquia_RTV] FOREIGN KEY([cod_RTV])
REFERENCES [dbo].[TB_Hierarquia_Parametro_RTV] ([cod_RTV])
GO
ALTER TABLE [dbo].[TB_Hierarquia_Transacional_Estrutura_DTM] CHECK CONSTRAINT [FK_Hierarquia_RTV]
GO
ALTER TABLE [dbo].[TB_Hierarquia_Transacional_Estrutura_DTM]  WITH CHECK ADD  CONSTRAINT [FK_Hierarquia_Unidade] FOREIGN KEY([cd_Unidade])
REFERENCES [dbo].[TB_Hierarquia_Parametro_Unidade] ([cod_Unidade])
GO
ALTER TABLE [dbo].[TB_Hierarquia_Transacional_Estrutura_DTM] CHECK CONSTRAINT [FK_Hierarquia_Unidade]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[79] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 4
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TB_Agroview_Parametros_Cliente"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 206
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_BDO_Agroview_Cliente'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_BDO_Agroview_Cliente'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[85] 4[5] 2[5] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[94] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 12
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "co"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 671
               Right = 318
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "safra"
            Begin Extent = 
               Top = 39
               Left = 777
               Bottom = 197
               Right = 945
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "regional"
            Begin Extent = 
               Top = 499
               Left = 644
               Bottom = 629
               Right = 825
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "filial"
            Begin Extent = 
               Top = 489
               Left = 371
               Bottom = 619
               Right = 552
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "grupo"
            Begin Extent = 
               Top = 236
               Left = 647
               Bottom = 332
               Right = 817
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cultura"
            Begin Extent = 
               Top = 102
               Left = 562
               Bottom = 232
               Right = 732
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "categoria"
            Begin Extent = 
               Top = 339
               Left = 699
               Bottom = 469
               Right = 937
            End
            DisplayFlags = 280
     ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_BDO_Consumo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'       TopColumn = 0
         End
         Begin Table = "CFOP"
            Begin Extent = 
               Top = 320
               Left = 374
               Bottom = 450
               Right = 544
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CFOPCanais"
            Begin Extent = 
               Top = 6
               Left = 990
               Bottom = 242
               Right = 1158
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "unidade"
            Begin Extent = 
               Top = 511
               Left = 915
               Bottom = 641
               Right = 1096
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_BDO_Consumo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_BDO_Consumo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[75] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 12
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TB_Agroview_Parametros_DistribuidorSyngenta"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 369
               Right = 297
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_BDO_DistribuidorSyngenta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_BDO_DistribuidorSyngenta'
GO
USE [master]
GO
ALTER DATABASE [DB_Synapse] SET  READ_WRITE 
GO
