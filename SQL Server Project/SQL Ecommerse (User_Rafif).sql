/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ItemName]
      ,[Price]
      ,[Quantity]
  FROM [eCommerse].[dbo].[Item]