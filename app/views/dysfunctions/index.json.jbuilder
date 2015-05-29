json.array!(@dysfunctions) do |dysfunction|
  json.extract! dysfunction, :id, :picture
  json.url dysfunction_url(dysfunction, format: :json)
end
