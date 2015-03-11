Ruby gem to access Hubs3D
=========================

Ye be warned: this has not been tested in production.

Example usage
-------------

```rb
require "hubs3d"

Hubs3D.configure do |c|
  c.oauth_key = "YOUR_API_KEY_HERE"
  c.oauth_secret = "YOUR_API_SECRET_HERE"
end

# Upload a model get its id
model = Hubs3D::Model.new(path: "/path/to/example.stl",
                          name: "example.stl")
model.id # => 42

# Create a cart and get its url
cart = Hubs3D::Cart.new
cart << model
cart.url # => "http://3dhubs.com/…"
```
