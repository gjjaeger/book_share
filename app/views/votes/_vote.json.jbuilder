json.extract! vote, :id, :value, :user_id, :voteable_id, :voteable_type, :created_at, :updated_at
json.url vote_url(vote, format: :json)
