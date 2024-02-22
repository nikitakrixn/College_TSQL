DECLARE @sPeriod  datetime
DECLARE @ePeriod  datetime

set @sPeriod = CONVERT(datetime,'01.01.2018',104)
set @ePeriod = CONVERT(datetime,'07.03.2018',104)

DELETE FROM tblProjectWorking
WHERE Period BETWEEN @sPeriod AND @ePeriod