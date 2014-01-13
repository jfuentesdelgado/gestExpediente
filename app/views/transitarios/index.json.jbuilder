json.array!(@transitarios) do |transitario|
  json.extract! transitario, :id, :nombre
  json.url transitario_url(transitario, format: :json)
end
