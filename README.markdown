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
[{:number=>171,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>"12:35 pm", :estimated_time=>nil},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>"12:35 pm", :estimated_time=>nil}},
 {:number=>2159,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>" 1:00 pm", :estimated_time=>nil},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>" 1:00 pm", :estimated_time=>nil}},
 {:number=>609,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>"12:54 pm", :estimated_time=>nil},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>"12:54 pm", :estimated_time=>nil}},
 {:number=>133,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>" 1:09 pm", :estimated_time=>nil},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>" 1:09 pm", :estimated_time=>nil}},
 {:number=>2121,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>" 2:00 pm", :estimated_time=>nil},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>" 2:00 pm", :estimated_time=>nil}},
 {:number=>83,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>" 2:02 pm", :estimated_time=>nil},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>" 2:02 pm", :estimated_time=>nil}},
 {:number=>647,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>" 2:11 pm", :estimated_time=>nil},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>" 2:11 pm", :estimated_time=>nil}},
 {:number=>19,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>" 2:15 pm", :estimated_time=>nil},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>" 2:15 pm", :estimated_time=>nil}},
 {:number=>2163,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>" 3:00 pm", :estimated_time=>" 3:01 pm"},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>" 3:00 pm", :estimated_time=>" 3:01 pm"}},
 {:number=>649,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>" 2:44 pm", :estimated_time=>" 2:44 pm"},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>" 2:44 pm", :estimated_time=>" 2:44 pm"}},
 {:number=>85,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>" 3:05 pm", :estimated_time=>" 3:05 pm"},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>" 3:05 pm", :estimated_time=>" 3:05 pm"}},
 {:number=>97,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>" 3:15 pm", :estimated_time=>" 4:00 pm"},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>" 3:15 pm", :estimated_time=>" 4:00 pm"}},
 {:number=>173,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>" 3:35 pm", :estimated_time=>" 3:45 pm"},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>" 3:35 pm", :estimated_time=>" 3:45 pm"}},
 {:number=>2165,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>" 4:00 pm", :estimated_time=>" 4:00 pm"},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>" 4:00 pm", :estimated_time=>" 4:00 pm"}},
 {:number=>651,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>" 4:03 pm", :estimated_time=>" 4:03 pm"},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>" 4:03 pm", :estimated_time=>" 4:03 pm"}},
 {:number=>127,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>" 4:05 pm", :estimated_time=>" 4:05 pm"},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>" 4:05 pm", :estimated_time=>" 4:05 pm"}},
 {:number=>129,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>" 4:42 pm", :estimated_time=>" 4:42 pm"},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>" 4:42 pm", :estimated_time=>" 4:42 pm"}},
 {:number=>2167,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>" 5:00 pm", :estimated_time=>" 5:00 pm"},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>" 5:00 pm", :estimated_time=>" 5:00 pm"}},
 {:number=>653,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>" 5:10 pm", :estimated_time=>" 5:10 pm"},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>" 5:10 pm", :estimated_time=>" 5:10 pm"}},
 {:number=>193,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>" 5:39 pm", :estimated_time=>" 5:39 pm"},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>" 5:39 pm", :estimated_time=>" 5:39 pm"}},
 {:number=>2119,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>" 6:00 pm", :estimated_time=>" 6:00 pm"},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>" 6:00 pm", :estimated_time=>" 6:00 pm"}},
 {:number=>137,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>" 6:25 pm", :estimated_time=>" 6:25 pm"},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>" 6:25 pm", :estimated_time=>" 6:25 pm"}},
 {:number=>655,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>" 6:35 pm", :estimated_time=>" 6:35 pm"},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>" 6:35 pm", :estimated_time=>" 6:35 pm"}},
 {:number=>2171,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>" 7:00 pm", :estimated_time=>" 7:00 pm"},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>" 7:00 pm", :estimated_time=>" 7:00 pm"}},
 {:number=>55,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>" 6:45 pm", :estimated_time=>" 6:45 pm"},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>" 6:45 pm", :estimated_time=>" 6:45 pm"}},
 {:number=>175,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>" 7:40 pm", :estimated_time=>" 7:40 pm"},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>" 7:40 pm", :estimated_time=>" 7:40 pm"}},
 {:number=>2173,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>" 8:13 pm", :estimated_time=>" 8:13 pm"},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>" 8:13 pm", :estimated_time=>" 8:13 pm"}},
 {:number=>2175,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>" 9:05 pm", :estimated_time=>" 9:05 pm"},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>" 9:05 pm", :estimated_time=>" 9:05 pm"}},
 {:number=>187,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>" 9:10 pm", :estimated_time=>" 9:10 pm"},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>" 9:10 pm", :estimated_time=>" 9:10 pm"}},
 {:number=>177,
  :departure=>{:date=>"2017-10-13", :scheduled_time=>"10:05 pm", :estimated_time=>"10:05 pm"},
  :arrival=>{:date=>"2017-10-13", :scheduled_time=>"10:05 pm", :estimated_time=>"10:05 pm"}}]
```

