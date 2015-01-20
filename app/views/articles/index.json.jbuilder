json.array!(@articles) do |article|
  json.extract! article, :id, :title, :description, :a_type
  json.url article_url(article, format: :json)
end
