json.array!(@options) do |option|
  json.extract! option, :name
  json.url option_url(option, format: :json)
end
