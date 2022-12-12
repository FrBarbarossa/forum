class CreateTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :topics do |t|
      t.string :title, null: false
      t.belongs_to :section, foreign_key: true
      t.belongs_to :account, foreign_key: true
      t.string :priority, default: "normal"
      t.string :status, default: "opened"
      t.timestamps
    end 
  end
end
