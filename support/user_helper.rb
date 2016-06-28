# TODO
# user helper, will include information for users
require_relative 'env'

class StudentManager

  def self.student_from_account(account_type)
    Student.new(username_for_account(account_type))
  end

  def self.username_for_account(account_type)
    fail(msg="Couldn't identify account type #{account_type}") if USERS_MATRIX[account_type].nil?
    username = USERS_MATRIX["#{account_type}"]
    fail(msg="Couldn't find a username for account #{account_type} on environment #{ENV['SERVER']}") if username.nil?
    username
  end

  def self.password_for_account(account_type)
    username = self.username_for_account(account_type)
    password = USERS_MAP[username.downcase]
    fail(msg="Couldn't find a password for username #{username} on environment #{ENV['SERVER']}") if password.nil?
    password
  end

end

class Student
  @username = nil

  def initialize(username)
    @username = username
  end

  def is_account_type?(account_type)
    StudentManager.username_for_account(account_type).downcase == @username
  end

  # Login credentials
  def login_credentials
    password = USERS_MATRIX[@username.downcase]
    fail(msg="Couldn't find a password for username #{username} on environment #{ENV['SERVER']}") if password.nil?
    {:username => @username, :password => password }
  end

  # Username that is shown inside settings
  def same_visible_username?(username)
    real_username.downcase == username.downcase
  end

  # Real username to be used for e.g. score submit helper
  def real_username
    defined?(USERS_MAP) ? USERS_MAP[@username] : @username
  end

end