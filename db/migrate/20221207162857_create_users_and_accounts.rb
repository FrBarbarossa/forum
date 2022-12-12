class CreateUsersAndAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :login, null: false, unique: true
      t.string :password_digest, null: false
      t.string :email, null: false, unique: true
      t.timestamps
    end

    create_table :accounts do |t|
      t.belongs_to :user
      t.string :name, null: false
      t.string :role, null: false
      t.text :description
      t.string :status, null: false, unique: true
      t.timestamps
    end
  end
end
