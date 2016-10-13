class Picture < ActiveRecord::Base

  validates :image_file_name, presence: true
  has_attached_file :image, path: Rails.root.join('app', 'assets', 'images', 'custom', ':style', ':filename' ).to_s, :styles => { :banner => "1497x589>", medium: "300x300>", :thumb => "192x192>" }
  validates_attachment_content_type :image, content_type: /^image\/(png|gif|jpeg|jpg)/

end
