migration "create movies table" do
  database.create_table :movies do
    primary_key :id
    text        :name
    text        :description
    text        :url
    text        :image
    array       :booked_days

    index :id, :unique => true
  end
end
