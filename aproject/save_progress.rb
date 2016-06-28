require_relative 'support/env'

class SaveProgress < RequestBase
  attr_accessor  :progress, :hasPassed, :moduleId, :score, :startDateTime, :compeletionDateTime

  def initialize(token = self.token, sessionid = self.sessionid)
    super(token, sessionid)
    @progress_body =
        {
            :hasPassed => @hasPassed,
            :moduleId => @moduleId,
            :score => @score,
            :startDateTime => @startDateTime,
            :compeletionDateTime => @compeletionDateTime
        }
    @progress = []
  end

  def save_progress
    @special =
        {
            :progress => @progress
        }
    @serviceRequest = self.serviceRequestBase.merge(@special)
    response = get_service_response(SAVE_PROGRESS,@serviceRequest)
    response["progress"]
  end

end