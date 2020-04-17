DROP VIEW `bsurvey`.`help_seeker`;
CREATE
    /*[ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]
    [DEFINER = { user | CURRENT_USER }]
    [SQL SECURITY { DEFINER | INVOKER }]*/
    VIEW `bsurvey`.`help_seeker` 
    AS
(SELECT a.id,a.name,a.mobile_number,a.address,a.is_app_data,b.district_id,b.thana_code
FROM icmr_user_details a LEFT JOIN address_code b ON a.fk_address_code = b.id
WHERE (SELECT IF(COUNT(*) > 0, TRUE, FALSE) FROM help_details_new WHERE help_details_new.help_seeker_giver = 'SEEKER' AND help_details_new.fk_icmr_user_details = a.id));

