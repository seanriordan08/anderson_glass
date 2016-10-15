class Picture < ActiveRecord::Base

  validates :image_file_name, presence: true
  has_attached_file :image, PAPERCLIP_STORAGE_OPTS
  validates_attachment_content_type :image, content_type: /^image\/(png|gif|jpeg|jpg)/

end