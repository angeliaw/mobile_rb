require_relative '../../aproject/support/env'

describe(Progress) do
  describe 'verify progress' do
    describe("login as a valid student account") do
      token = ""
      sessionid = ""

      before do
        login = UserLogin.new('regular')
        token = login.token
        sessionid = login.sessionid
      end

      it("pull progress") do
        p = Progress.new(token,sessionid)
        p.lessons = ["40009648","40009647","40009641"]
        p.modules = ["150049319","150049345","150049350"]
        p.get_lessons_state[40009648].must_equal(2)
        p.get_lessons_state[40009647].must_equal(5)
        p.get_lessons_state[40009641].must_equal(6)
        p.get_modules_score[150049319].must_equal(100)
        p.get_modules_score[150049350].must_equal(50)
      end

      it("save progress") do
        s = SaveProgress.new(token, sessionid)
        module_score =
            {
                "moduleId" => 150046554,
                "score" =>  100,
                "startDateTime" =>  0,
                "completionDateTime" =>  1464938578.682328,
                "hasPassed" =>  true
            }
        s.progress = [module_score]
        save_result = s.save_progress["lessons"]
        save_result[0]["lessonState"].must_equal(2)
      end
    end
  end
end
