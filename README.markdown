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

Example response:

```
[{:number=>89,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"06:02:00", :estimated_time=>nil},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"06:02:00", :estimated_time=>nil}},
 {:number=>2107,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"07:00:00", :estimated_time=>nil},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"07:00:00", :estimated_time=>nil}},
 {:number=>183,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"07:05:00", :estimated_time=>nil},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"07:05:00", :estimated_time=>nil}},
 {:number=>641,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"07:17:00", :estimated_time=>nil},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"07:17:00", :estimated_time=>nil}},
 {:number=>79,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"07:25:00", :estimated_time=>nil},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"07:25:00", :estimated_time=>nil}},
 {:number=>2109,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"08:00:00", :estimated_time=>nil},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"08:00:00", :estimated_time=>nil}},
 {:number=>185,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"08:10:00", :estimated_time=>nil},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"08:10:00", :estimated_time=>nil}},
 {:number=>2151,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"09:00:00", :estimated_time=>"09:00:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"09:00:00", :estimated_time=>"09:00:00"}},
 {:number=>643,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"09:30:00", :estimated_time=>"09:30:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"09:30:00", :estimated_time=>"09:30:00"}},
 {:number=>141,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"09:35:00", :estimated_time=>"09:35:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"09:35:00", :estimated_time=>"09:35:00"}},
 {:number=>2153,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"10:00:00", :estimated_time=>"10:00:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"10:00:00", :estimated_time=>"10:00:00"}},
 {:number=>95,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"10:35:00", :estimated_time=>"10:35:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"10:35:00", :estimated_time=>"10:35:00"}},
 {:number=>2155,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"11:00:00", :estimated_time=>"11:00:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"11:00:00", :estimated_time=>"11:00:00"}},
 {:number=>43,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"10:52:00", :estimated_time=>"10:52:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"10:52:00", :estimated_time=>"10:52:00"}},
 {:number=>91,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"11:02:00", :estimated_time=>"11:02:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"11:02:00", :estimated_time=>"11:02:00"}},
 {:number=>125,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"11:35:00", :estimated_time=>"11:35:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"11:35:00", :estimated_time=>"11:35:00"}},
 {:number=>2117,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"12:00:00", :estimated_time=>"12:00:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"12:00:00", :estimated_time=>"12:00:00"}},
 {:number=>645,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"12:05:00", :estimated_time=>"12:05:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"12:05:00", :estimated_time=>"12:05:00"}},
 {:number=>171,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"12:35:00", :estimated_time=>"12:35:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"12:35:00", :estimated_time=>"12:35:00"}},
 {:number=>2159,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"13:00:00", :estimated_time=>"13:00:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"13:00:00", :estimated_time=>"13:00:00"}},
 {:number=>609,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"12:54:00", :estimated_time=>"12:54:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"12:54:00", :estimated_time=>"12:54:00"}},
 {:number=>2121,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"14:00:00", :estimated_time=>"14:00:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"14:00:00", :estimated_time=>"14:00:00"}},
 {:number=>93,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"14:02:00", :estimated_time=>"14:02:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"14:02:00", :estimated_time=>"14:02:00"}},
 {:number=>647,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"14:11:00", :estimated_time=>"14:11:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"14:11:00", :estimated_time=>"14:11:00"}},
 {:number=>19,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"14:15:00", :estimated_time=>"14:15:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"14:15:00", :estimated_time=>"14:15:00"}},
 {:number=>2163,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"15:00:00", :estimated_time=>"15:00:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"15:00:00", :estimated_time=>"15:00:00"}},
 {:number=>649,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"14:44:00", :estimated_time=>"14:44:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"14:44:00", :estimated_time=>"14:44:00"}},
 {:number=>85,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"15:05:00", :estimated_time=>"15:05:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"15:05:00", :estimated_time=>"15:05:00"}},
 {:number=>97,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"15:15:00", :estimated_time=>"15:15:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"15:15:00", :estimated_time=>"15:15:00"}},
 {:number=>173,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"15:35:00", :estimated_time=>"15:35:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"15:35:00", :estimated_time=>"15:35:00"}},
 {:number=>2165,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"16:00:00", :estimated_time=>"16:00:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"16:00:00", :estimated_time=>"16:00:00"}},
 {:number=>651,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"16:03:00", :estimated_time=>"16:03:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"16:03:00", :estimated_time=>"16:03:00"}},
 {:number=>127,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"16:05:00", :estimated_time=>"16:05:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"16:05:00", :estimated_time=>"16:05:00"}},
 {:number=>129,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"16:42:00", :estimated_time=>"16:42:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"16:42:00", :estimated_time=>"16:42:00"}},
 {:number=>2167,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"17:00:00", :estimated_time=>"17:00:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"17:00:00", :estimated_time=>"17:00:00"}},
 {:number=>653,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"17:10:00", :estimated_time=>"17:10:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"17:10:00", :estimated_time=>"17:10:00"}},
 {:number=>193,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"17:39:00", :estimated_time=>"17:39:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"17:39:00", :estimated_time=>"17:39:00"}},
 {:number=>2119,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"18:00:00", :estimated_time=>"18:00:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"18:00:00", :estimated_time=>"18:00:00"}},
 {:number=>137,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"18:25:00", :estimated_time=>"18:25:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"18:25:00", :estimated_time=>"18:25:00"}},
 {:number=>655,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"18:35:00", :estimated_time=>"18:35:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"18:35:00", :estimated_time=>"18:35:00"}},
 {:number=>2171,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"19:00:00", :estimated_time=>"19:00:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"19:00:00", :estimated_time=>"19:00:00"}},
 {:number=>55,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"18:45:00", :estimated_time=>"18:45:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"18:45:00", :estimated_time=>"18:45:00"}},
 {:number=>175,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"19:40:00", :estimated_time=>"19:40:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"19:40:00", :estimated_time=>"19:40:00"}},
 {:number=>2173,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"20:13:00", :estimated_time=>"20:13:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"20:13:00", :estimated_time=>"20:13:00"}},
 {:number=>2175,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"21:05:00", :estimated_time=>"21:05:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"21:05:00", :estimated_time=>"21:05:00"}},
 {:number=>187,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"21:10:00", :estimated_time=>"21:10:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"21:10:00", :estimated_time=>"21:10:00"}},
 {:number=>177,
  :departure=>{:date=>"2017-10-12", :scheduled_time=>"22:05:00", :estimated_time=>"22:05:00"},
  :arrival=>{:date=>"2017-10-12", :scheduled_time=>"22:05:00", :estimated_time=>"22:05:00"}}]
```

