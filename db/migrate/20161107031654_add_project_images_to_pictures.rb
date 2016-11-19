class AddProjectImagesToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :project, :boolean, default: false
    @picture = Picture.where(project: true).first
    @picture.update(project: true) if @picture.present?
  end

end
