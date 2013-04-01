# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do 
  factory :person do
    vendor_id { rand(100) }
    fmno Forgery::Personal.fmno
    first_name Forgery::Name.first_name
    preferred_name { first_name[0,3] }
    last_name Forgery::Name.last_name
    full_name Forgery::Name.full_name
    ads_login_name { full_name }
    person_status Forgery::Personal.person_status
    email Forgery::Email.address
    location_office Forgery::Address.city
    location_code Forgery::Personal.position_code
    position_code Forgery::Personal.position_code
    mckinsey_career_title Forgery::Personal.career_title
  end


  
end
