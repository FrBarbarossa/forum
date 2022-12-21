require 'rails_helper'

RSpec.describe Moderation, type: :model do
  let! (:user_data_correct_1) {{ login: "Test1", password: "123", password_confirmation: "123", email: "mav@bmst.ru" }}
  let! (:correct_user_1) { User.create(user_data_correct_1 )}
  let! (:account_data_correct) {{ user_id: correct_user_1.id, name:"Correct", status: "Active", role: "User"}}
  let! (:correct_account) { Account.create(account_data_correct) }
  let! (:chapter_data_correct_1) {{id: Chapter.all.last.id+1, title: "Test" }}
  let! (:correct_chapter_1) { Chapter.create(chapter_data_correct_1 )}
  let! (:chapter_data_correct_2) {{id: Chapter.all.last.id+1, title: "Test2", status: "hidden"}}
  let! (:correct_chapter_2) { Chapter.create(chapter_data_correct_2 )}
  let! (:section_data_correct_1) {{ title: "Жалобы", status: "opened"}}
  let! (:correct_section_1) { Section.create(section_data_correct_1) }
  let! (:topic_data_correct_1) { {title: "TestTopic", account_id: correct_account.id, section_id: correct_section_1.id} }
  let! (:correct_topic_1) {Topic.create(topic_data_correct_1)}

  let! (:moder_data_correct) { {account_id: correct_account.id, section_id: correct_section_1.id} }
  let! (:correct_moder_1) {Moderation.create(moder_data_correct)}
  let (:incorrect_moder_double) {Moderation.create(moder_data_correct)}

  let (:moder_data_incorrect_no_account) { {section_id: correct_section_1.id} }
  let (:incorrect_moder_no_account) {Moderation.create(moder_data_incorrect_no_account)}

  let (:moder_data_incorrect_account) { {account_id: -100, section_id: correct_section_1.id} }
  let (:incorrect_moder_account) {Moderation.create(moder_data_incorrect_account)}

  let (:moder_data_incorrect_section) { {account_id: correct_account.id, section_id: -100} }
  let (:incorrect_moder_section) {Moderation.create(moder_data_incorrect_section)}

  let (:moder_data_incorrect_no_section) { {account_id: correct_account.id} }
  let (:incorrect_moder_no_section) {Moderation.create(moder_data_incorrect_no_section)}
  
  it "created with correct data exists" do
    expect(correct_moder_1.valid?).to eq(true)
  end

  it "created with correct data has default disable status" do
    expect(correct_moder_1.disabled).to eq(false)
  end

  it "double is invalid" do
    expect(incorrect_moder_double.valid?).to eq(false)
  end

  it "created w/o account_id is not valid" do
    expect(incorrect_moder_no_account.valid?).to eq(false)
  end

  it "created w/o account_id has account_error" do
    expect(incorrect_moder_no_account.errors[:account].size > 0).to eq(true)
  end

  it "created with incorrect account_id is not valid" do
    expect(incorrect_moder_account.valid?).to eq(false)
  end

  it "created with incorrect account_id has account_error" do
    expect(incorrect_moder_account.errors[:account].size > 0).to eq(true)
  end

  it "created with incorrect section_id is not valid" do
    expect(incorrect_moder_section.valid?).to eq(false)
  end

  it "created with incorrect section_id has section_error" do
    expect(incorrect_moder_section.errors[:section].size > 0).to eq(true)
  end

  it "created w/o section_id is not valid" do
    expect(incorrect_moder_no_section.valid?).to eq(false)
  end

  it "created w/p section_id has section_error" do
    expect(incorrect_moder_no_section.errors[:section].size > 0).to eq(true)
  end

end