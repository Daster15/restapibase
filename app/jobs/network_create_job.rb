class NetworkCreateJob < ApplicationJob
    queue_as :default
    
    def perform(params)
        CreateNetworkService.new(params).save_network
    end
end