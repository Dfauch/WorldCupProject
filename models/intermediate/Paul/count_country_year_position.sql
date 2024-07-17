SELECT 
pyc.date_team,
pyc.position,
pcy.count_A,
pcy.count_M,
pcy.count_D,
pcy.count_G,



 FROM `theworldcupproject.raw_dataset.position_country` AS pyc
JOIN `theworldcupproject.raw_dataset.count_country` AS pcy
ON pcy.year_country_id=pyc.date_team