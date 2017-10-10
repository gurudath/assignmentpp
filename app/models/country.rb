class Country < ApplicationRecord
	has_one :address
	has_one :phone_number
end
