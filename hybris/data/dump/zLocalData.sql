SET GLOBAL innodb_flush_log_at_trx_commit=0;

update users set createdts=now();

update cronjobs set p_active = false where p_active=true;

UPDATE medias
join mediafolders on mediafolders.pk = medias.p_folder
SET medias.p_location = REPLACE(medias.p_location,'sys-master/',''), medias.p_locationhash='-'
where medias.p_location like 'sys-master/%' and mediafolders.p_qualifier = 'images';
