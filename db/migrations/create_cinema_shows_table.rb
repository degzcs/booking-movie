DB.create_table? :cinema_shows do
  primary_key :id
  DateTime :date
  Integer :movie_id

  index :id, :unique => true
end
