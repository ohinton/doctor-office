require('pg')
require('rspec')
require ('patient')
require ('doctor')

DB = PG.connect({:dbname => "office_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors *;")
    DB.exec("DELETE FROM patients *;")
  end
end
