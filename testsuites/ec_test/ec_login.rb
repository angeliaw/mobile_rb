require_relative '../../aproject/support/env'

describe (StudyContext) do
  describe("login as regular EC student") do
    before do
      @user = UserLogin.new('regular')
    end

    it("it should response with correct enrollments") do
      enrollments = StudyContext.new(@user.token,@user.sessionid).get_enrollments
      enrollments[0]["courseId"].must_equal(10000014)
      enrollments[0]["courseTypeCode"].must_equal('GE')
    end
  end

  describe ("login as a mini student") do
    before do
      @user = UserLogin.new('mini')
    end

    it("it should response with correct enrollments") do
      enrollments = StudyContext.new(@user.token,@user.sessionid).get_enrollments
      # puts enrollments
      enrollments[0]["courseId"].must_equal(10000014)
      enrollments[0]["courseTypeCode"].must_equal('GE')
    end
  end

  describe ("login as a cool student") do
    before do
      @user = UserLogin.new('cool')
    end

    it("it should response with correct enrollments") do
      enrollments = StudyContext.new(@user.token,@user.sessionid).get_enrollments
      # puts enrollments
      enrollments[0]["courseId"].must_equal(10000014)
      enrollments[0]["courseTypeCode"].must_equal('GE')
    end
  end

  describe ("login as a v1.0 cool student") do
    before do
      @user = UserLogin.new('coolv1')
    end

    it("it should pop up an alert telling student to download 1.0 app") do
      error = StudyContext.new(@user.token,@user.sessionid).get_error
      puts error[1]
      error[0].must_equal(108)
    end
  end

  describe ("login as an EC student who is studying SPIN course") do
    before do
      @user = UserLogin.new('ecspin')
    end

    it("it should pop up an alert telling student that he's studying unsupported content") do
      error = StudyContext.new(@user.token,@user.sessionid).get_error
      puts error[1]
      error[0].must_equal(112)
    end
  end

  describe ("login as an EC student who is studying high level current app doesn't support") do
    before do
      @user = UserLogin.new('echighlevel')
    end

    it("it should pop up an alert telling student that he's studying unsupported content") do
      error = StudyContext.new(@user.token,@user.sessionid).get_error
      puts error[1]
      error[0].must_equal(112)
    end
  end

end