require 'rails_helper'

RSpec.describe Account, type: :model do
  let! (:user_data_correct_1) {{ login: "Test1", password: "123", password_confirmation: "123", email: "mav@bmst.ru" }}
  let! (:correct_user_1) { User.create(user_data_correct_1 )}
  
  let (:account_data_correct) {{ user_id: correct_user_1.id, name:"Correct", status: "Active", role: "User"}}
  let (:correct_account) { Account.create(account_data_correct) }
  
  let (:incorrect_account) { Account.create({ name: "Inc", role: 'User', status: 'Active' }) }
  let (:incorrect_account_name_long) { Account.create({user_id: correct_user_1.id, name: "Incaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", role: 'User', status: 'Active' }) }

  let (:account_data_incorrect_user_id) {{ user_id: -10, name:"Correct", status: "Active", role: "User"}}
  let (:incorrect_account_user_id) { Account.create(account_data_incorrect_user_id) }

  let (:account_data_incorrect_status) {{ user_id: correct_user_1.id, name:"Correct", role: "User"}}
  let (:incorrect_account_status) { Account.create(account_data_incorrect_status) }

  let (:account_data_incorrect_role) {{ user_id: correct_user_1.id, status: "Active", name: "Correct"}}
  let (:incorrect_account_role) { Account.create(account_data_incorrect_role) }

  it "created with wrong data cant create" do
    expect(incorrect_account.valid?).to eq(false)
  end

  it "created with wrong data returns error" do
    expect(incorrect_account.errors.size > 0).to eq(true)
  end

  it "created w/o user_id returns user_id_error" do
    expect(incorrect_account.errors[:user_id].empty?).to eq(false)
  end

  it "created with wrong name length returns name_error" do
    expect(incorrect_account.errors[:name].empty?).to eq(false)
  end

  it "created with correct information" do
    expect(correct_account.errors.size > 0).to eq(false)
  end

  it "created with wrong user_id cant create" do
    expect(incorrect_account_user_id.valid?).to eq(false)
  end

  it "created with wrong user_id returns user_id_error" do
    expect(incorrect_account_user_id.errors[:user].empty?).to eq(false)
  end

  it "created w/o status returns AR exceptions" do
    expect{incorrect_account_status.valid?}.to raise_error ActiveRecord::NotNullViolation
  end

  it "created w/o role returns AR exceptions" do
    expect{incorrect_account_role.valid?}.to raise_error ActiveRecord::NotNullViolation
  end

  it "created with too long name returns name error" do
    expect(incorrect_account_name_long.errors[:name].empty?).to eq(false)
  end


end