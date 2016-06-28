require_relative 'support/env'

class UserLogin < RequestBase
  attr_reader :token, :sessionid, :errorcode, :errorDescription

  def initialize(username,password=nil,product_id=nil,platform=nil,app_version=nil)
    # could use account type without password
    if password.nil?
      @username = StudentManager.username_for_account(username)
      @password = StudentManager.password_for_account(username)
    else
      @username = username
      @password = password
    end

    product_id.nil? ? @productid = PRODUCT_ID : @productid = product_id
    platform.nil? ? @platform = PLATFORM : @platform = platform
    app_version.nil? ? @appversion = APP_VERSION : @appversion = app_version

    success = get_token_session
    unless success.nil?
      @token = success[0]
      @sessionid = success[1]
    end

    errors = get_errors
    unless errors.nil?
      @errorcode = errors[0]
      @errorDescription = errors[1]
    end
  end

  def login
    @serviceRequest =
        {
            :productId => @productid,
            :platform => @platform,
            :appVersion => @appversion,
            :userName => @username,
            :password => @password
        }
    login_res = get_service_response(LOGIN_URL,@serviceRequest)
    return login_res unless login_res.nil?
  end

  def get_token_session
    return login["token"],login["sessionId"] if login["token"]
  end

  def get_errors
    return login["errorCode"],login["errorDescription"] if login["errorCode"]
  end

end

