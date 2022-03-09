class CreateNetworkService 
    
    def initialize(params)
        @ssid = params[:ssid]
        @rssi = params[:rssi]
        @event_name = params[:event_name]
        @location = params[:location]
        @mac_address = params[:mac_address]
    end

    def save_network
        begin
         network =  Network.create!(save_attributes)     
        rescue StandardError => e
            work_result(OpenStruct.new({success?: false, error: e}) )
        else
            work_result(OpenStruct.new({success?: true, payload: network}) ) 
        end
    end

    def work_result(e)
        puts e.to_s
        # agregate results ( true or false ) to another service or database
    end

    private 

    attr_reader :ssid, :rssi, :event_name, :location, :mac_address

    def save_attributes
        {
            ssid: ssid,
            rssi: rssi,
            event_name: event_name,
            location: location,
            mac_address: mac_address
        }
    end
end