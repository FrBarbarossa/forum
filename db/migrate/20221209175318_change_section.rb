class ChangeSection < ActiveRecord::Migration[7.0]
  def change
    remove_column :sections, :type
  end
end
