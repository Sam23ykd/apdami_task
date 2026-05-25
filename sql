SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [bronze].[StackOverflowSurvey]
( 
	[ResponseId] [float]  NULL,
	[MainBranch] [nvarchar](max)  NULL,
	[Age] [nvarchar](max)  NULL,
	[EdLevel] [nvarchar](max)  NULL,
	[Employment] [nvarchar](max)  NULL,
	[EmploymentAddl] [nvarchar](max)  NULL,
	[WorkExp] [float]  NULL,
	[LearnCodeChoose] [nvarchar](max)  NULL,
	[LearnCode] [nvarchar](max)  NULL,
	[LearnCodeAI] [nvarchar](max)  NULL,
	[AILearnHow] [nvarchar](max)  NULL,
	[YearsCode] [float]  NULL,
	[DevType] [nvarchar](max)  NULL,
	[OrgSize] [nvarchar](max)  NULL,
	[ICorPM] [nvarchar](max)  NULL,
	[RemoteWork] [nvarchar](max)  NULL,
	[PurchaseInfluence] [nvarchar](max)  NULL,
	[TechEndorseIntro] [nvarchar](max)  NULL,
	[TechEndorse_1] [nvarchar](max)  NULL,
	[TechEndorse_2] [nvarchar](max)  NULL,
	[TechEndorse_3] [nvarchar](max)  NULL,
	[TechEndorse_4] [nvarchar](max)  NULL,
	[TechEndorse_5] [nvarchar](max)  NULL,
	[TechEndorse_6] [nvarchar](max)  NULL,
	[TechEndorse_7] [nvarchar](max)  NULL,
	[TechEndorse_8] [nvarchar](max)  NULL,
	[TechEndorse_9] [nvarchar](max)  NULL,
	[TechEndorse_13] [nvarchar](max)  NULL,
	[TechEndorse_13_TEXT] [nvarchar](max)  NULL,
	[TechOppose_1] [nvarchar](max)  NULL,
	[TechOppose_2] [nvarchar](max)  NULL,
	[TechOppose_3] [nvarchar](max)  NULL,
	[TechOppose_5] [nvarchar](max)  NULL,
	[TechOppose_7] [nvarchar](max)  NULL,
	[TechOppose_9] [nvarchar](max)  NULL,
	[TechOppose_11] [float]  NULL,
	[TechOppose_13] [float]  NULL,
	[TechOppose_16] [float]  NULL,
	[TechOppose_15] [float]  NULL,
	[TechOppose_15_TEXT] [nvarchar](max)  NULL,
	[Industry] [nvarchar](max)  NULL,
	[JobSatPoints_1] [float]  NULL,
	[JobSatPoints_2] [float]  NULL,
	[JobSatPoints_3] [float]  NULL,
	[JobSatPoints_4] [float]  NULL,
	[JobSatPoints_5] [float]  NULL,
	[JobSatPoints_6] [float]  NULL,
	[JobSatPoints_7] [float]  NULL,
	[JobSatPoints_8] [float]  NULL,
	[JobSatPoints_9] [float]  NULL,
	[JobSatPoints_10] [float]  NULL,
	[JobSatPoints_11] [float]  NULL,
	[JobSatPoints_13] [float]  NULL,
	[JobSatPoints_14] [float]  NULL,
	[JobSatPoints_15] [float]  NULL,
	[JobSatPoints_16] [float]  NULL,
	[JobSatPoints_15_TEXT] [nvarchar](max)  NULL,
	[AIThreat] [nvarchar](max)  NULL,
	[NewRole] [nvarchar](max)  NULL,
	[ToolCountWork] [float]  NULL,
	[ToolCountPersonal] [float]  NULL,
	[Country] [nvarchar](max)  NULL,
	[Currency] [nvarchar](max)  NULL,
	[CompTotal] [float]  NULL,
	[LanguageChoice] [nvarchar](max)  NULL,
	[LanguageHaveWorkedWith] [nvarchar](max)  NULL,
	[LanguageWantToWorkWith] [nvarchar](max)  NULL,
	[LanguageAdmired] [nvarchar](max)  NULL,
	[LanguagesHaveEntry] [nvarchar](max)  NULL,
	[LanguagesWantEntry] [nvarchar](max)  NULL,
	[DatabaseChoice] [nvarchar](max)  NULL,
	[DatabaseHaveWorkedWith] [nvarchar](max)  NULL,
	[DatabaseWantToWorkWith] [nvarchar](max)  NULL,
	[DatabaseAdmired] [nvarchar](max)  NULL,
	[DatabaseHaveEntry] [nvarchar](max)  NULL,
	[DatabaseWantEntry] [nvarchar](max)  NULL,
	[PlatformChoice] [nvarchar](max)  NULL,
	[PlatformHaveWorkedWith] [nvarchar](max)  NULL,
	[PlatformWantToWorkWith] [nvarchar](max)  NULL,
	[PlatformAdmired] [nvarchar](max)  NULL,
	[PlatformHaveEntry] [nvarchar](max)  NULL,
	[PlatformWantEntry] [nvarchar](max)  NULL,
	[WebframeChoice] [nvarchar](max)  NULL,
	[WebframeHaveWorkedWith] [nvarchar](max)  NULL,
	[WebframeWantToWorkWith] [nvarchar](max)  NULL,
	[WebframeAdmired] [nvarchar](max)  NULL,
	[WebframeHaveEntry] [nvarchar](max)  NULL,
	[WebframeWantEntry] [nvarchar](max)  NULL,
	[DevEnvsChoice] [nvarchar](max)  NULL,
	[DevEnvsHaveWorkedWith] [nvarchar](max)  NULL,
	[DevEnvsWantToWorkWith] [nvarchar](max)  NULL,
	[DevEnvsAdmired] [nvarchar](max)  NULL,
	[DevEnvHaveEntry] [nvarchar](max)  NULL,
	[DevEnvWantEntry] [nvarchar](max)  NULL,
	[SOTagsHaveWorkedWith] [nvarchar](max)  NULL,
	[SOTagsWantToWorkWith] [nvarchar](max)  NULL,
	[SOTagsAdmired] [nvarchar](max)  NULL,
	[SOTagsHaveEntry] [nvarchar](max)  NULL,
	[SOTagsWant_Entry] [nvarchar](max)  NULL,
	[OpSysPersonal_use] [nvarchar](max)  NULL,
	[OpSysProfessional_use] [nvarchar](max)  NULL,
	[OfficeStackAsyncHaveWorkedWith] [nvarchar](max)  NULL,
	[OfficeStackAsyncWantToWorkWith] [nvarchar](max)  NULL,
	[OfficeStackAsyncAdmired] [nvarchar](max)  NULL,
	[OfficeStackHaveEntry] [nvarchar](max)  NULL,
	[OfficeStackWantEntry] [nvarchar](max)  NULL,
	[CommPlatformHaveWorkedWith] [nvarchar](max)  NULL,
	[CommPlatformWantToWorkWith] [nvarchar](max)  NULL,
	[CommPlatformAdmired] [nvarchar](max)  NULL,
	[CommPlatformHaveEntr] [nvarchar](max)  NULL,
	[CommPlatformWantEntr] [nvarchar](max)  NULL,
	[AIModelsChoice] [nvarchar](max)  NULL,
	[AIModelsHaveWorkedWith] [nvarchar](max)  NULL,
	[AIModelsWantToWorkWith] [nvarchar](max)  NULL,
	[AIModelsAdmired] [nvarchar](max)  NULL,
	[AIModelsHaveEntry] [nvarchar](max)  NULL,
	[AIModelsWantEntry] [nvarchar](max)  NULL,
	[SOAccount] [nvarchar](max)  NULL,
	[SOVisitFreq] [nvarchar](max)  NULL,
	[SODuration] [nvarchar](max)  NULL,
	[SOPartFreq] [nvarchar](max)  NULL,
	[SO_Dev_Content] [nvarchar](max)  NULL,
	[SO_Actions_1] [float]  NULL,
	[SO_Actions_16] [float]  NULL,
	[SO_Actions_3] [float]  NULL,
	[SO_Actions_4] [float]  NULL,
	[SO_Actions_5] [float]  NULL,
	[SO_Actions_6] [float]  NULL,
	[SO_Actions_9] [float]  NULL,
	[SO_Actions_7] [float]  NULL,
	[SO_Actions_10] [float]  NULL,
	[SO_Actions_15] [float]  NULL,
	[SO_Actions_15_TEXT] [nvarchar](max)  NULL,
	[SOComm] [nvarchar](max)  NULL,
	[SOFriction] [nvarchar](max)  NULL,
	[AISelect] [nvarchar](max)  NULL,
	[AISent] [nvarchar](max)  NULL,
	[AIAcc] [nvarchar](max)  NULL,
	[AIComplex] [nvarchar](max)  NULL,
	[AIToolCurrently_partially_AI] [nvarchar](max)  NULL,
	[AIToolDon_t_plan_to_use_AI_for_this_task] [nvarchar](max)  NULL,
	[AIToolPlan_to_partially_use_AI] [nvarchar](max)  NULL,
	[AIToolPlan_to_mostly_use_AI] [nvarchar](max)  NULL,
	[AIToolCurrently_mostly_AI] [nvarchar](max)  NULL,
	[AIFrustration] [nvarchar](max)  NULL,
	[AIExplain] [nvarchar](max)  NULL,
	[AIAgents] [nvarchar](max)  NULL,
	[AIAgentChange] [nvarchar](max)  NULL,
	[AIAgent_Uses] [nvarchar](max)  NULL,
	[AgentUsesGeneral] [nvarchar](max)  NULL,
	[AIAgentImpactSomewhat_agree] [nvarchar](max)  NULL,
	[AIAgentImpactNeutral] [nvarchar](max)  NULL,
	[AIAgentImpactSomewhat_disagree] [nvarchar](max)  NULL,
	[AIAgentImpactStrongly_agree] [nvarchar](max)  NULL,
	[AIAgentImpactStrongly_disagree] [nvarchar](max)  NULL,
	[AIAgentChallengesNeutral] [nvarchar](max)  NULL,
	[AIAgentChallengesSomewhat_disagree] [nvarchar](max)  NULL,
	[AIAgentChallengesStrongly_agree] [nvarchar](max)  NULL,
	[AIAgentChallengesSomewhat_agree] [nvarchar](max)  NULL,
	[AIAgentChallengesStrongly_disagree] [nvarchar](max)  NULL,
	[AIAgentKnowledge] [nvarchar](max)  NULL,
	[AIAgentKnowWrite] [nvarchar](max)  NULL,
	[AIAgentOrchestration] [nvarchar](max)  NULL,
	[AIAgentOrchWrite] [nvarchar](max)  NULL,
	[AIAgentObserveSecure] [nvarchar](max)  NULL,
	[AIAgentObsWrite] [nvarchar](max)  NULL,
	[AIAgentExternal] [nvarchar](max)  NULL,
	[AIAgentExtWrite] [nvarchar](max)  NULL,
	[AIHuman] [nvarchar](max)  NULL,
	[AIOpen] [nvarchar](max)  NULL,
	[ConvertedCompYearly] [float]  NULL,
	[JobSat] [float]  NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [silver].[StackOverflowClean]
( 
	[ResponseId] [int]  NULL,
	[MainBranch] [varchar](255)  NULL,
	[Age] [varchar](100)  NULL,
	[Employment] [varchar](1000)  NULL,
	[RemoteWork] [varchar](255)  NULL,
	[EdLevel] [varchar](1000)  NULL,
	[YearsCode] [varchar](50)  NULL,
	[DevType] [varchar](2000)  NULL,
	[Country] [varchar](255)  NULL,
	[Currency] [varchar](100)  NULL,
	[CompTotal] [float]  NULL,
	[ConvertedCompYearly] [float]  NULL,
	[LanguageHaveWorkedWith] [varchar](4000)  NULL,
	[DatabaseHaveWorkedWith] [varchar](4000)  NULL,
	[PlatformHaveWorkedWith] [varchar](4000)  NULL,
	[WebframeHaveWorkedWith] [varchar](4000)  NULL,
	[AISelect] [varchar](255)  NULL,
	[AISent] [varchar](255)  NULL,
	[JobSat] [varchar](255)  NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [gold].[BridgeRespondentLanguage]
( 
	[ResponseId] [bigint]  NOT NULL,
	[LanguageKey] [int]  NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [ResponseId] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [gold].[DimAIUsage]
( 
	[AIUsageKey] [int]  NOT NULL,
	[AIUsageType] [varchar](255)  NULL,
	[AISent] [varchar](255)  NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	HEAP
)
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [gold].[DimCountry]
( 
	[CountryKey] [int]  NOT NULL,
	[CountryName] [varchar](255)  NOT NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	HEAP
)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [gold].[DimDatabaseTechnology]
( 
	[DatabaseKey] [int]  NOT NULL,
	[DatabaseName] [varchar](255)  NOT NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	HEAP
)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [gold].[DimEducation]
( 
	[EducationKey] [int]  NOT NULL,
	[EducationLevel] [varchar](1000)  NOT NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	HEAP
)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [gold].[DimEmployment]
( 
	[EmploymentKey] [int]  NOT NULL,
	[EmploymentType] [varchar](1000)  NOT NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	HEAP
)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [gold].[DimPlatform]
( 
	[PlatformKey] [int]  NOT NULL,
	[PlatformName] [varchar](255)  NOT NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	HEAP
)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [gold].[DimProgrammingLanguage]
( 
	[LanguageKey] [int]  NOT NULL,
	[LanguageName] [varchar](255)  NOT NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	HEAP
)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [gold].[DimRemoteWork]
( 
	[RemoteWorkKey] [int]  NOT NULL,
	[RemoteWorkType] [varchar](255)  NOT NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	HEAP
)
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [gold].[FactDeveloperSurvey]
( 
	[SurveyFactKey] [bigint]  NOT NULL,
	[ResponseId] [int]  NOT NULL,
	[CountryKey] [int]  NULL,
	[EmploymentKey] [int]  NULL,
	[EducationKey] [int]  NULL,
	[RemoteWorkKey] [int]  NULL,
	[AIUsageKey] [int]  NULL,
	[YearsCode] [float]  NULL,
	[YearsCodePro] [float]  NULL,
	[AnnualSalaryUSD] [float]  NULL,
	[TotalCompensation] [float]  NULL,
	[SurveyYear] [int]  NULL,
	[RecordCreatedDate] [datetime2](7)  NULL,
	[YearsCodeProNumeric] [int]  NULL
)
WITH
(
	DISTRIBUTION = HASH ( [ResponseId] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
