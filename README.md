# README

Needs

- for Mac
- Docker
- docker-compose
- Heroku for Deploy

Versions

- Ruby 2.6.1
- Ruby On Rails 6
- Postgres 11.2
- Bundler 1.17.2

How To Start ( with Mac )

- clone this application
- move to this application folder
- run 'docker-compose build' for creating docker image
- run 'docker-compose run web rails db:create' for create db ( for first build )
- run 'docker-compose up'
- Done! go to 'localhost:3030'
- you can see 'hello world!'

How To Deploy ( with Heroku )

- after you build docker-image
- run 'heroku login'
- run 'heroku create', then your app will be heroku app
- run 'heroku container:login'
- run 'heroku container:push web'
- run 'heroku container:release web'
- Done! you can see your server address in your console.

- \*\*if you have already heroku app
- heroku git:remote -a 'your-app-name'
- run 'heroku container:login'
- run 'heroku container:push web'
- run 'heroku container:release web'
- Done! your server is deployed.
