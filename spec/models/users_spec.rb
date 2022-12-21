require 'rails_helper'

RSpec.describe User, type: :model do
  let! (:user_data_correct_1) {{ login: "Test1", password: "123", password_confirmation: "123", email: "mav@bmst.ru" }}
  let! (:user_data_correct_2) {{ login: "Test2", password: "123", password_confirmation: "123", email: "mav@bmst.ru" }}
  let! (:user_data_repeat_user) {{ login: "Test2", password: "321", password_confirmation: "321", email: "mav@bmst.ru" }}
  let! (:user_data_incorrect_1) { { login: "Test1", password: "123", password_confirmation: "123" } }
  let! (:user_data_incorrect_passwords_conf) {  { login: "Test2", password: "321", password_confirmation: "123", email: "mav@bmst.ru" } } 
  let! (:user_data_incorrect_passwords) {  { login: "Test2", password_confirmation: "123", email: "mav@bmst.ru" } } 
  let! (:user_data_incorrect_email) { { login: "Test1", password: "123", password_confirmation: "123", email: "mavbmst.ru" } }

  let! (:correct_user_1) { User.create(user_data_correct_1 )}
  let! (:correct_user_2) { User.new(user_data_correct_2) }
  let! (:incorrect_account) { correct_user_2.build_account({ name: "Inc", role: 'User', status: 'Active' }) }
  let (:incorrect_user_1) { User.create( user_data_incorrect_1) }
  let (:incorrect_user_double) { User.create( user_data_correct_1) }
  let (:incorrect_user_passw_conf) { User.create(user_data_incorrect_passwords_conf) }
  let (:incorrect_user_passw) { User.create(user_data_incorrect_passwords) }
  let (:incorrect_user_email) { User.create(user_data_incorrect_email) }

  it "created with wrong data cant create" do
    expect(incorrect_user_1.valid?).to eq(false)
  end

  it "created with wrong data returns error" do
    expect(incorrect_user_1.errors.size > 0).to eq(true)
  end

  it "created with wrong email-data returns e-mail error" do
    expect(incorrect_user_1.errors[:email].empty?).to eq(false)
  end

  it "created with correct data returns no errors" do
    expect(correct_user_1.errors.size > 0).to eq(false)
  end

  it "created with double-data returns login errors" do
    expect(incorrect_user_double.errors[:login].empty?).to eq(false)
  end

  it "created with incorrect passw_conf returns errors" do
    expect(incorrect_user_passw_conf.errors.size > 0).to eq(true)
  end
  
  it "created with incorrect passw_conf returns passw_cof errors" do
    expect(incorrect_user_passw_conf.errors[:password_confirmation].empty?).to eq(false)
  end

  it "created with incorrect passw returns errors" do
    expect(incorrect_user_passw.errors.size > 0).to eq(true)
  end

  it "created with incorrect passw returns passw_errors" do
    expect(incorrect_user_passw.errors[:password].empty?).to eq(false)
  end

  it "created with incorrect email returns errors" do
    expect(incorrect_user_email.errors[:email].size > 0).to eq(true)
  end

  it "created with incorrect email returns email_errors" do
    expect(incorrect_user_email.errors[:email].empty?).to eq(false)
  end

  it "created account from user with incorrect account_name is not valid" do
    expect(correct_user_2.account.valid?).to eq(false)
  end

  it "created account from user with incorrect account_name returns account_name_error" do
    correct_user_2.account.valid? 
    expect(correct_user_2.account.errors[:name].empty?).to eq(false)
  end

end