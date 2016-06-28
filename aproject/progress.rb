require_relative 'support/requests'
require_relative 'support/base'

class Progress < RequestBase
  attr_accessor :lessons, :modules, :serviceRequest

  def initialize(token = self.token, sessionid = self.sessionid, lessons_id = nil, modules_id = nil)
    super(token, sessionid)
    @lessons = lessons_id
    @modules = modules_id
  end

  def pull_progress
    @special =
        {
            :lessons => @lessons,
            :modules => @modules
        }
    @serviceRequest = self.serviceRequestBase.merge(@special)
    response = get_service_response(PROGRESS,@serviceRequest)
    response["progress"] unless response.nil?
  end

  def get_lessons_state
    lessons = pull_progress["lessons"]
    lessons_state = {}
    lessons.each do |each_lesson|
      lessons_state.store(each_lesson["lessonId"],each_lesson["lessonState"])
    end
    lessons_state
  end

  def get_modules_score
    modules = pull_progress["modules"]
    modules_score = {}
    modules.each do |each_module|
      modules_score.store(each_module["moduleId"],each_module["score"])
    end
    modules_score
  end

end