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
[{:number=>2109,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"8:00 am",
    :estimated_time=>"8:00 am"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"9:10 am",
    :estimated_time=>"9:19 am"}},
 {:number=>185,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"8:10 am",
    :estimated_time=>"8:12 am"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"9:35 am",
    :estimated_time=>"9:41 am"}},
 {:number=>2151,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"9:00 am",
    :estimated_time=>"9:00 am"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"10:07 am",
    :estimated_time=>"10:16 am"}},
 {:number=>643,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"9:30 am",
    :estimated_time=>"9:30 am"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"10:50 am",
    :estimated_time=>"10:50 am"}},
 {:number=>141,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"9:35 am",
    :estimated_time=>"9:43 am"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"11:00 am",
    :estimated_time=>"11:00 am"}},
 {:number=>2153,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"10:00 am",
    :estimated_time=>"10:11 am"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"11:07 am",
    :estimated_time=>"11:11 am"}},
 {:number=>95,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"10:35 am",
    :estimated_time=>"10:35 am"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"11:57 am",
    :estimated_time=>"11:57 am"}},
 {:number=>2155,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"11:00 am",
    :estimated_time=>"11:00 am"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"12:10 pm",
    :estimated_time=>"12:10 pm"}},
 {:number=>43,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"10:52 am",
    :estimated_time=>"10:52 am"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"12:15 pm",
    :estimated_time=>"12:15 pm"}},
 {:number=>125,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"11:35 am",
    :estimated_time=>"11:35 am"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"12:57 pm",
    :estimated_time=>"12:57 pm"}},
 {:number=>2117,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"12:00 pm",
    :estimated_time=>"12:00 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"1:10 pm",
    :estimated_time=>"1:10 pm"}},
 {:number=>645,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"12:05 pm",
    :estimated_time=>"12:05 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"1:25 pm",
    :estimated_time=>"1:25 pm"}},
 {:number=>171,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"12:35 pm",
    :estimated_time=>"12:38 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"2:00 pm",
    :estimated_time=>"2:00 pm"}},
 {:number=>2159,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"1:00 pm",
    :estimated_time=>"1:00 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"2:09 pm",
    :estimated_time=>"2:09 pm"}},
 {:number=>609,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"12:54 pm",
    :estimated_time=>"12:54 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"2:17 pm",
    :estimated_time=>"2:17 pm"}},
 {:number=>2121,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"2:00 pm",
    :estimated_time=>"2:00 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"3:07 pm",
    :estimated_time=>"3:07 pm"}},
 {:number=>93,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"2:02 pm",
    :estimated_time=>"2:02 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"3:24 pm",
    :estimated_time=>"3:24 pm"}},
 {:number=>647,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"2:11 pm",
    :estimated_time=>"2:11 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"3:33 pm",
    :estimated_time=>"3:33 pm"}},
 {:number=>2163,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"3:00 pm",
    :estimated_time=>"3:00 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"4:09 pm",
    :estimated_time=>"4:09 pm"}},
 {:number=>649,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"2:44 pm",
    :estimated_time=>"2:44 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"4:12 pm",
    :estimated_time=>"4:12 pm"}},
 {:number=>85,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"3:05 pm",
    :estimated_time=>"3:05 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"4:27 pm",
    :estimated_time=>"4:27 pm"}},
 {:number=>173,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"3:35 pm",
    :estimated_time=>"3:35 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"4:52 pm",
    :estimated_time=>"4:52 pm"}},
 {:number=>2165,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"4:00 pm",
    :estimated_time=>"4:00 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"5:07 pm",
    :estimated_time=>"5:07 pm"}},
 {:number=>651,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"4:03 pm",
    :estimated_time=>"4:03 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"5:23 pm",
    :estimated_time=>"5:23 pm"}},
 {:number=>127,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"4:05 pm",
    :estimated_time=>"4:05 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"5:30 pm",
    :estimated_time=>"5:30 pm"}},
 {:number=>129,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"4:42 pm",
    :estimated_time=>"4:42 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"6:04 pm",
    :estimated_time=>"6:04 pm"}},
 {:number=>2167,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"5:00 pm",
    :estimated_time=>"5:00 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"6:07 pm",
    :estimated_time=>"6:07 pm"}},
 {:number=>653,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"5:10 pm",
    :estimated_time=>"5:10 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"6:30 pm",
    :estimated_time=>"6:30 pm"}},
 {:number=>193,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"5:39 pm",
    :estimated_time=>"5:39 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"7:00 pm",
    :estimated_time=>"7:00 pm"}},
 {:number=>2119,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"6:00 pm",
    :estimated_time=>"6:00 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"7:07 pm",
    :estimated_time=>"7:07 pm"}},
 {:number=>137,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"6:25 pm",
    :estimated_time=>"6:25 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"7:52 pm",
    :estimated_time=>"7:52 pm"}},
 {:number=>655,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"6:35 pm",
    :estimated_time=>"6:35 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"8:00 pm",
    :estimated_time=>"8:00 pm"}},
 {:number=>2171,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"7:00 pm",
    :estimated_time=>"7:00 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"8:07 pm",
    :estimated_time=>"8:07 pm"}},
 {:number=>55,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"6:45 pm",
    :estimated_time=>"6:45 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"8:07 pm",
    :estimated_time=>"8:07 pm"}},
 {:number=>175,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"7:40 pm",
    :estimated_time=>"7:40 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"9:10 pm",
    :estimated_time=>"9:10 pm"}},
 {:number=>2173,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"8:13 pm",
    :estimated_time=>"8:13 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"9:25 pm",
    :estimated_time=>"9:25 pm"}},
 {:number=>2175,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"9:05 pm",
    :estimated_time=>"9:05 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"10:15 pm",
    :estimated_time=>"10:15 pm"}},
 {:number=>187,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"9:10 pm",
    :estimated_time=>"9:10 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"10:32 pm",
    :estimated_time=>"10:32 pm"}},
 {:number=>177,
  :departure=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"10:05 pm",
    :estimated_time=>"10:05 pm"},
  :arrival=>
   {:date=>"Tue, May 23 2017",
    :scheduled_time=>"11:28 pm",
    :estimated_time=>"11:28 pm"}}]
```

