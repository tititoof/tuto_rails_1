json.array!(@tags) do |tag|
  json.extract! tag, :id, :name
  json.url article_url(tag, format: :json)
end
