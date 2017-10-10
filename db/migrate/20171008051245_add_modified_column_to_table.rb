class AddModifiedColumnToTable < ActiveRecord::Migration[5.1]
  def change
  	    add_column :addresses, :country_id, :integer
        add_column :phone_numbers, :country_id, :integer
        remove_column :phone_numbers,:country_code
  end
end
