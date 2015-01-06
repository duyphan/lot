json.array!(@regions) do |region|
  json.extract! region, :id, :name, :portal_code
  json.url region_url(region, format: :json)
end
