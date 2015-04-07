class Blog < ActiveRecord::Base
  validates_presence_of :content, :title, :author
  mount_uploader :photo, PhotoUploader

  default_scope {order ("created_at DESC")}
end
