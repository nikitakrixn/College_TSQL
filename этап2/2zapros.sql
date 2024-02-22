DECLARE @sPeriod  datetime
DECLARE @ePeriod  datetime

set @sPeriod = CONVERT(datetime,'01.04.2018',104)
set @ePeriod = CONVERT(datetime,'30.04.2018',104)

Insert Into dbo.Клиенты_месяца([Код_клиента], [название])
SELECT [Код_клиента],[название]
FROM dbo.клиенты
Where ([Код_клиента] IN (SELECT [клиент] from dbo.заказы Where [дата] BETWEEN @sPeriod AND @ePeriod))
