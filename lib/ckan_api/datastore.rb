require_relative 'helpers/uri_helper'

module CkanApi
  class Datastore < Model

    # The search action allows you to search data
    # in a resource.
    def self.search(resource_id, options={})
      self.action = 'action/datastore_search'
      options[:resource_id] = resource_id
      request_url = form_request_url(self.action, options)
      json_data = get_json_data(request_url)
      json_data['result']
    end

    # The search_sql action allows a user
    # to search data in a resource or connect multiple
    # resources with join expressions using sql.
    def self.search_sql(sql)
      self.action = 'action/datastore_search_sql'
      request_url = form_request_url(self.action, {sql: sql})
      json_data = get_json_data(request_url)
      json_data['result']
    end

  end
end
