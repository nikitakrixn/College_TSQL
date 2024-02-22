/* ”далить зарплату сотрудникам, у которых нет информации о работе за текущий мес€ц */
                     
DELETE FROM tblSalary
WHERE     (IDEmployee IN (SELECT        IDEmployee
FROM            dbo.tblEmployee
WHERE        (IDEmployee NOT IN
                             (SELECT DISTINCT IDEmployee
                               FROM            dbo.tblProjectWorking)))
) and Period = CONVERT(datetime,'2018-02-02',104)    