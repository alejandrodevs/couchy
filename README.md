# Couchy

This is a simple ruby wrapper around [CouchDB](https://couchdb.apache.org)’s RESTFul API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'couchy'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install couchy

## Usage


### Documents

```ruby
require 'couchy'

server = Couchy::Server.new
database = Couchy::Database.new('mydb', server)

database.save_document("DocId", { name: "Alex" })
# => {:ok=>true, :id=>"DocId", :rev=>"1-d8ab39494dd33ca3ff2430bdb0bf0836"}

database.get_document("DocId")
# => {:_id=>"DocId", :_rev=>"1-d8ab39494dd33ca3ff2430bdb0bf0836", :name=>"Alex"}

database.delete_document("DocId", rev: "1-d8ab39494dd33ca3ff2430bdb0bf0836")
# => {:ok=>true, :id=>"DocId", :rev=>"2-e0e6a8d559f31334aa171858d4cd01dd"}

database.get_document("DocId")
# => deleted (Couchy::ResouceNotFound)
```

### Databases

```ruby
server.create_database("anotherdb")
# => {:ok=>true}

server.delete_database("anotherdb")
# => {:ok=>true}

server.get_database("anotherdb")
# => Database does not exist. (Couchy::ResouceNotFound)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alejandrodevs/couchy. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/alejandrodevs/couchy/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Couchy project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/alejandrodevs/couchy/blob/master/CODE_OF_CONDUCT.md).
