require 'tiny_tds'
require_relative 'base'
require_relative 'env'

module ConnectDB

  # execute sql query by name of the sql query, set_value default is nil
  # example:
  #     ConnectDB.execute_sql_query(sql_query_name,set_value)
  def ConnectDB::execute_sql_query(sql_query_name,set_value=nil)
    unless set_value
      query = Base.read_sql(sql_query_name)
    else
      query = Base.read_sql_by_change_set(sql_query_name,set_value.to_s)
    end
    self.connect_db_and_execute_sql(DATABASE["username"],DATABASE["password"],DATABASE["host"],query) unless query.nil?
  end

  # connect to defined server and execute your sql query
  def ConnectDB::connect_db_and_execute_sql(username,password,host,sql_query)
    client = TinyTds::Client.new({:username => username, :password => password, :host => host,:database => 'ET_Main',:tds_version => '7.1'})
    puts client.tds_version_info
    result = client.execute(sql_query)
    rows = []
    result.each do |row|
      rows.push row
    end
    client.close
    rows
  end

end

