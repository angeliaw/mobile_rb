require_relative '../../aproject/support/env'

no_image_units = []
no_image_lessons = []

ul = UserLogin.new('','')
ec = EnrolledCourses.new(ul.login[0],ul.login[1])
# level_ids = ec.get_level_ids
# cs = CourseStructure.new(level_ids[0],ul.login[0],ul.login[1])
# puts cs.get_course_structure
# puts cs.get_level_title
# puts cs.get_units_version
# puts cs.get_units_titles
# puts cs.get_level_course_version

ec.get_level_ids.each do |level_id|
  cs = CourseStructure.new(level_id,ul.login[0],ul.login[1])
  puts cs.get_level_course_version
  puts cs.get_level_title
  no_image_units.push cs.check_unit_lesson_image[0]
  no_image_lessons.push cs.check_unit_lesson_image[1]
end

puts no_image_units
puts no_image_lessons
puts "all units have images" if no_image_units.length == 0
puts "all lessons have images" if no_image_lessons.length == 0