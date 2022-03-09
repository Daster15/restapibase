class Network < ApplicationRecord

    #JSON_SCHEMA = Pathname.new(Rails.root.join('config', 'schemas', 'location.json'))
  
    validates :ssid, presence: true
    validates :rssi, numericality: { in: -20..-80 }
    validates :event_name, presence: true
    validates :location, presence: true 
    validates :location, presence: true
    validates :mac_address, presence: true
end
