json.array!(@badges) do |badge|
  json.extract! badge, :id, :participant_id
  json.url badge_url(badge, format: :json)
end
