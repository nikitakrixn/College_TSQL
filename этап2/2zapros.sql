DECLARE @sPeriod  datetime
DECLARE @ePeriod  datetime

set @sPeriod = CONVERT(datetime,'01.04.2018',104)
set @ePeriod = CONVERT(datetime,'30.04.2018',104)

Insert Into dbo.�������_������([���_�������], [��������])
SELECT [���_�������],[��������]
FROM dbo.�������
Where ([���_�������] IN (SELECT [������] from dbo.������ Where [����] BETWEEN @sPeriod AND @ePeriod))
