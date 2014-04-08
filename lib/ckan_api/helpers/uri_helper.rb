def get_uri_query_values(query_values)
  uri = Addressable::URI.new
  uri.query_values = query_values
  uri.query
end

# Transforms a hash to a query uri
def hash_uri_encode(hash, separator="&")
  uri_array = []
  hash.each do |key, value|
    uri_array << "#{key}:#{value}"
  end
  uri_array.join(separator)
end

def form_request_url(action, query_params={})
  query_values = get_uri_query_values(query_params)
  action + "?#{query_values}"
end
