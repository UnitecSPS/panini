class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :number
      t.datetime :birthday
      t.decimal :height
      t.string :team
      t.references :country, index: true

      t.timestamps
    end
  end
end
