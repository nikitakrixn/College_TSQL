Alter Table Student
DROP CONSTRAINT check_dDate
GO
Alter Table Student
ADD CONSTRAINT check_newDate CHECK (DateTo>=DateFrom)
GO