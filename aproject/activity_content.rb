require_relative 'support/requests'
require_relative 'support/base'

class Activity < RequestBase
  attr_accessor :activity_id, :sessionid, :token

  def initialize(activity_id,token = self.token, sessionid = self.sessionid)
    super(token,sessionid)
    @activity_id = activity_id
  end

  def get_activity_content
    @special =
        {
            :activities => @activity_id,
            :isDebug => ISDEBUG
        }
    @serviceRequest = self.serviceRequestBase.merge(@special)
    response = get_service_response(ACTIVITY_CONTENT, @serviceRequest)
    return response["activities"] unless response.nil?
  end

end
