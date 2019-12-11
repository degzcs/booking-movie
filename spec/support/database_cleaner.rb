RSpec.configure do |config|

  before :suite do
    Sequel.connect(ENV.fetch('DATABASE_URL'))
  end

  config.before(:each) do
    existing_tables = Sequel::Model.db.tables
    tables_to_preserve = [:schema_info, :schema_migrations, :migrations]
    tables_to_be_emptied = existing_tables - tables_to_preserve
    tables_to_be_emptied.each do |table|
      Sequel::Model.db[table].delete
    end
  end
end

