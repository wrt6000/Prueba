json.array!(@conductors) do |conductor|
  json.extract! conductor, :id, :nombre, :cedula
  json.url conductor_url(conductor, format: :json)
end
