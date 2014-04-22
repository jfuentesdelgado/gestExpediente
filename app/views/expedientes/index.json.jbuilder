json.array!(@expedientes) do |expediente|
  json.extract! expediente, :id, :numero
  json.url expediente_url(expediente, format: :json)
end
