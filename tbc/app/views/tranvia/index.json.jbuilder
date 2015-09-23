json.array!(@tranvia) do |tranvium|
  json.extract! tranvium, :id, :identificacion, :linea, :kilms_ultima_revision, :temperatura, :posicion, :estado, :boton_panico
  json.url tranvium_url(tranvium, format: :json)
end
