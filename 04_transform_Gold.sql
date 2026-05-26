SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [gold].[usp_Load_BridgeRespondentLanguage] AS
BEGIN

    INSERT INTO gold.BridgeRespondentLanguage
    (
        ResponseId,
        LanguageKey
    )
    SELECT
        s.ResponseId,
        d.LanguageKey
    FROM silver.StackOverflowClean s
    CROSS APPLY STRING_SPLIT(s.LanguageHaveWorkedWith, ';') ss
    INNER JOIN gold.DimProgrammingLanguage d
        ON LTRIM(RTRIM(ss.value)) = d.LanguageName
    WHERE NOT EXISTS
    (
        SELECT 1
        FROM gold.BridgeRespondentLanguage b
        WHERE b.ResponseId = s.ResponseId
          AND b.LanguageKey = d.LanguageKey
    );

END;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [gold].[usp_Load_DimAIUsage] AS
BEGIN

    INSERT INTO gold.DimAIUsage
    (
        AIUsageType,
        AISent
    )
    SELECT DISTINCT
        AISelect,
        AISent
    FROM silver.StackOverflowClean s
    WHERE (AISelect IS NOT NULL
       OR AISent IS NOT NULL)
      AND NOT EXISTS
      (
          SELECT 1
          FROM gold.DimAIUsage d
          WHERE d.AIUsageType = s.AISelect
            AND d.AISent = s.AISent
      );

END;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [gold].[usp_Load_DimCountry] AS
BEGIN

    INSERT INTO gold.DimCountry (CountryName)
    SELECT DISTINCT
        Country
    FROM silver.StackOverflowClean s
    WHERE Country IS NOT NULL
      AND NOT EXISTS
      (
          SELECT 1
          FROM gold.DimCountry d
          WHERE d.CountryName = s.Country
      );

END;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [gold].[usp_Load_DimDatabaseTechnology] AS
BEGIN

    INSERT INTO gold.DimDatabaseTechnology (DatabaseName)
    SELECT DISTINCT
        LTRIM(RTRIM(value))
    FROM silver.StackOverflowClean
    CROSS APPLY STRING_SPLIT(DatabaseHaveWorkedWith, ';')
    WHERE value IS NOT NULL
      AND NOT EXISTS
      (
          SELECT 1
          FROM gold.DimDatabaseTechnology d
          WHERE d.DatabaseName = LTRIM(RTRIM(value))
      );

END;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [gold].[usp_Load_DimEducation] AS
BEGIN

    INSERT INTO gold.DimEducation (EducationLevel)
    SELECT DISTINCT
        EdLevel
    WHERE EdLevel IS NOT NULL
      AND NOT EXISTS
      (
          SELECT 1
          FROM gold.DimEducation d
          WHERE d.EducationLevel = s.EdLevel
      );

END;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [gold].[usp_Load_DimEmployment] AS
BEGIN

    INSERT INTO gold.DimEmployment (EmploymentType)
    SELECT DISTINCT
        Employment
    FROM silver.StackOverflowClean s
    WHERE Employment IS NOT NULL
      AND NOT EXISTS
      (
          SELECT 1
          FROM gold.DimEmployment d
          WHERE d.EmploymentType = s.Employment
      );

END;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [gold].[usp_Load_DimPlatform] AS
BEGIN

    INSERT INTO gold.DimPlatform (PlatformName)
    SELECT DISTINCT
        LTRIM(RTRIM(value))
    FROM silver.StackOverflowClean
    CROSS APPLY STRING_SPLIT(PlatformHaveWorkedWith, ';')
    WHERE value IS NOT NULL
      AND NOT EXISTS
      (
          SELECT 1
          FROM gold.DimPlatform d
          WHERE d.PlatformName = LTRIM(RTRIM(value))
      );

END;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [gold].[usp_Load_DimProgrammingLanguage] AS
BEGIN

    INSERT INTO gold.DimProgrammingLanguage (LanguageName)
    SELECT DISTINCT
        LTRIM(RTRIM(value))
    FROM silver.StackOverflowClean
    CROSS APPLY STRING_SPLIT(LanguageHaveWorkedWith, ';')
    WHERE value IS NOT NULL
      AND NOT EXISTS
      (
          SELECT 1
          FROM gold.DimProgrammingLanguage d
          WHERE d.LanguageName = LTRIM(RTRIM(value))
      );

END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [gold].[usp_Load_DimRemoteWork] AS
BEGIN

    INSERT INTO gold.DimRemoteWork (RemoteWorkType)
    SELECT DISTINCT
        RemoteWork
    FROM silver.StackOverflowClean s
    WHERE RemoteWork IS NOT NULL
      AND NOT EXISTS
      (
          SELECT 1
          FROM gold.DimRemoteWork d
          WHERE d.RemoteWorkType = s.RemoteWork
      );

END;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [gold].[usp_Load_FactDeveloperSurvey] AS
BEGIN

    INSERT INTO gold.FactDeveloperSurvey
    (
        ResponseId,
        CountryKey,
        EmploymentKey,
        EducationKey,
        RemoteWorkKey,
        AIUsageKey,
        YearsCode,
       -- YearsCodePro,
        AnnualSalaryUSD,
        TotalCompensation,
        SurveyYear,
        RecordCreatedDate
    )
    SELECT

        s.ResponseId,

        c.CountryKey,
        e.EmploymentKey,
        ed.EducationKey,
        rw.RemoteWorkKey,
        ai.AIUsageKey,

        TRY_CAST(s.YearsCode AS FLOAT),
       -- TRY_CAST(s.YearsCodePro AS FLOAT),

        s.ConvertedCompYearly,
        s.CompTotal,

        2025,
        GETDATE()

    FROM silver.StackOverflowClean s

    LEFT JOIN gold.DimCountry c
        ON s.Country = c.CountryName

    LEFT JOIN gold.DimEmployment e
        ON s.Employment = e.EmploymentType

    LEFT JOIN gold.DimEducation ed
        ON s.EdLevel = ed.EducationLevel

    LEFT JOIN gold.DimRemoteWork rw
        ON s.RemoteWork = rw.RemoteWorkType

    LEFT JOIN gold.DimAIUsage ai
        ON s.AISelect = ai.AIUsageType
       AND s.AISent = ai.AISent

    WHERE NOT EXISTS
    (
        SELECT 1
        FROM gold.FactDeveloperSurvey f
        WHERE f.ResponseId = s.ResponseId
    );

END;
GO