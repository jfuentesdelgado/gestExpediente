json.array!(@duas) do |dua|
  json.extract! dua, :id, :dua, :belongs_to
  json.url dua_url(dua, format: :json)
end
