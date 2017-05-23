## Amtrak
### Pulls Amtrak train scheduled and estimated departure times 

#### Installation


Install `bundler` if you haven't already:

```
$ gem install bundler
```

Specify your dependencies in a Gemfile in your project's root:

```
source 'https://rubygems.org'
gem 'amtrak'
```

In a terminal window, run:

```
$ bundle install
$ git add Gemfile Gemfile.lock
```

#### Usage

Require the Gem:

```
require 'amtrak'
```

Make a request:

```
Amtrak.get('NYP', 'PHL')
```
