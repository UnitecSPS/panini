class RemoveHeightFromPlayers < ActiveRecord::Migration
  def change
    remove_column :players, :height, :decimal
  end
end
