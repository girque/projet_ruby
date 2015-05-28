json.array!(@rages) do |rage|
  json.extract! rage, :id, :title, :description, :picture
  json.url rage_url(rage, format: :json)
end
