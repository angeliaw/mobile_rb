require_relative 'support/requests'
require_relative 'support/base'

class CourseStructure < RequestBase
  attr_accessor :level_id, :level_title, :units,
                :course_version

  def initialize(level_id,token = self.token,sessionid = self.sessionid)
    super(token,sessionid)
    @level_id = level_id
    @activity_ids = []

    json_data = get_course_structure
    if json_data
      @course_version = json_data["courseVersion"]
      @level_title = json_data["title"]
      @units = json_data["units"]
    end
  end

  def get_course_structure
    @special =
        {
            :level => @level_id,
            :isDebug => ISDEBUG
        }
    @serviceRequest = self.serviceRequestBase.merge(@special)
    response = get_service_response(COURSE_STRUCTURE, @serviceRequest)
    response["level"] unless response.nil?
  end

  def get_level_course_version
    get_course_structure["courseVersion"]
  end

  def get_level_title
    get_course_structure["title"]
  end

  def get_details_of_structure
    units_info = {}
    units_version = {}
    unit_ids = []
    lesson_ids = []
    module_ids = []

    units = get_course_structure["units"]
    units.each do |each_unit|
      units_info.store(each_unit["unitId"],each_unit["title"])
      units_version.store(each_unit["unitId"],each_unit["courseVersion"])
      unit_ids.push(each_unit["unitId"])
      lessons = each_unit["lessons"]
      lessons.each do |each_lesson|
        lesson_ids.push(each_lesson["lessonId"])
        modules = each_lesson["modules"]
        modules.each do |each_module|
          module_ids.push(each_module["moduleId"])
        end
      end
    end
    return units_info, units_version,unit_ids,lesson_ids, module_ids
  end

  def get_units_titles
    get_details_of_structure[0]
  end

  def get_units_version
    get_details_of_structure[1]
  end

  def get_units_id
    get_details_of_structure[2]
  end

  def get_lessons_id
    get_details_of_structure[3]
  end

  def get_modules_id
    get_details_of_structure[4]
  end

  def check_unit_lesson_image
    no_image_unit_ids = []
    no_image_lesson_ids = []
    units = get_course_structure["units"]
    units.each do |each_unit|
      if !each_unit.keys.include?("imagePath")
        no_image_unit_ids.push each_unit["unitId"]
      end

      lessons = each_unit["lessons"]
      lessons.each do |each_lesson|
        if !each_lesson.keys.include?("imagePath")
          no_image_lesson_ids.push each_lesson["lessonId"]
        end
      end
    end
    return no_image_unit_ids, no_image_lesson_ids
  end

end
