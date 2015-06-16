json.array!(@myrages) do |myrage|
  json.extract! myrage, :id
  json.url myrage_url(myrage, format: :json)
end
