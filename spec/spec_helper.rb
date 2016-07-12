require('pg')
require('rspec')
require ('patient')
require ('doctor')
require ('specialty')
require('pry')

DB = PG.connect({:dbname => "office_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors *;")
    DB.exec("DELETE FROM patients *;")
    DB.exec("DELETE FROM specialty *;")
  end
end
