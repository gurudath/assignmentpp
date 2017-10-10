require 'rails_helper'
require 'byebug'

RSpec.describe User, type: :model do
	context "test for assign_default_role" do
	    before(:each) do
	      DatabaseCleaner.start
	      @user = create(:user)
	    end

	    after(:each) do
	      DatabaseCleaner.clean
	    end

	    it "test for phone validation error message" do 
	    	@user.assign_default_role
	    	expect(@user.roles).not_to be_empty
	    	expect(@user.has_role? :user).to eq(true)
		end
	end
end