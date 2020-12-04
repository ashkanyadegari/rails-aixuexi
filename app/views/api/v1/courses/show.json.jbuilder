    json.extract! @course, :id, :name, :description
    json.photos @course.photos.attachments.map { |photo| "https://lewagon.oss-cn-beijing.aliyuncs.com/#{photo.key}" }
    # @course.file.service_url.blank? ? '' : json.files @course.file.service_url

