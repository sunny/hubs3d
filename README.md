Ruby gem to access 3D Hubs' API
===============================

Configuration
-------------

```rb
Hubs3D.configure do |c|
  c.oauth_key = "YOUR_API_KEY_HERE"
  c.oauth_secret = "YOUR_API_SECRET_HERE"
end
```

Usage
-----

### Upload a model and get its id back

```rb
model = Hubs3D::Model.new(path: "/path/to/example.stl",
                          name: "example.stl")
model.id # => 42
```

### Create a cart and get its url to redirect to

```rb
cart = Hubs3D::Cart.new
cart << model
cart.url # => "https://www.3dhubs.com/…"
```

### A cart can also take a third_party_id and a designer_tip

```rb
cart = Hubs3D::Cart.new(
  designer_tip: Hubs3D::Tip.new(amount_cents: 42_00,
                                currency: "EUR",
                                uuid: "5-42-42",
                                mandatory: true),
  third_party_id: 42
)
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
