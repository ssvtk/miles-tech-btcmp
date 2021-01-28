SELECT (CASE WHEN [level] = 1) THEN ‘Newbie’ WHEN [level] > 1 AND [level] < 10 THEN ‘Apprentice’ ELSE ‘Jorneyman’ END) as class_title, * [FROM GuestClass]
