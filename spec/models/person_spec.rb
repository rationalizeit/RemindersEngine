require 'spec_helper'

describe Person do
  context "validations" do
    it { should validate_presence_of :fmno }
    it { should validate_presence_of :vendor_id } 
  end
  
  context "look ups" do
    before :all do
      FactoryGirl.create(:person)
      FactoryGirl.create(:person)
    end

    it "should correctly return a list of people" do
      Person.all.should have(2).item
    end

  end
end
