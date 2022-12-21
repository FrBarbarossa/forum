require 'rails_helper'

RSpec.describe Like, type: :model do
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

  let! (:messsage_data_correct_1) { {account_id: correct_account.id, topic_id: correct_topic_1.id, content: "Test :)"} }
  let! (:correct_message_1) {Message.create(messsage_data_correct_1)}

  let (:like_data_correct) { {account_id: correct_account.id, message_id: correct_message_1.id} }
  let! (:correct_like_1) {Like.create(like_data_correct)}
  let (:incorrect_like_doubl) {Like.create(like_data_correct)}

  let (:like_data_incorrect_message) { {account_id: correct_account.id, message_id: -100} }
  let (:incorrect_like_message) {Like.create(like_data_incorrect_message)}

  let (:like_data_incorrect_no_message) { {account_id: correct_account.id} }
  let (:incorrect_like_no_message) {Like.create(like_data_incorrect_no_message)}

  let (:like_data_incorrect_no_account) { {message_id: correct_message_1.id} }
  let (:incorrect_like_no_account) {Like.create(like_data_incorrect_no_account)}

  let (:like_data_incorrect_account) { {account_id: -100, message_id: -100} }
  let (:incorrect_like_account) {Like.create(like_data_incorrect_account)}
  
  it "created with correct data exists" do
    expect(correct_like_1.valid?).to eq(true)
  end

  it "created with correct has correct message_id" do
    expect(correct_like_1.message_id).to eq(correct_message_1.id)
  end

  it "created with correct has correct account" do
    expect(correct_like_1.account_id).to eq(correct_account.id)
  end

  it "created with incorrect message_id is not valid" do
    expect(incorrect_like_message.valid?).to eq(false)
  end

  it "created with incorrect message_id has message_error" do
    expect(incorrect_like_message.errors[:message].size > 0).to eq(true)
  end

  it "created w/o message_id is not valid" do
    expect(incorrect_like_no_message.valid?).to eq(false)
  end

  it "created w/o message_id has message_error" do
    expect(incorrect_like_no_message.errors[:message].size > 0).to eq(true)
  end

  it "created w/o account_id is not valid" do
    expect(incorrect_like_no_account.valid?).to eq(false)
  end

  it "created w/o account_id has account_error" do
    expect(incorrect_like_no_account.errors[:account].size > 0).to eq(true)
  end

  it "created with incorrect account_id is not valid" do
    expect(incorrect_like_account.valid?).to eq(false)
  end

  it "created with incorrect account_id has account_error" do
    expect(incorrect_like_account.errors[:account].size > 0).to eq(true)
  end

  it "double is invalid" do
    expect(incorrect_like_doubl.valid?).to eq(false)
  end

end