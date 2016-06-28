require_relative '../../aproject/support/env'


describe(CourseStructure) do
  describe("login as a valid student account") do
    token = ""
    sessionid = ""

    before do
      login = UserLogin.new('regular')
      token = login.token
      sessionid = login.sessionid
    end

    it("get course structure of one level") do
      ec = EnrolledCourses.new(token,sessionid)
      cs = CourseStructure.new(ec.get_level_ids[10],token,sessionid)
      cs.get_level_title.must_equal("11-Upper Intermediate")
    end

  end
end

