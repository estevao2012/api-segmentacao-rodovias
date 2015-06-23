class AddColumnDistanceFromBaseRodToViaCaracteristic < ActiveRecord::Migration
  def change
    add_column :via_caracteristics, :distance, :float
  end
end
