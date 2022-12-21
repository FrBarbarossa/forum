require 'rails_helper'

RSpec.describe Message, type: :model do
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

  let (:messsage_data_correct_1) { {account_id: correct_account.id, topic_id: correct_topic_1.id, content: "Test :)"} }
  let (:correct_message_1) {Message.create(messsage_data_correct_1)}

  let (:messsage_data_custom_status) { {account_id: correct_account.id, topic_id: correct_topic_1.id, content: "Test :)", status: "hidden"} }
  let (:correct_message_custom_status) {Message.create(messsage_data_custom_status)}

  let (:messsage_data_incorrect_no_mess) { {account_id: correct_account.id, topic_id: correct_topic_1.id} }
  let (:incorrect_message_no_mess) {Message.create(messsage_data_incorrect_no_mess)}

  let (:messsage_data_incorrect_no_topic) {  {account_id: correct_account.id, content: "Test :)"} }
  let (:incorrect_message_no_topic) {Message.create(messsage_data_incorrect_no_topic)}

  let (:messsage_data_incorrect_topic) {  {account_id: correct_account.id, topic_id: -100, content: "Test :)"} }
  let (:incorrect_message_topic) {Message.create(messsage_data_incorrect_topic)}

  let (:messsage_data_incorrect_custom_status) { {account_id: correct_account.id, topic_id: correct_topic_1.id, content: "Test :)", status: "hiden"} }
  let (:incorrect_message_custom_status) {Message.create(messsage_data_incorrect_custom_status)}

  it "created with correct data exists" do
    expect(correct_message_1.valid?).to eq(true)
  end

  it "created with correct data w/o costums has default status" do
    expect(correct_message_1.status).to eq('visible')
  end

  it "created w/o content is invalid" do
    expect(incorrect_message_no_mess.valid?).to eq(false)
  end

  it "created w/o content has content errors" do
    expect(incorrect_message_no_mess.errors[:content].size > 0).to eq(true)
  end

  it "created w/o topic is invalid" do
    expect(incorrect_message_no_mess.valid?).to eq(false)
  end

  it "created w/o topic has topic errors" do
    expect(incorrect_message_no_topic.errors[:topic].size > 0).to eq(true)
  end

  it "created with incorrect topic_id is invalid" do
    expect(incorrect_message_topic.valid?).to eq(false)
  end

  it "created with incorrect topic_id has topic errors" do
    expect(incorrect_message_topic.errors[:topic].size > 0).to eq(true)
  end

  it "created with correct custom data exists" do
    expect(correct_message_custom_status.valid?).to eq(true)
  end

  it "created with correct data with costums has custom status" do
    expect(correct_message_custom_status.status).to eq('hidden')
  end

  it "created with incorrect custom data doesnt exists" do
    expect(incorrect_message_custom_status.valid?).to eq(false)
  end

  it "created with incorrect data with costums has status error" do
    expect(incorrect_message_custom_status.errors[:status].size > 0).to eq(true)
  end

end