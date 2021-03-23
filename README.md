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

# If you have to support 100x the volume of data what would you change in the architecture, schema etc ?

* I will change the schema as following.
* I wil have date table, date will have many time_series and time_series will belongs_to company. I will calculate daily and hourly avarage and store it in the database. So that we don't need to compute avarages again.

# How will you support realtime ingestion of a data feed of ticker data ?

* I haven't explored this much. I need to study it first. But we need to perform polling here to get the latest data from the server. To avoid querying past data (from the morning for that market day) in the database we can store this data into cache aslo. So just fetch the cached data

