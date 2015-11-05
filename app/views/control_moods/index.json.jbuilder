json.array!(@control_moods) do |control_mood|
  json.extract! control_mood, :id, :mood_id, :work, :user_id
  json.url control_mood_url(control_mood, format: :json)
end
