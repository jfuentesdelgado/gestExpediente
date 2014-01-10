json.array!(@relacions) do |relacion|
  json.extract! relacion, :id, :nombre
  json.url relacion_url(relacion, format: :json)
end
