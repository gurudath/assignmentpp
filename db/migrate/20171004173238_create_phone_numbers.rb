class CreatePhoneNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :phone_numbers do |t|
      t.string :country_code
      t.string :area_code
      t.string :fax_number
      t.integer :contact_id

      t.timestamps
    end
  end
end
