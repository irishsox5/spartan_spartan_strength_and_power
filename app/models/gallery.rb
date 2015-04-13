class Gallery < ActiveRecord::Base

    mount_uploader :video, VideoUploader

    mount_uploader :image, ImageUploader
end
