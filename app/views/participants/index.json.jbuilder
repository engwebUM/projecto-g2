json.array!(@participants) do |participant|
  json.extract! participant, :id, :name, :email, :appeared
  json.url participant_url(participant, format: :json)
end
