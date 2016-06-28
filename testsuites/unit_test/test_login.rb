require 'minitest/spec'
require 'minitest/autorun'
require_relative '../aproject/support/env'

describe (UserLogin) do
  describe("user login as B2B student") do
    before do
      @user = UserLogin.new("", "")
    end

    it("memberid should be correct") do
      @user.login[3].must_equal(23828401)
    end

    it("dataStore should be correct") do
      @user.login[2].must_equal('us1')
    end
  end
end