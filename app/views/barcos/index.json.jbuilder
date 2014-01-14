json.array!(@barcos) do |barco|
  json.extract! barco, :id, :nombre
  json.url barco_url(barco, format: :json)
end
