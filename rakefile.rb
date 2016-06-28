require "rake"
require "rake/testtask"

task :default => [:test] # you can use rake to run tests

Rake::TestTask.new(:test) do |test|
  test.libs << "test" << 'lib'
  test.test_files = Dir["testsuites/api_test/api_*.rb" ]
  test.verbose = true
end

Rake::TestTask.new(:test_ec) do |test_ec|
  test_ec.libs << "test"
  test_ec.test_files = Dir["testsuites/ec_test/ec_*.rb" ]
  test_ec.verbose = true
end