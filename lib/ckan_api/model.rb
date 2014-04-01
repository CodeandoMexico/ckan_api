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

  end
end
