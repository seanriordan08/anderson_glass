class FixSectionNames < ActiveRecord::Migration
  def change
  end
  @section = SectionContent.where(name: 'craftsmanship').first
  @section.update(name: 'projects') if @section.present?
end
