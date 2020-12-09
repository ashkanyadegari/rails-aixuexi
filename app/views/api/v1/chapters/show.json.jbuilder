json.extract! @chapter, :id, :name, :description, :is_completed
json.photos @chapter.photo.attachments.map { |photo| "https://lewagon.oss-cn-beijing.aliyuncs.com/#{photo.key}" }

json.courses do
  json.array! @chapter.courses do |course|
    json.extract! course, :id, :name, :description
    json.photos course.photos.attachments.map { |photo| "https://lewagon.oss-cn-beijing.aliyuncs.com/#{photo.key}" }
  end
  end
