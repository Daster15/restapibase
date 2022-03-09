module Networks
    class IndexFilter < Generic::IndexFilter
      FILTERS = {
       
        mac_filter: {
          apply?: ->(params) {
            params[:mac_address].is_a?(String)
          },
          apply: ->(scope, params) {
            scope.where(mac_address: params[:mac_address])
          }
        }.freeze,
        rssi_filter: {
          apply?: ->(params) {
            params[:rssi].is_a?(String)
          },
          apply: ->(scope, params) {
            scope.where(rssi: params[:rssi])
          }
        }.freeze,
        ssid_filter: {
          apply?: ->(params) {
            params[:ssid].is_a?(String)
          },
          apply: ->(scope, params) {
            scope.where('ssid ILIKE ?', "%#{params[:ssid]}%")
          }
        }.freeze,
        by_date_filter: {
          apply?: ->(params) {
            params[:by_date_from].is_a?(Date) && params[:by_date_to].is_a?(Date)
          
          },
          apply: ->(scope, params) {
            scope.where("created_at >= ? AND created_at <= ?", params[:by_date_from], params[:by_date_to])
          }
        }.freeze,
        event_name_filter: {
          apply?: ->(params) {
            params[:event_name].is_a?(String)
          },
          apply: ->(scope, params) {
            scope.where('event_name ILIKE ?', "%#{params[:event_name]}%")
          }
        }.freeze
      }.freeze
  
      def self.filters
        FILTERS
      end
    end
end