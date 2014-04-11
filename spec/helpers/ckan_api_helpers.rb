module Helpers
  def generate_random_string
    o = [('a'..'z')].map { |i| i.to_a }.flatten
    (0...50).map { o[rand(o.length)] }.join
  end
end
