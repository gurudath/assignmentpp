# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create! :username => 'TestUser', :email => 'test@gmail.com', :password => '111111', :password_confirmation => '111111'
user = User.create! :username => 'AdminUser', :email => 'admin@gmail.com', :password => '111111', :password_confirmation => '111111'
user.add_role :admin

COUNTRY_CODE[:countryCodes].each do |country|
  Country.create(code: country[:country_code], name: country[:country_name], dial_code: country[:dialling_code])
end	

(1..35).each do |a|
	contact = Contact.new(name:Faker::Name.name,bdate: Faker::Date.backward(rand(10..1000)), anniv: Faker::Date.backward(rand(10..1000)), email: Faker::Internet.email)
	(0..2).each do |aa|
		contact.addresses.new(street: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state, zipcode: Faker::Address.zip_code,country_id:Country.offset(rand(Country.count)).first.id)
	end	
	(0..2).each do |aa|
		contact.phone_numbers.new(area_code: 
Faker::PhoneNumber.subscriber_number(3), fax_number: Faker::PhoneNumber.extension,alternate_number: Faker::PhoneNumber.cell_phone, country_id: Country.offset(rand(Country.count)).first.id)
	end
	contact.save
end
