class Person < ActiveRecord::Base
  attr_accessible :ads_login_name, :email, :first_name, :fmno, :full_name, :last_name, :location_code, :location_office, :mckinsey_career_title, :person_status, :position_code, :preferred_name, :vendor_id
  self.table_name = "people"
  self.primary_key = "id" # TODO really dont think this is necessary need to verify in integration env

  validates_presence_of :fmno, :vendor_id

end
