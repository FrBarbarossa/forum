class CreateChapters < ActiveRecord::Migration[7.0]
  def change
    create_table :chapters do |t|
      t.string :title
      t.string :status, default: "opened"
      t.timestamps
    end

    add_belongs_to :sections, :chapter, default: 1
  end
end
