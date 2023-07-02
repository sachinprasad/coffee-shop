# README

Task:

A day at a coffee shop!

    A customer visits a coffee shop that sells a bunch of items (e.g. beverages, sandwiches, etc.).
    Items have varying tax rates and some are free or offered at a discount when ordered with another item.
    The customer is made aware of the order total and once he pays for it, he can wait until notified of the order completion.
    You are required to describe a program with a set of interfaces that models the above problem at hand. You need to design the DB and backend architecture and implement it.
    Users should be able to see the list of available items, User should be able to order them and should get a notification after a fixed amount of time that their order is ready.
    Unit test cases are not mandatory.
    Tech Stack - Ruby on Rails. You can also show us your front-end skills in some JS technologies (React/Angular, etc) or Bootstrap, or plain Html/JS.


Setup guide:

* Ruby version 2.5.1

* Create a .env variable and set these values:
DB_USERNAME=postgres
DB_PASSWORD=postgres
DB_HOST=localhost
GMAIL_EMAIL=ab@gmail.com
GMAIL_PASSWORD=ab

* Run rails db:migrate & rails db:seed

* For login creds check login file
