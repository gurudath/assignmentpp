class AddColumnToAddress < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :contact_id, :integer
  end
end
