Ruby gem to access 3DHub's API
==============================

Example usage
-------------

```rb
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

Install
-------

Add the following line to your Gemfile if you are using the `bundler` gem:

```rb
gem "hubs3d"
```


Development
-----------

To launch specs:

```sh
$ rake
```


License
-------

Created by Sunny Ripert for [Cults.](https://cults3d.com),
licensed under the MIT License.


See also
--------

- http://docs.3dhubs.apiary.io/
- https://bitbucket.org/bram_rongen/hubs3d_api_example
