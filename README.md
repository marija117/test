# README

This steps are necessary to get the
application up and running.

* It is neccesary to create .env file with following content:

* GMAIL_USERNAME=test@gmail.com
* GMAIL_PASSWORD=password

* docker-compose build
* docker-compose up
* docker-compose run web rails db:create
* docker-compose run web rails db:migrate
* docker-compose run web rails db:seed

When you want to stop the project run:
* docker-compose down