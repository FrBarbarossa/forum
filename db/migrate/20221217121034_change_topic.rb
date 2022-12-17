class ChangeTopic < ActiveRecord::Migration[7.0]
  def change
    add_column :topics, :closed, :bool, default: false
  end
end
