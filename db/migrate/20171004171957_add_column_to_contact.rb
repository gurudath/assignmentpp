class AddColumnToContact < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :bdate, :date
    add_column :contacts, :anniv, :date
    add_column :contacts, :email, :string
  end
end
