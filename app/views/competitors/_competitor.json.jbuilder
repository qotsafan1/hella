json.extract! competitor, :id, :name, :group_id, :laps, :total_time, :finish_time, :place_in_group, :year, :created_at, :updated_at
json.url competitor_url(competitor, format: :json)