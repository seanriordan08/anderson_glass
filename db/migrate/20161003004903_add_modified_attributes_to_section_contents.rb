class AddModifiedAttributesToSectionContents < ActiveRecord::Migration
  def change
    add_column :section_contents, :last_modified_by, :string
    add_column :section_contents, :last_modified_date, :datetime

    remove_column :section_contents, :created_at
    remove_column :section_contents, :updated_at
  end
end
