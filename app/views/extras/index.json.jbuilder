json.array!(@extras) do |extra|
  json.extract! extra, :id, :kind, :money
  json.url extra_url(extra, format: :json)
end
