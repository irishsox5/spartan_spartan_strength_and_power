# encoding: utf-8

class VideoUploader < CarrierWave::Uploader::Base

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(ogg ogv 3gp mp4 m4v webm mov m2v 3g2)
    # %w(ogg ogv 3gp mp4 m4v webm mov)
  end
end
