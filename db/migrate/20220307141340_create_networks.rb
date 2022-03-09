class CreateNetworks < ActiveRecord::Migration[6.1]
  def change
    create_table :networks do |t|
      t.string :ssid
      t.integer :rssi
      t.string :mac_address
      t.jsonb :location, null: false, default: '{}'
      t.timestamp :created_at
      t.string :event_name
    end
    add_index :networks, :location, using: :gin
    add_index :networks, :ssid
  end

end
