class ChangeModerations < ActiveRecord::Migration[7.0]
  def change
    add_column :moderations, :disabled, :bool, default: false
  end
end
