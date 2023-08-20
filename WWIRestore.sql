RESTORE DATABASE [WideWorldImporters]
FROM DISK = N'REPLACE_ME\WideWorldImporters-Full.bak'
WITH REPLACE,
    MOVE 'WWI_Primary' TO 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\WideWorldImporters.mdf',
    MOVE 'WWI_UserData' TO 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\WideWorldImporters_UserData.ndf',
    MOVE 'WWI_InMemory_Data_1' TO 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\WWI_InMemory_Data_1',
    MOVE 'WWI_log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\WideWorldImporters.ldf'
GO
