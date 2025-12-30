json.extract! course, :id, :marathon_id, :name, :capacity, :created_at, :updated_at
json.url course_url(course, format: :json)
