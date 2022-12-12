class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :status, default: "visible"
      t.belongs_to :account, foreign_key: true
      t.belongs_to :topic, foreign_key: true
      t.timestamps
    end
  end
end
