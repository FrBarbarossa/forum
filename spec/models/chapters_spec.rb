require 'rails_helper'

RSpec.describe Chapter, type: :model do
  let (:chapter_data_correct_1) {{ title: "Test" }}
  let (:correct_chapter_1) { Chapter.create(chapter_data_correct_1 )}

  let (:chapter_data_correct_2) {{ title: "Test", status: "hidden"}}
  let (:correct_chapter_2) { Chapter.create(chapter_data_correct_2 )}

  let (:incorrect_chapter) { Chapter.create()}

  it "created with correct data exists" do
    expect(correct_chapter_1.valid?).to eq(true)
  end

  it "created with correct default data has opened status" do
    expect(correct_chapter_1.status).to eq("opened")
  end

  it "created with correct data & status exists" do
    expect(correct_chapter_2.valid?).to eq(true)
  end

  it "created with correct custom status data has custom status" do
    expect(correct_chapter_2.status).to eq("hidden")
  end

  it "created with incorrect data is invalid" do
    expect(incorrect_chapter.valid?).to eq(false)
  end

  it "created with incorrect data has title_error" do
    expect(incorrect_chapter.errors[:title].empty?).to eq(false)
  end
end