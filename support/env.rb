# encoding: utf-8

require 'minitest'
require 'minitest/autorun'
require 'minitest/spec'

require_relative 'test_helper'

require_relative 'base'
require_relative 'config'
require_relative 'connect_db'

require_relative 'global'
require_relative 'user_helper'
require_relative 'languages'

# Default settings in case environment variables hasn't been set
ENV['SERVER'] = 'dev' if ENV['SERVER'].nil? # could be TEST, QA or LIVE
ENV['PRODUCT'] = 'b2c' if ENV['PRODUCT'].nil?

ENV['CONNECT_TIMEOUT'] = '90' if ENV['CONNECT_TIMEOUT'].nil?

ENV['DEFAULT_LANGUAGE'] = "English"

# Always use downcase
ENV['SERVER'] = ENV['SERVER'].downcase
ENV['PRODUCT'] = ENV['PRODUCT'].downcase

# Read the configuration files
puts "Configuring for product #{ENV['PRODUCT']}, environment #{ENV['SERVER']}"
config = Config.read_config(ENV['PRODUCT'], ENV['SERVER'])

# Setup global constants
SERVER = config[:server]
USERS_MATRIX = config[:users_matrix]
USERS_MAP = config[:users_map]
APP_INFO = config[:app_info]
DATABASE = config[:db_list]
REGISTER = config[:checkout_server]

# hosts
HOST = "http://#{SERVER}.xx.com"
REGISTER_HOST = "https://#{REGISTER}.xx.com"

# tools
REGISTER_URL = "#{REGISTER_HOST}/checkout/payment/index?ctr=fr&lng=en&debug=ccval=false"

PRODUCT_ID = APP_INFO["productid"]
APP_VERSION = APP_INFO["appversion"]
PLATFORM = APP_INFO["platform"]
COUNTRY_CODE = APP_INFO["countrycode"]
CULTURE_CODE = APP_INFO["culturecode"]
PARTNER_CODE = APP_INFO["partnercode"]
SITE_VERSION = 'development'
ISDEBUG = 'False'