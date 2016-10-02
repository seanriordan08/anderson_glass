class CreateSectionContents < ActiveRecord::Migration
  def change
    create_table :section_contents do |t|
      t.string :name
      t.text :html_content

      t.timestamps null: false
    end
  end
end
