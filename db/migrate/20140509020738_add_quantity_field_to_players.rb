class AddQuantityFieldToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :quantity, :integer, default: 0
  end
end
