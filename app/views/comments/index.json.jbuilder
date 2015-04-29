json.array!(@comments) do |comment|
  json.extract! comment, :id, :first_name, :last_name, :blog_id, :content
  json.url comment_url(comment, format: :json)
end
