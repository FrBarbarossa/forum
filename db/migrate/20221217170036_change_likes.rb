class ChangeLikes < ActiveRecord::Migration[7.0]
  def change
    change_table :likes do |t|
      t.rename :messages_id, :message_id
      t.rename :accounts_id, :account_id
    end
  end
end
