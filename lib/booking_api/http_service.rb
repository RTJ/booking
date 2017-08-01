module BookingApi
  class HttpService
    attr_accessor :username, :password

    def initialize(username: nil, password: nil)
      @username = username || BookingApi.username
      @password = password || BookingApi.password
    end

    def connection
      @connection ||= begin
        Faraday.new(:url => 'https://distribution-xml.booking.com') do |faraday|
          faraday.basic_auth username, password
          faraday.response :json, :content_type => /\bjson$/
          faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        end
      end
    end

    def secure_connection
      @connection ||= begin
        Faraday.new(:url => 'https://secure-distribution-xml.booking.com') do |faraday|
          faraday.basic_auth username, password
          faraday.response :json, :content_type => /\bjson$/
          faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        end
      end
    end

    def connection
      @connection ||= begin
        Faraday.new(:url => 'https://distribution-xml.booking.com') do |faraday|
          faraday.basic_auth username, password
          faraday.response :json, :content_type => /\bjson$/
          faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        end
      end
    end

    def request_post(url, data)
      connection.post do |req|
        req.url url
        req.headers['Content-Type'] = 'application/json'
        req.body = data.to_json
      end
    end

    def request_get(url, data)
      connection.get do |req|
        req.url url
        req.headers['Content-Type'] = 'application/json'
        req.body = data.to_json
      end
    end

    def secure_request_post(url, data)
      secure_connection.post do |req|
        req.url url
        req.headers['Content-Type'] = 'application/json'
        req.body = data.to_json
      end
    end

    def secure_request_get(url, data)
      secure_connection.get do |req|
        req.url url
        req.headers['Content-Type'] = 'application/json'
        req.body = data.to_json
      end
    end

  end
end
