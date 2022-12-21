class CreateNewModerations < ActiveRecord::Migration[7.0]
  def change
    create_table :moderations do |t|
      t.belongs_to :account
      t.belongs_to :section
      t.boolean :disabled, default: false
      t.timestamps
    end
  end
end
