require_relative 'helpers/uri_helper'

#   Package CKAN API doc:
#   http://ckan.readthedocs.org/en/ckan-2.2/api.html
module CkanApi
  class Package < Model

    # Create a new package (dataset).
    # Note that one must be authorized to create datasets
    # If you specify a group, you must be authorized
    # to add data to that grouop as well
    # Params:
    # +name+:: Name of the new package
    # +body_params+:: hash object storing CKAN API params
    def self.create(name, api_key, body_params={})
      self.action = 'action/package_create'
      body_params['name'] = name
      post_request(self.action, api_key, body_params)
    end

    # Deletes a package (dataset)
    # Note that one must be authorized to delete datasets
    # Params:
    # +id+:: the id or name of the package to delete
    def self.delete(id, api_key)
      self.action = 'action/package_delete'
      post_request(self.action, api_key, {id: id})
    end

    # Updates a package (dataset)
    # Note that one must be authorized to update datasets
    # Params:
    # +id+:: the id or name of the package to delete
    # +body_params+:: hash object storing CKAN API params of
    #   package create
    # All fields are modifiable except the name of the package
    def self.update(id, api_key, options={})
      self.action = 'action/package_update'
      #Clones options to avoid problems in tests
      body_params = options.clone
      body_params['id'] = id
      post_request(self.action, api_key, body_params)
    end

    # Return a list of the names of the site’s
    # datasets (packages).
    # Params:
    # +options+:: hash object storing CKAN API params
    def self.list(options={})
      self.action = 'action/package_list'
      get_request(self.action, options)
    end

    # Searches for packages satisfying a given search criteria.
    # Params:
    # +options+:: hash object storing CKAN API params
    def self.search(options={})
      self.action = 'action/package_search'
      get_request(self.action, options)
    end

    # Return the metadata of a dataset (package) and its resources.
    # Params:
    # +package_id+:: id or name of package to show
    # +options+:: hash object storing CKAN API params
    def self.show(package_id, options={})
      self.action = 'action/package_show'
      options['id'] = package_id
      get_request(self.action, options)
    end

  end
end
