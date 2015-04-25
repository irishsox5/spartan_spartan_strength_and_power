json.array!(@comments) do |comment|
  json.extract! comment, :id, :content, :blog_id, :name
  json.url comment_url(comment, format: :json)
end
