json.array!(@galleries) do |gallery|
  json.extract! gallery, :id, :title, :description, :photo, :video
  json.url gallery_url(gallery, format: :json)
end
