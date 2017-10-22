# dynamic-to-static
This ruby gem changes the required build settings of an existing Dynamic Framework Xcode Project so it can build Static Frameworks.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dynamictostatic'
```

And then execute:

$ bundle

Or install it yourself as:

$ gem install dynamictostatic

## Usage

`dynamictostatic convert FrameworkTargetName` to convert your Dynamic Framework Target to Static.

`dynamictostatic convert FrameworkTargetName --xcodeproj_path` to convert your Dynamic Framework Target to Static given the .xcodeproj path. Use this option when the target and the project name are different.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pkrmf/dynamic-to-static. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Dynamic-to-Static project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/pkrmf/dynamic-to-static/blob/master/CODE_OF_CONDUCT.md).
