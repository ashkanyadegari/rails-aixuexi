json.chapters do
  json.array! @chapters do |chapter|
    json.extract! chapter, :id, :name, :description, :is_completed
    json.photos chapter.photo.attachments.map { |photo| "https://lewagon.oss-cn-beijing.aliyuncs.com/#{photo.key}" }
    json.courses Course.where(chapter_id: chapter.id).count
  end
end
