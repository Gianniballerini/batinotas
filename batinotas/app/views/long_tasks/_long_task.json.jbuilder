json.extract! long_task, :id, :description, :state, :priority, :percentage, :created_at, :updated_at
json.url long_task_url(long_task, format: :json)