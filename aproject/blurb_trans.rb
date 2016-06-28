require_relative 'support/requests'
require_relative 'support/base'

class BlurbTranslation < RequestBase
  attr_accessor :blurb_ids, :culture_code

  def initialize(blurb_ids, culture_code)
    super(token,sessionid)
    @blurb_ids = blurb_ids
    @culture_code = culture_code
  end

  def get_blurbs_translation
    @serviceRequest =
        {
            :appVersion => APP_VERSION,
            :siteVersion => SITE_VERSION,
            :platform => PLATFORM,
            :productId => PRODUCT_ID,
            :culturecode => @culture_code,
            :countrycode => COUNTRY_CODE,
            :partnercode => PARTNER_CODE,
            :sessionId => @sessionid,
            :token => @token,
            :blurbIds => @blurb_ids
        }
    # puts @serviceRequest
    response = get_service_response(BLURB, @serviceRequest)
    # puts response["blurbTranslations"]
    response["blurbTranslations"] unless response.nil?
  end
end