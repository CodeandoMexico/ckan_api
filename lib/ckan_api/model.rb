module CkanApi
  class Model
    protected

    def self.base
      CkanApi::Config.api_url
    end

    def self.action=(action)
      @action = action
    end

    def self.action
      base + @action
    end

    def self.get_json_data(address)
      JSON.parse(open(address).read)
    end

    def self.post_json_data(address, auth_key, body)
      uri = URI.parse(address)
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Post.new(uri.request_uri)
      request.add_field('Authorization', auth_key)
      request.body = body.to_json()
      response = http.request(request)
      JSON.parse(response.body)
    end

  end
end
