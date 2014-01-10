json.array!(@mercancias) do |mercancia|
  json.extract! mercancia, :id, :nombre
  json.url mercancia_url(mercancia, format: :json)
end
