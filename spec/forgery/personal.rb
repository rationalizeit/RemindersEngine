Forgery::Personal.class_eval do

  def self.position_code
   (0...3).map{(65+rand(26)).chr}.join 
  end

  def self.location_code
    position_code
  end

  #TODO need to get real values for these two below
  def self.career_title
    ["Associate" "Manager" "Supervisor" "Project Manager"].sample
  end

  def self.person_status
    ["Active" "Inactive" "Not Found" "Alumni"].sample
  end
  
  def self.fmno
   rand(6 ** 10)
  end

end
