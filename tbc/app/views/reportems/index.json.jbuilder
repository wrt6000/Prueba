json.array!(@reportems) do |reportem|
  json.extract! reportem, :id, :fecha, :trayectos
  json.url reportem_url(reportem, format: :json)
end
