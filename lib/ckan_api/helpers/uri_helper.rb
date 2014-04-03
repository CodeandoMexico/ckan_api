def get_uri_query_values(query_values)
  uri = Addressable::URI.new
  uri.query_values = query_values
  uri.query
end

def form_request_url(action, query_params={})
  query_values = get_uri_query_values(query_params)
  action + "?#{query_values}"
end
