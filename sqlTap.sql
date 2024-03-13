-- Find person's detials Like Name,employee code ,mail ,phone ?

select
    person.FIRST_NAME_TXT,LAST_NAME_TXT,email.EMAIL_ID_TXT,phone.PHONE_NUMBER_TXT
from t_prn_eu_person person
join t_prn_eu_person_email email
    on person.PERSON_PK_ID=email.PERSON_DEP_FK_ID
    join t_prn_eu_person_phone phone
on email.PERSON_DEP_FK_ID=phone.PERSON_DEP_FK_ID
where person.IS_DELETED=false and person.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and person.RECORD_STATE_CODE_FK_ID='CURRENT' and email.IS_DELETED=false and email.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and email.RECORD_STATE_CODE_FK_ID='CURRENT'
and phone.IS_DELETED=false and phone.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and phone.RECORD_STATE_CODE_FK_ID='CURRENT';

-- Find person primary position ?

select
    person.FIRST_NAME_TXT,person.LAST_NAME_TXT,position.POSITION_NAME_G11N_BIG_TXT
from t_prn_eu_person person
join t_prn_eu_person_job_assignment_dates job
on person.PERSON_PK_ID=job.PERSON_FK_ID
join t_org_adm_org_job_pay_grd_posn position
on job.ORG_JOB_PAY_GRADE_POSITION_MAP_FK_ID=position.ORG_JOB_PAY_GRD_POSTN_PK_ID
where person.IS_DELETED=false and person.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and person.RECORD_STATE_CODE_FK_ID='CURRENT' and job.IS_DELETED=false and job.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and job.RECORD_STATE_CODE_FK_ID='CURRENT'
and position.IS_DELETED=false and position.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and position.RECORD_STATE_CODE_FK_ID='CURRENT'
AND job.IS_PRIMARY=true;

-- Find person is seconded?

select
    person.LEGAL_FULL_NAME_G11N_BIG_TXT as name,POSITION_NAME_G11N_BIG_TXT as posn_name
from t_prn_eu_person person
join t_prn_eu_person_job_assignment_dates job
on person.PERSON_PK_ID=job.PERSON_FK_ID
join t_org_adm_org_job_pay_grd_posn position
on job.ORG_JOB_PAY_GRADE_POSITION_MAP_FK_ID=position.ORG_JOB_PAY_GRD_POSTN_PK_ID
where person.IS_DELETED=false and person.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and person.RECORD_STATE_CODE_FK_ID='CURRENT' and job.IS_DELETED=false and job.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and job.RECORD_STATE_CODE_FK_ID='CURRENT'
and position.IS_DELETED=false and position.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and position.RECORD_STATE_CODE_FK_ID='CURRENT'
and job.ACTUAL_ASSIGNMENT_END_DATETIME is null group by person.PERSON_PK_ID having count(person.PERSON_PK_ID)>1;

-- Find person all position?

select
    person.FIRST_NAME_TXT,person.LAST_NAME_TXT,position.POSITION_NAME_G11N_BIG_TXT
from t_prn_eu_person person
join t_prn_eu_person_job_assignment_dates job
on person.PERSON_PK_ID=job.PERSON_FK_ID
join t_org_adm_org_job_pay_grd_posn position
on job.ORG_JOB_PAY_GRADE_POSITION_MAP_FK_ID=position.ORG_JOB_PAY_GRD_POSTN_PK_ID
where person.IS_DELETED=false and person.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and person.RECORD_STATE_CODE_FK_ID='CURRENT' and job.IS_DELETED=false and job.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and job.RECORD_STATE_CODE_FK_ID='CURRENT'
and position.IS_DELETED=false and position.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and position.RECORD_STATE_CODE_FK_ID='CURRENT';

-- Find person direct manager?

select
    person.FIRST_NAME_TXT, relperson.FIRST_NAME_TXT,relation.RELATIONSHIP_TYPE_CODE_DEP_FK_ID
from t_prn_eu_person person
join t_prn_eu_person_job_relationship relation
on person.PERSON_PK_ID=relation.SUBJECT_PERSON_FK_ID
join t_prn_eu_person relperson
on relperson.PERSON_PK_ID=relation.RELATED_PERSON_FK_ID and relation.RELATIONSHIP_TYPE_CODE_DEP_FK_ID='DIRECT_MANAGER'
where person.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and person.IS_DELETED=false and person.RECORD_STATE_CODE_FK_ID='CURRENT' and
      relation.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and relation.IS_DELETED=false and relation.RECORD_STATE_CODE_FK_ID='CURRENT';

-- Find a person primary HR manager?

select
    person.FIRST_NAME_TXT, relperson.FIRST_NAME_TXT,relation.RELATIONSHIP_TYPE_CODE_DEP_FK_ID
from t_prn_eu_person person
join t_prn_eu_person_job_relationship relation
on person.PERSON_PK_ID=relation.SUBJECT_PERSON_FK_ID
join t_prn_eu_person relperson
on relperson.PERSON_PK_ID=relation.RELATED_PERSON_FK_ID and relation.RELATIONSHIP_TYPE_CODE_DEP_FK_ID='PRIMARY_HR_MANAGER'
where person.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and person.IS_DELETED=false and person.RECORD_STATE_CODE_FK_ID='CURRENT' and
      relation.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and relation.IS_DELETED=false and relation.RECORD_STATE_CODE_FK_ID='CURRENT';

-- Find a person  secondary HR manager?

select
    person.FIRST_NAME_TXT, relperson.FIRST_NAME_TXT,relation.RELATIONSHIP_TYPE_CODE_DEP_FK_ID
from t_prn_eu_person person
join t_prn_eu_person_job_relationship relation
on person.PERSON_PK_ID=relation.SUBJECT_PERSON_FK_ID
join t_prn_eu_person relperson
on relperson.PERSON_PK_ID=relation.RELATED_PERSON_FK_ID and relation.RELATIONSHIP_TYPE_CODE_DEP_FK_ID='SECONDARY_HR_MANAGER'
where person.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and person.IS_DELETED=false and person.RECORD_STATE_CODE_FK_ID='CURRENT' and
      relation.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and relation.IS_DELETED=false and relation.RECORD_STATE_CODE_FK_ID='CURRENT';

-- Find person compensation?

SELECT
    PERSON.FIRST_NAME_TXT,PERSON.LAST_NAME_TXT,COMPENSATION.TOTAL_COMPENSATION
FROM t_prn_eu_person PERSON
JOIN t_prn_eu_person_job_assignment ASSIGNMENT
ON PERSON.PERSON_PK_ID=ASSIGNMENT.PERSON_DEP_FK_ID
JOIN t_prn_adm_compensation COMPENSATION
ON ASSIGNMENT.PERSON_JOB_ASSIGNMENT_PK_ID=COMPENSATION.PERSON_JOB_ASSIGNMENT_DEP_FK_ID
WHERE person.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and person.IS_DELETED=false and person.RECORD_STATE_CODE_FK_ID='CURRENT' and
      ASSIGNMENT.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and ASSIGNMENT.IS_DELETED=false and ASSIGNMENT.RECORD_STATE_CODE_FK_ID='CURRENT'
AND COMPENSATION.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and COMPENSATION.IS_DELETED=false and COMPENSATION.RECORD_STATE_CODE_FK_ID='CURRENT';

-- Find person all roles?

select
    person.FIRST_NAME_TXT,person.LAST_NAME_TXT,paygradepos.JOB_ROLE_NAME_G11N_BIG_TXT
from t_prn_eu_person person
join t_prn_eu_person_job_assignment_dates assignmentdates
on person.PERSON_PK_ID=assignmentdates.PERSON_FK_ID
join t_org_adm_org_job_pay_grd_posn paygradepos
on assignmentdates.ORG_JOB_PAY_GRADE_POSITION_MAP_FK_ID=paygradepos.ORG_JOB_PAY_GRD_POSTN_PK_ID
WHERE person.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and person.IS_DELETED=false and person.RECORD_STATE_CODE_FK_ID='CURRENT' and
      assignmentdates.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and assignmentdates.IS_DELETED=false and assignmentdates.RECORD_STATE_CODE_FK_ID='CURRENT'
AND paygradepos.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and paygradepos.IS_DELETED=false and paygradepos.RECORD_STATE_CODE_FK_ID='CURRENT';

-- find person all group?

select
    person.FIRST_NAME_TXT,person.LAST_NAME_TXT,groupp.NAME_G11N_BIG_TXT
from t_prn_eu_person person
join t_prn_eu_person_job_assignment_dates assignmentdates
on person.PERSON_PK_ID=assignmentdates.PERSON_FK_ID
join t_org_adm_org_job_pay_grd_posn paygradepos
on assignmentdates.ORG_JOB_PAY_GRADE_POSITION_MAP_FK_ID=paygradepos.ORG_JOB_PAY_GRD_POSTN_PK_ID
join t_perm_adm_group_position_member positionmember
on paygradepos.ORG_JOB_PAY_GRD_POSTN_PK_ID=positionmember.POSITION_FK_ID
join t_perm_adm_group groupp
on groupp.GROUP_PK_ID=positionmember.GROUP_FK_ID
WHERE person.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and person.IS_DELETED=false and person.RECORD_STATE_CODE_FK_ID='CURRENT'
and assignmentdates.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and assignmentdates.IS_DELETED=false and assignmentdates.RECORD_STATE_CODE_FK_ID='CURRENT'
AND paygradepos.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and paygradepos.IS_DELETED=false and paygradepos.RECORD_STATE_CODE_FK_ID='CURRENT'
AND positionmember.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and positionmember.IS_DELETED=false and positionmember.RECORD_STATE_CODE_FK_ID='CURRENT'
AND groupp.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and groupp.IS_DELETED=false and groupp.RECORD_STATE_CODE_FK_ID='CURRENT';
