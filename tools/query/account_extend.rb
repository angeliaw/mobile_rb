require_relative '../../support/env'

qresult = ConnectDB.execute_sql_query('account_extend',23837051)
puts qresult