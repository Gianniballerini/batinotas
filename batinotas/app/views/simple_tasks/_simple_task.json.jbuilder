json.extract! simple_task, :id, :description, :state, :priority, :created_at, :updated_at
json.url simple_task_url(simple_task, format: :json)