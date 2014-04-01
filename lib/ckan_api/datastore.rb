module CkanApi
  class Datastore < Model

    def self.search(resource_id, options={})
      self.action = 'action/datastore_search'
      url = self.action + "?resource_id=#{resource_id}"
      url += "&#{options.to_query}" unless options.empty?
      json_data = get_json_data(url)
      result = json_data['result']
    end

  end
end
