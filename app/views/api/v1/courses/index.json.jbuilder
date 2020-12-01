json.courses do
  json.array! @courses do |course|
    json.extract! course, :id, :name, :description
    json.photos course.photos.attachments.map { |photo| "https://lewagon.oss-cn-beijing.aliyuncs.com/#{photo.key}" }
  end
end
