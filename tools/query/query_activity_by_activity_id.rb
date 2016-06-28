# <---- query activity by giving activity id ---->

# put activity ids in /input/xx.txt, then run this file
# will export activities location to output/activities.location.txt


require_relative '../../support/connect_db'

path = File.absolute_path("../../output/", File.dirname(__FILE__))
file = File.join(path, "activities_location.txt")
file = File.new(file,"a+") unless File.exist?(file)

File.open(file,"w") do |file|
  activity_ids = Base.read_file_txt('activity_ids')
  activity_ids.each do |activity_id|
    qresult = ConnectDB.execute_sql_query('query_activity_by_activity_id',activity_id[3, 8])
    activity_location = ""
    unless qresult.nil?
      activity_location  << qresult[0]["LevelNo"].to_s << '.'<< qresult[1]["UnitNo"].to_s << '.'<< qresult[2]["LessonNo"].to_s << '.'<< qresult[3]["StepNo"].to_s << '.'<< qresult[4]["ActivityNo"].to_s
    end
    file.puts(activity_location)
  end
end
