module CkanApi
  class Datastore < Model

    # The search action allows you to search data
    # in a resource.
    def self.search(resource_id, options={})
      self.action = 'action/datastore_search'
      options[:resource_id] = resource_id
      uri = Addressable::URI.new
      uri.query_values = options
      request_url = self.action + "?#{uri.query}"
      json_data = get_json_data(request_url)
      json_data['result']
    end

  end
end
