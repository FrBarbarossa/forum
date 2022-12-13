class CreateViews < ActiveRecord::Migration[7.0]
  def change
    create_table :views do |t|
      t.belongs_to :topic
      t.belongs_to :account
      t.timestamps
    end
  end
end
