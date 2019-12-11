DB.create_table! :bookings do
  primary_key :id
  column :date, :datetime
  column :canceled, :boolean, default: false
  column :cinema_show_id, :integer

  index :id, :unique => true
end
