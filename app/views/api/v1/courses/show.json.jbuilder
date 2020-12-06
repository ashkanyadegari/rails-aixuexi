    json.extract! @course, :id, :name, :description, :video, :wechat
    json.photos @course.photos.attachments.map { |photo| photo.service_url }
    json.files @video_url

