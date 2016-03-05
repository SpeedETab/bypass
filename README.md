# Bypass

This gem gives you some rudimentary access to the Bypass API so that you can get their **concession* and **menu** data.

## The models

In the Bypass system, we have the following entities:

- Venue
  - Concession (has many)
    - Menu (has one)
      - Category (has many)
        - Item (has many)
          - Modifier (has many)
            - Option (has many)


### Venue

We don't really do anything with the venue since the API access key/token provided by Bypass selects the venue for us. In other words, the API access key is Venue-specific.

The Venue might be a stadium.


### Concession


The Concession is one of the food stands in the stadium.


### Menu


The Menu is the list of things you can order at one of the Concessions.


### Category


The Category is a way of grouping menu items.


### Item


The Item is the actual menu item.


### Modifier


A modifier is a thing you can add to a menu item that comes wih a list of options. It is a way of grouping options.


### Option


An option is your choice of modifier. You can usually choose more than one.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bypass'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bypass


## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).
