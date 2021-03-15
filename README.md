# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

# Steps to run application locally.

* switch to the branch ticker_changes and run below commands.

* bundle install

* rake db:create

* rake db:migrate

* rake db:seed

* got to rails console

* get microsoft company into a object and run the below command

* s = ImportSharePrice.new(c1.id, 'MSFT_Oct_2020.tsv')

* using same way, import the data for AMZN & AAPL.

* You can check the api using below urls

* localhost:3000/share_chart?symbol=MSFT&display_type=hours
* localhost:3000/share_chart?symbol=MSFT&display_type=days
