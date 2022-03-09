class NetworkSerializer < ActiveModel::Serializer
  attributes :id, :ssid ,:rssi, :event_name, :location, :mac_address,:created_at

end
