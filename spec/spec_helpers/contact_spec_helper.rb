module ContactSpecHelper
 def build_contact
	@contact = build(:contact)
 end

 def get_sample_address
 	return {
 		"1"=>{street: "8514 Kuhic Junction",city: "Greenfelderton",state: "Maryland",zipcode: "99549-4081",country_id: 1},
 		"2"=>{street: "8515 Kuhic Junction",city: "Greenfelderton",state: "Maryland",zipcode: "99549-4081",country_id: 1}
 	}
 end

 def get_sample_phone_numbers
 	return {
 		"1"=>{country_id: "98",area_code: "080", fax_number: "23216139",contact_id: 1},
 		"2"=>{country_id: "98",area_code: "080", fax_number: "23216135",contact_id: 1}
 	}
 end
end
