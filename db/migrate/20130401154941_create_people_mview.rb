class CreatePeopleMview < ActiveRecord::Migration
  def up
    if Rails.env.test?
      drop_table :people rescue nil

      create_table :people, :force => true do |t|
        t.integer :id
        t.integer :vendor_id
        t.integer :fmno
        t.string  :first_name
        t.string  :preferred_name
        t.string  :last_name
        t.string  :full_name
        t.string  :full_name_lower
        t.string  :ads_login_name
        t.string  :person_status
        t.string  :email
        t.string  :location_code
        t.string  :location_office
        t.string  :position_code
        t.string  :mckinsey_career_title
      end
    else
      execute "DROP MATERIALIZED VIEW PEOPLE" rescue nil

      execute "CREATE MATERIALIZED VIEW PEOPLE (ID, VENDOR_ID, FMNO , FIRST_NAME,
                                    PREFERRED_NAME, LAST_NAME, FULL_NAME, FULL_NAME_LOWER, ADS_LOGIN_NAME,
                                    PERSON_STATUS, EMAIL, LOCATION_CODE, LOCATION_OFFICE,
                                    POSITION_CODE, MCKINSEY_CAREER_TITLE) AS
          (SELECT pp.person_id,
                  pp.vendor_individual_id,
                  pp.fmno,
                  pp.first_name,
                  pp.preferred_name,
                  pp.last_name,
                  pp.first_name || ' ' || pp.last_name,
                  lower(pp.first_name || ' ' || pp.last_name),
                  pp.ads_login_name,
                  pp.person_status,
                  pe.email_id email,
                  o.location_location_code location_code,
                  l.office_name location_office,
                  o.position_code,
                  o.mckinsey_career_title
             FROM ors.psn_person@reminders_ors.world pp, ors.psn_email@reminders_ors.world pe, ors.psn_off_career_job_type_dept@reminders_ors.world o, ors.pik_location@reminders_ors.world l
            WHERE     pp.accounting_fmno_flag = 'N'
                  AND PP.vendor_individual_id IS NOT NULL
                  AND  pe.person_id(+) = pp.person_id
                  AND pe.email_type(+) = 'LN_Internet'
                  AND pp.person_id = o.person_id
                  AND o.location_location_code = l.location_code )
          UNION ALL
          (SELECT cc.contractor_id,
                  cc.vendor_individual_id,
                  cc.cno,
                  cc.first_name,
                  cc.preferred_name,
                  cc.last_name,
                  cc.first || ' ' || cc.last_name,
                  lower(cc.first || ' ' || cc.last_name),
                  cc.ads_login_name,
                  cc.status,
                  ce.email_id,
                  co.goc_location_code,
                  l.office_name,
                  'FIA' position_code,
                  co.contractor_title
             FROM ors.con_contractor@reminders_ors.world cc, ors.con_location_dept@reminders_ors.world co, ors.con_email@reminders_ors.world ce, ors.pik_location@reminders_ors.world l
            WHERE     cc.contractor_id = co.contractor_id
                  AND ce.contractor_id(+) = cc.contractor_id
                  AND ce.email_type(+) = 'LN_Internet'
                  AND co.goc_location_code = l.location_code )  "

      add_index :people, [:id], :name => "people_id_idx", :tablespace => "reminders_idx", :unique => true
      add_index :people, [:fmno], :name => "people_fmno_idx", :tablespace => "reminders_idx", :unique => true
      add_index :people, [:vendor_id], :name => "people_vendor_idx", :tablespace => "reminders_idx", :unique => true
      add_index :people, [:email], :name => "people_email_idx", :tablespace => "reminders_idx"
      add_index :people, [:full_name_lower], :name => "people_fullname_lower_idx", :tablespace => "reminders_idx"
      add_index :people, [:person_status], :name => "people_status_idx", :tablespace => "reminders_idx"
    end
  end

  def down
    if Rails.env.test?
      drop_table :people rescue nil
    else
      execute "DROP MATERIALIZED VIEW PEOPLE" rescue nil
    end
  end
end

