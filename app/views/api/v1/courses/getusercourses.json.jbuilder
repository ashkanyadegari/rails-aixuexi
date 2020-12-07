json.courses do
  json.array! @courses do |course|
    json.extract! course, :id, :is_completed
    json.data course.course
    json.photo course.course.photos[0].service_url
  end
end
