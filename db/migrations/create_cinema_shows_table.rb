DB.create_table! :cinema_shows do
  primary_key :id
  column :date, :datetime
  column :movie_id, :integer

  index :id, :unique => true
end
