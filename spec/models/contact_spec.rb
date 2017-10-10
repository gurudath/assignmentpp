require 'rails_helper'
require 'byebug'
require_relative '../spec_helpers/contact_spec_helper'

include ContactSpecHelper

RSpec.describe Contact, type: :model do
 
	context "test for scopes for -ve scenario" do
	    before(:each) do
	      DatabaseCleaner.start
	      build_contact
	    end

	    after(:each) do
	      DatabaseCleaner.clean
	    end

	    it "test for addresses_attributes" do 
	    	@contact.addresses_attributes=get_sample_address
	    	@contact.save
	    	expect(@contact.addresses).not_to be_empty
	    	expect(@contact.addresses.length).to be(2)
		end

	    it "test for phone_numbers_attributes" do 
	    	@contact.phone_numbers_attributes=get_sample_phone_numbers
	    	@contact.save
	    	expect(@contact.phone_numbers).not_to be_empty
	    	expect(@contact.phone_numbers.length).to be(2)
		end
	end
end