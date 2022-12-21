require 'rails_helper'

RSpec.describe Account, type: :model do
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

  let (:topic_data_correct_1) { {title: "TestTopic", account_id: correct_account.id, section_id: correct_section_1.id} }
  let (:correct_topic_1) {Topic.create(topic_data_correct_1)}

  let (:topic_data_correct_custom_status) { {title: "TestTopic2", account_id: correct_account.id, section_id: correct_section_1.id, status: "hidden"} }
  let (:correct_topic_custom_status) {Topic.create(topic_data_correct_custom_status)}

  let (:topic_data_incorrect_no_title) { { account_id: correct_account.id, section_id: correct_section_1.id, status: "hidden"} }
  let (:incorrect_topic_no_title) {Topic.create(topic_data_incorrect_no_title)}

  let (:topic_data_incorrect_no_section) { { account_id: correct_account.id, section_id: -100, status: "opened"} }
  let (:incorrect_topic_no_section) {Topic.create(topic_data_incorrect_no_section)}

  let (:topic_data_incorrect_no_section_2) { { account_id: correct_account.id, status: "opened"} }
  let (:incorrect_topic_no_section_2) {Topic.create(topic_data_incorrect_no_section_2)}
  

  it "created with correct data exists" do
    expect(correct_topic_1.valid?).to eq(true)
  end

  it "created with correct data exists with default status" do
    expect(correct_topic_1.status).to eq("opened")
  end

  it "created with correct data exists with default close" do
    expect(correct_topic_1.closed).to eq(false)
  end

  it "created with correct data exists with default close" do
    expect(correct_topic_custom_status.closed).to eq(false)
  end

  it "created with incorrect data has default close" do
    expect(incorrect_topic_no_section.closed).to eq(false)
  end

  it "created w/o section has default close" do
    expect(incorrect_topic_no_section_2.closed).to eq(false)
  end

  it "created with correct data exists with normal priority" do
    expect(correct_topic_1.priority).to eq("normal")
  end
  
  it "created with custom data exists" do
    expect(correct_topic_custom_status.valid?).to eq(true)
  end

  it "created with correct custom data exists with custom status" do
    expect(correct_topic_custom_status.status).to eq("hidden")
  end

  it "created with correct custom data exists with normal priority" do
    expect(correct_topic_1.priority).to eq("normal")
  end

  it "created w/o title is invalud" do
    expect(incorrect_topic_no_title.valid?).to eq(false)
  end

  it "created with no title returns title errors" do
    expect(incorrect_topic_no_title.errors[:title].size > 0).to eq(true)
  end

  it "created with incorrect section is invalud" do
    expect(incorrect_topic_no_section.valid?).to eq(false)
  end

  it "created with incorrect section returns title errors" do
    expect(incorrect_topic_no_section.errors[:title].size > 0).to eq(true)
  end
  
  it "created w/o section is invalud" do
    expect(incorrect_topic_no_section_2.valid?).to eq(false)
  end

  it "created w/o section returns title errors" do
    expect(incorrect_topic_no_section_2.errors[:title].size > 0).to eq(true)
  end

end