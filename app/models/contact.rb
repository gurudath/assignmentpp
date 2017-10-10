class Contact < ApplicationRecord
	has_many :addresses, inverse_of: :contact, :dependent => :destroy
	has_many :phone_numbers, inverse_of: :contact, :dependent => :destroy

    accepts_nested_attributes_for :addresses,:phone_numbers,allow_destroy: true

    validates_presence_of :name
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

    def addresses_attributes=(addresses_list)
    	addresses_list.each do |key,address|
    		self.addresses.new(address)
    	end
    end

    def phone_numbers_attributes=(phones_list)
    	phones_list.each do |key,phone|
    		self.phone_numbers.new(phone)
    	end
    end

end