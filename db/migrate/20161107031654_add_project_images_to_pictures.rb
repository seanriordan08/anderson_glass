class AddProjectImagesToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :project, :boolean, default: false
    Picture.first.update(project: true)
  end

end
