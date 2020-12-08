    json.extract! @course, :id, :name, :description, :video, :wechat, :chapter_id
    json.photos @course.photos.attachments.map { |photo| photo.service_url }
    json.files @video_url

