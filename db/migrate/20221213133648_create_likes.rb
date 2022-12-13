class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.belongs_to :message
      t.belongs_to :account
      t.timestamps
    end
  end
end
