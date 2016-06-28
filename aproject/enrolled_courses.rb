require_relative 'support/requests'
require_relative 'support/base'

class EnrolledCourses < RequestBase

  def initialize(token = self.token, sessionid = self.sessionid)
    super(token,sessionid)
    @token = token
    @sessionid = sessionid
  end

  def get_level_ids
    @serviceRequest = self.serviceRequestBase
    response = get_service_response(ENROLLED_COURSES, @serviceRequest)
    courses = response["enrollments"] unless response.nil?
    level_id = Array.new
    courses.each do |course|
      all_levels = course["levels"]
      all_levels.each do |each_level|
        level_id.push(each_level["levelId"])
      end
    end
    level_id
  end
end