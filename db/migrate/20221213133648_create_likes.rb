class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.belongs_to :messages
      t.belongs_to :accounts
      t.timestamps
    end
  end
end
