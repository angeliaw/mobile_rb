require_relative 'aproject/support/env'

# puts Base.translation("General English", "简体中文")
# puts Base.translation("Business English", "Türkçe")
#
# puts USERS_MATRIX["regular"]
# puts USERS_MAP[USERS_MATRIX["regular"]]

# puts Language.new.LanguageCultureName["HKChinese"]

# u = UserLogin.new('','','1','Android','1.0.0')
# puts u.token
# puts u.sessionid

# ul = UserLogin.new('regular')
# ul.login
# puts ul.token
# puts ul.sessionid

# ul = UserLogin.new(USERS_MATRIX["regular"],USERS_MAP[USERS_MATRIX["regular"]])
# puts ul.token
# puts ul.sessionid
#
# ul1 = UserLogin.new('','')
# puts ul1.errorcode
# puts ul1.errorDescription
#



# ec = EnrolledCourses.new(ul.token,ul.sessionid)
# puts ec.get_level_ids

# ac = Activity.new([160180213,160180214,160180215], ul.token,ul.sessionid)
# puts ac.get_activity_content

# ac = Activity.new([160180213], ul.login[0],ul.login[1])
# puts ac.get_activity_content
#
# ac = Activity.new([160180214], ul.login[0],ul.login[1])
# puts ac.get_activity_content
#
# cs = CourseStructure.new(ec.get_level_ids[10],ul.token,ul.sessionid)
# cs = CourseStructure.new('20000525',ul.token,ul.sessionid)
# puts cs.level_title
# puts cs.get_units_titles
# puts cs.find_data_by_key()

# p = Progress.new(ul.token,ul.sessionid)
# p.lessons = ["40009648","40009647","40009641"]
# p.modules = ["150049319","150049345","150049350"]
# puts p.pull_progress
# puts p.get_lessons_state
# puts p.get_modules_score

# blurbs = [672871,658893]
# tr = BlurbTranslation.new(blurbs,'en')
# puts tr.get_blurbs_translation


@user = UserLogin.new('v1b2b')
puts StudyContext.new(@user.token,@user.sessionid).get_study_context


###########################################################
#
# puts Base.read_file_txt('activity_ids')[0]


# line = 'set @memberid'
#
# puts line.include?('SET')|line.include?('set')
#
# puts "aaa0" =~ /\d/
# puts /ab/i=~"123ABc"
#
# puts /units/i =~ "Units"
