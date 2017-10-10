class PhoneNumber < ApplicationRecord
	belongs_to :contact, inverse_of: :phone_numbers
    belongs_to :country
    validates  :country_id, format:{with: /\A+\d+\z/}, presence: true
    validates :area_code,numericality: { only_integer: true } , presence: true
    validates :fax_number,numericality: { only_integer: true }, presence: true
    validates_uniqueness_of :fax_number,:scope=>[:area_code, :country_id]
    validate :phone_validation
    validates_length_of :alternate_number, :minimum => 9, :maximum => 15, :allow_blank => true

    def phone_validation
    	errors[:base] << ("Invalid phone length") if (self.area_code+self.fax_number).size > 11
    end

end
