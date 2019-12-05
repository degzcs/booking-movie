migration "create booking table" do
  database.create_table! :bookings do
    primary_key :id
    datetime    :date
    integer :movie_id

    index :id, :unique => true
  end
end
