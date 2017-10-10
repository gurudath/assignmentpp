require 'rails_helper'
require 'byebug'
require_relative '../spec_helpers/phone_number_spec_helper'

include PhoneNumberSpecHelper

RSpec.describe PhoneNumber, type: :model do
	context "test for scopes for -ve scenario" do
	    before(:each) do
	      DatabaseCleaner.start
	      build_phone_number
	    end

	    after(:each) do
	      DatabaseCleaner.clean
	    end

	    it "test for phone validation error message" do 
	    	@phone.save
	    	expect(@phone.errors).not_to be_empty
	    	expect(@phone.errors[:base].first).to eq("Invalid phone length")
		end
	end
end