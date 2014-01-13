json.array!(@registros) do |registro|
  json.extract! registro, :id, :numero, :, :tipo, :fecha, :hora, :bultos, :matriculaCamion, :matriculaRemolque, :pesoneto, :pesobruto, :procedencia, :conocimiento, :precinto1, :, :precinto2, :, :precinto3, :, :flete, :total, :estado
  json.url registro_url(registro, format: :json)
end
