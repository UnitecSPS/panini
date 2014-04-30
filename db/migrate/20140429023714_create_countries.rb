class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :url
      t.string :email
      t.integer :position

      t.timestamps
    end
  end
end
