/* Увеличить тариф руководителей и проектировщиков на 5 процентов */

UPDATE  tblEmployee
	SET HourlyRate = HourlyRate * 1.05
WHERE  (IDJob in (SELECT IDJob FROM tblJob WHERE Job='Проектировщик' Or Chief=1))        