class Comment < ActiveRecord::Base
  belongs_to :blog
  validates_presence_of :first_name, :last_name, :content
end
