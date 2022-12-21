require 'rails_helper'

RSpec.describe Section, type: :model do
  let (:chapter_data_correct_1) {{ id:1, title: "Test" }}
  let! (:correct_chapter_1) { Chapter.create(chapter_data_correct_1 )}

  let (:chapter_data_correct_2) {{ title: "Test2", status: "hidden"}}
  let! (:correct_chapter_2) { Chapter.create(chapter_data_correct_2 )}

  let (:section_data_correct_1) {{ title: "Жалобы", status: "opened"}}
  let (:correct_section_1) { Section.create(section_data_correct_1) }

  let (:section_data_correct_2) {{ title: "Test2", status: "opened", chapter_id: correct_chapter_1.id}}
  let (:correct_section_2) { Section.create(section_data_correct_2) }

  let (:section_data_incorrect_chapter_id) {{ title: "Жалобы", status: "opened", chapter_id: 100 }}
  let (:incorrect_section_chapter_id) { Section.create(section_data_incorrect_chapter_id) }

  let (:section_data_incorrect_empty_title) {{ status: "opened"}}
  let (:incorrect_section_empty_title) { Section.create(section_data_incorrect_empty_title )}

  let (:section_data_incorrect_status) {{ status: "visible"}}
  let (:incorrect_section_status) { Section.create(section_data_incorrect_status)}

  it "created with correct data exists" do
    expect(correct_section_1.valid?).to eq(true)
  end

  it "created with correct data and has default chapter" do
    expect(correct_section_1.chapter_id).to eq(1)
  end

  it "created with correct data and has custom chapter" do
    expect(correct_section_2.chapter_id).to eq(correct_chapter_1.id)
  end

  it "created with incorrect chapter data and has chapter error" do
    expect(incorrect_section_chapter_id.errors[:chapter].empty?).to eq(false)
  end

  it "created with incorrect empty title returns title error" do
    expect(incorrect_section_empty_title.errors[:title].empty?).to eq(false)
  end

  it "created with incorrect status returns status error" do
    expect(incorrect_section_status.errors[:status].empty?).to eq(false)
  end

end