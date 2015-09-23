json.array!(@vcubs) do |vcub|
  json.extract! vcub, :id, :posicion, :estado, :prestada
  json.url vcub_url(vcub, format: :json)
end
