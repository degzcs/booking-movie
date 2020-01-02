DB.create_table? :bookings do
  primary_key :id
  DateTime :date
  column :canceled, :boolean, default: false
  Integer :cinema_show_id

  index :id, :unique => true
end
