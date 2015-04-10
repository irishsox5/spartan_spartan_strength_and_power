class Blog < ActiveRecord::Base

  acts_as_taggable_on :tags

  validates_presence_of :content, :title, :author
  mount_uploader :photo, PhotoUploader

  default_scope {order ("created_at DESC")}
end
