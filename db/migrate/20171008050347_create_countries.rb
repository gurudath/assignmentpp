class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :code
      t.string :name
      t.string :dial_code

      t.timestamps
    end
  end
end
