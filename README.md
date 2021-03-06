# Devminipost

MVP to create the next generation of DevPost platform.

## Project dependecies and versions

* Ruby version: 3.0.2
* Rails version: 6.1.4
* Database: PostgreSQL
* Node version: 14.18.0

## Setup locally

> First make sure you have Ruby installed in your system. You can follow the [instructions here](https://www.ruby-lang.org/es/downloads/) depending on your OS.
> It is recommended to use `Ruby 3.0.2 and newer version`.

* Install project's gem running `bundle install`
* Setup DB running `bundle exec rails db:setup`
* Install JS dependencies
  * Install yarn (dependencies manager) `npm install --global yarn`
  * Install JS dependencies `yarn install`

## Usage

Run this command on the terminal in the root folder of the application:

```sh
$ rails s
```

Then, visit: [http://localhost:3000/](http://localhost:3000/)

At this point you will be able to see the application in your browser. 🎉🎉🎉

## Considerations

* We should handle Subscriptions as a separate table so that we can join it with Users.
* We may consider to show Subscription to user since the Signup form (set the `is_free` user column to true).
* We should implement something like `Pundint` or `CanCanCan` to handle user permissions.
* Once we have the JS behavior to add remove prizes dynamically when creating Competitions, we should refactor the logic in `new` action of `CompetitionsController`.
* Maybe, we can use something like [**ActiveRecord's counter caches**](https://dev.to/loribbaum/rails-5-2-x-rails-6-countercache-gotcha-3bgc) approach for performace at high scale for Competitions to show the total of Prizes value.
* Maybe, we should validate **uniqueness of** Competition's and Prizes' name.
