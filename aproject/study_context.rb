require_relative 'support/env'

class StudyContext < RequestBase
  attr_accessor :errorCode, :errorDes, :errorMeta

  def initialize(token = self.token, sessionid = self.sessionid)
    super(token, sessionid)
  end

  def get_study_context
    @serviceRequest =
        {
            :appVersion => APP_VERSION,
            :culturecode => CULTURE_CODE,
            :platform => PLATFORM,
            :productId => PRODUCT_ID,
            :siteVersion => SITE_VERSION,
            :sessionId => @sessionid,
            :token => @token
        }
    response = get_service_response(STUDY_CONTEXT,@serviceRequest)
    response unless response.nil?
  end

  def get_bootstrap_settings
    return get_study_context["context"]["settings"] if get_study_context["context"]
  end

  def get_enrollments
    return get_study_context["context"]["enrollments"] if get_study_context["context"]
  end

  def get_student_profile
    return get_study_context["context"]["profile"] if get_study_context["context"]
  end

  def get_error
    return get_study_context["errorCode"], get_study_context["errorMetaData"] if get_study_context["errorCode"]
  end

end