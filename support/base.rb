require 'yaml'

module Base

  # load all yaml files in config folder
  def Base::load_yamls
    config = File.expand_path("../config", File.dirname(__FILE__))
    Dir[File.join(config, '*.yml')].map {|file| [File.basename(file, '.yml').to_s, YAML.load_file(file)]}
  end

  def Base::read_yaml(filename)
    path = File.absolute_path("../config", File.dirname(__FILE__))
    file = File.join(path, "#{filename}.yml")
    if File.exist?(file)
      YAML.load_file(file)
    else
      warn('cannot find the yml file '+ filename)
    end
  end

  def Base::read_sql(filename)
    path = File.absolute_path("../sqlquery/", File.dirname(__FILE__))
    file = File.join(path, "#{filename}.sql")
    sql_query = ''
    if File.exist?(file)
      content = IO.readlines(file)
      content.each do |line|
        sql_query << line.to_s
      end
    else
      warn('cannot find the sql query '+ filename)
    end
    sql_query
  end

  # for this kind of sql should have only one set
  def Base::read_sql_by_change_set(filename,set_value)
    path = File.absolute_path("../sqlquery/", File.dirname(__FILE__))
    file = File.join(path, "#{filename}.sql")
    sql_query = ''
    if File.exist?(file)
      content = IO.readlines(file)
      content.each do |line|
        if line.include?('SET')|line.include?('set')
          new_set = line.to_s.split('=')[0].strip
          new_set << "=" << set_value
          line = new_set.to_s
        end
        sql_query << line.to_s
      end
    else
      warn('cannot find the sql query '+ filename)
    end
    sql_query
  end

  # read text file
  def Base::read_file_txt(filename)
    path = File.absolute_path("../input", File.dirname(__FILE__))
    file = File.join(path,"#{filename}.txt")
    details = []
    if File.exist?(file)
      content = IO.readlines(file)
      content.each do |line|
        details.push line.chomp
      end
    end
    details
  end

end

