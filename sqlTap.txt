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
    person.FIRST_NAME_TXT,person.LAST_NAME_TXT,position.POSITION_NAME_G11N_BIG_TXT
from t_prn_eu_person person
join t_prn_eu_person_job_assignment_dates job
on person.PERSON_PK_ID=job.PERSON_FK_ID
join t_org_adm_org_job_pay_grd_posn position
on job.ORG_JOB_PAY_GRADE_POSITION_MAP_FK_ID=position.ORG_JOB_PAY_GRD_POSTN_PK_ID
where person.IS_DELETED=false and person.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and person.RECORD_STATE_CODE_FK_ID='CURRENT' and job.IS_DELETED=false and job.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and job.RECORD_STATE_CODE_FK_ID='CURRENT'
and position.IS_DELETED=false and position.ACTIVE_STATE_CODE_FK_ID='ACTIVE' and position.RECORD_STATE_CODE_FK_ID='CURRENT'
AND job.IS_PRIMARY=false;

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
select * from t_jdm_adm_org_job_description_manager;
describe t_prn_eu_person;
describe t_org_adm_org_job_pay_grd_posn;

describe t_prn_eu_person_job_assignment_dates;
select * from t_prn_eu_person_job_relationship;
describe t_prn_eu_person_job_relationship;

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

select JOB_ROLE_NAME_G11N_BIG_TXT from t_job_adm_job_role;
describe t_job_adm_job_role;


describe t_job_adm_job_family;
describe t_job_adm_work_schedule_map;
select * from t_prn_eu_person_job_assignment;
select * from t_prn_eu_person_job_relationship;
describe t_job_adm_work_schedule_map;



-- JOB_ROLE_NAME_G11N_BIG_TXT
describe t_prn_eu_person;-- PERSON_PK_ID,PRN_TXN_FK_ID,NAME_PREFIX_FK_ID,NAME_SUFFIX_FK_ID
describe t_prn_eu_person_job_assignment;-- PERSON_PK_ID=PERSON_DEP_FK_ID
describe t_prn_adm_compensation;-- PERSON_JOB_ASSIGNMENT_PK_ID=PERSON_JOB_ASSIGNMENT_DEP_FK_ID

describe t_job_adm_job_role;-- JOB_ROLE_PK_ID,JOB_FAMILY_FK_ID,WORK_SCHEDULE_FK_ID,FLSA_STATUS_FK_ID,EMPLOYEE_COST_CLASSIFICATION_FK_ID,JOB_SUB_FAMILY_FK_ID,JOB_ROLE_ICON_CODE_FK_ID,INDUSTRY_FK_ID,JOB_CLASS_FK_ID
describe t_job_adm_job_family;-- JOB_FAMILY_ICON_CODE_FK_ID,SLF_PRNT_JOB_FAMILY_HCY_FK_ID

select JOB_ROLE_FK_ID,JOB_ROLE_NAME_G11N_BIG_TXT from t_org_adm_org_job_pay_grd_posn;


desc t_prn_eu_person_job_assignment;
desc t_prn_eu_person_job_assignment_dates;

describe t_org_adm_org_job_pay_grd_posn;

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

-- t_prn_eu_person person --> t_prn_eu_person_job_assignment_dates
-- t_perm_adm_group --> t_perm_adm_group_to_relationship_map

desc t_perm_adm_group;-- NAME_G11N_BIG_TXT
desc t_perm_adm_group_to_relationship_map; -- groupfkid

desc t_org_adm_org_job_pay_grd_posn; -- ORG_JOB_PAY_GRADE_MAP_DEP_FK_ID
desc t_org_adm_org_job_pay_grade_map; -- ORG_JOB_PAY_GRADE_BAND_MAP_DEP_FK_ID
desc t_org_adm_org_job_pay_grd_posn;

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
