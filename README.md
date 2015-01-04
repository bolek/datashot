#DataShot

Create data snapshots in Rails with ease.

## Installation

1. Add gem to gemfile:  
`gem "datashot", :git => "git://github.com/bolek/datashot"`  
`bundle install`

2. Mount engine in `config/routes`  
`mount Datashot::Engine, at: "/Datashot"`

3. Add and run engine migrations  
`bundle exec rake datashot:install:migrations`  
`bundle exec rake db:migrate`

4. Start server  
e.g. `bundle exec rails s`

5. Open browser and go to http://localhost:3000/datashot

6. Create some data snapshots

## Demo Site
https://fierce-cove-6561.herokuapp.com

