class Address < ApplicationRecord
	belongs_to :contact, inverse_of: :addresses
	belongs_to :country
    validates_presence_of :street,:city,:state,:zipcode,:country_id
    validates :zipcode, presence: true

end
