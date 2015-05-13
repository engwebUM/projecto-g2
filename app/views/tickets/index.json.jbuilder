json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :kind, :money
  json.url ticket_url(ticket, format: :json)
end
