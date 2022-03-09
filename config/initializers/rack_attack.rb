class Rack::Attack
    throttle("req/ip", :limit => 500, :period => 1.minute) do |req| 
      req.remote_ip if req.path == "/"
    end
end