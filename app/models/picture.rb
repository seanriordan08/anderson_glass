class Picture < ActiveRecord::Base

  validates :image_file_name, presence: true
  validates :market, presence: { message: 'You must select either residential or commercial' }
  # validates :market, inclusion: { in: %w(residential commercial) }

  has_attached_file :image, PAPERCLIP_STORAGE_OPTS
  validates_attachment_content_type :image, content_type: /^image\/(png|gif|jpeg|jpg)/
  validates_attachment_size :image, :less_than => 2.megabytes

end
