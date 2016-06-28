require 'httparty'

class RequestBase
  attr_accessor :serviceRequestBase, :token, :sessionid

  def initialize(token, sessionid)
    @sessionid = sessionid
    @token = token
    @serviceRequestBase =
        {
            :appVersion => APP_VERSION,
            :siteVersion => SITE_VERSION,
            :platform => PLATFORM,
            :productId => PRODUCT_ID,
            :culturecode => CULTURE_CODE,
            :countrycode => COUNTRY_CODE,
            :partnercode => PARTNER_CODE,
            :sessionId => @sessionid,
            :token => @token
        }
  end

  # @return [serviceResponse]
  def get_response(requestUrl,serviceRequest)
    @body =
        {
        :serviceRequest => serviceRequest
        }.to_json

    response = HTTParty.post(requestUrl, :body => @body, :headers => {'Content-Type' => 'application/json'})
    response
  end

  def get_response_code(requestUrl,serviceRequest)
    response = get_response(requestUrl,serviceRequest)
    response.code
  end

  def get_service_response(requestUrl,serviceRequest)
    response = get_response(requestUrl,serviceRequest)
    if response.code == 200
      response["serviceResponse"]
    elsif response.code == 500
      raise("500 error: request is incorrect or get bad response from server")
      return nil
    else
      warn("Other error: response has error")
      puts response
      return nil
    end
  end

  def check_service_response_code(response_code,expected_code)
    unless response_code == expected_code
      raise("ERROR: response code is not as expected!")
    end
  end

  def check_service_response(response,json_node,key,expected)
    container = []
    json_data = eval(response.to_s)
  end

end