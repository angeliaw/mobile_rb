require_relative '../../aproject/support/env'

describe (UserLogin) do
  describe("login as nonexisting student") do
    before do
      @user = UserLogin.new('nonexisting')
    end

    it("it should response with errorcode and error description") do
      @user.token.must_be_nil
      @user.sessionid.must_be_nil
      @user.errorcode.must_equal(1101)
      @user.errorDescription.must_equal('Login failed!')
    end
  end
end

describe (UserLogin) do
  describe("login as valid regular student") do
    before do
      @user = UserLogin.new('regular')
    end

    it("it should response token and session") do
      @user.token.wont_be_nil || @user.sessionid.wont_be_nil
    end
  end
end

describe (UserLogin) do
  describe("login as valid student with wrong password") do
    before do
      @user = UserLogin.new('wrong_password')
    end

    it("it should response with errorcode and errormessage") do
      @user.token.must_be_nil
      @user.errorcode.must_equal(1101)
      @user.errorDescription.must_equal('Login failed!')
    end
  end
end

# describe(StudyContext) do
#   describe("login as v1 corporate student") do
#     before do
#       @user = UserLogin.new('v1b2b')
#     end
#
#     it("it should response with an alert telling student what happen") do
#       error = StudyContext.new(@user.token,@user.sessionid).get_error
#       puts error[0], error[1]
#     end
#   end
# end