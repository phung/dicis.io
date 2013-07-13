json.array!(@votes) do |vote|
  json.extract! vote, :count
  json.url vote_url(vote, format: :json)
end
