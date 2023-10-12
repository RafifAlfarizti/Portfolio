/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [TransID]
      ,[ItemID]
      ,[Quantity]
  FROM [eCommerse].[dbo].[DetailSell]