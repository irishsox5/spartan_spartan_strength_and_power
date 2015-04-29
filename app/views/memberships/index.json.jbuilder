json.array!(@memberships) do |membership|
  json.extract! membership, :id, :program_id
  json.url membership_url(membership, format: :json)
end
