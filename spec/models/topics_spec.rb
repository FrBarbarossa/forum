require 'rails_helper'

RSpec.describe Account, type: :model do
  let! (:user_data_correct_1) {{ login: "Test1", password: "123", password_confirmation: "123", email: "mav@bmst.ru" }}
  let! (:correct_user_1) { User.create(user_data_correct_1 )}
  let! (:account_data_correct) {{ user_id: correct_user_1.id, name:"Correct", status: "Active", role: "User"}}
  let! (:correct_account) { Account.create(account_data_correct) }
  

#   it "created with wrong data cant create" do
#     expect(incorrect_account.valid?).to eq(false)
#   end

end