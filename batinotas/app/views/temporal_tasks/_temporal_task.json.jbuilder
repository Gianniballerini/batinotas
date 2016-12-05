json.extract! temporal_task, :id, :description, :state, :priority, :valid_from, :valid_until, :created_at, :updated_at
json.url temporal_task_url(temporal_task, format: :json)