class CreateSectionsAndModerators < ActiveRecord::Migration[7.0]
  def change
    create_table :sections do |t|
      t.string :title, null: false, unique: true
      t.text :description
      t.string :status
      t.string :type
      t.timestamps
    end

    create_join_table :accounts, :sections, table_name: :moderations
  end
end
