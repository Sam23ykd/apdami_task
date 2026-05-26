SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [silver].[usp_Load_StackOverflowClean] AS
BEGIN
INSERT INTO silver.StackOverflowClean (ResponseId ,
    MainBranch  ,
    Age   ,
    Employment ,
    RemoteWork ,
    EdLevel ,
    YearsCode ,
   -- YearsCodePro ,
    DevType ,
    Country ,
    Currency ,
    CompTotal ,
    ConvertedCompYearly ,
    LanguageHaveWorkedWith ,
    DatabaseHaveWorkedWith ,
    PlatformHaveWorkedWith ,
    WebframeHaveWorkedWith ,
    AISelect ,
    AISent ,
    JobSat )
    SELECT DISTINCT
        ResponseId ,
    MainBranch  ,
    Age   ,
    Employment ,
    RemoteWork ,
    EdLevel ,
    YearsCode ,
   -- YearsCodePro ,
    DevType ,
    Country ,
    Currency ,
    CompTotal ,
    ConvertedCompYearly ,
    LanguageHaveWorkedWith ,
    DatabaseHaveWorkedWith ,
    PlatformHaveWorkedWith ,
    WebframeHaveWorkedWith ,
    AISelect ,
    AISent ,
    JobSat
    FROM bronze.StackOverflowSurvey s
    WHERE ResponseId IS NOT NULL
     

END;
GO
