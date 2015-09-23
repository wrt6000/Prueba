json.array!(@mobibuses) do |mobibus|
  json.extract! mobibus, :id, :posicion, :estado, :kilms_ultima_revision
  json.url mobibus_url(mobibus, format: :json)
end
