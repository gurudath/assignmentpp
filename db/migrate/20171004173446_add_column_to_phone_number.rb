class AddColumnToPhoneNumber < ActiveRecord::Migration[5.1]
  def change
    add_column :phone_numbers, :alternate_number, :string
  end
end
