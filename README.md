[![Build Status](https://travis-ci.org/steview/mtgdb2.svg?branch=master)](https://travis-ci.org/steview/mtgdb2) [![Code Climate](https://codeclimate.com/github/steview/mtgdb2/badges/gpa.svg)](https://codeclimate.com/github/steview/mtgdb2) [![Test Coverage](https://codeclimate.com/github/steview/mtgdb2/badges/coverage.svg)](https://codeclimate.com/github/steview/mtgdb2/coverage) [![Issue Count](https://codeclimate.com/github/steview/mtgdb2/badges/issue_count.svg)](https://codeclimate.com/github/steview/mtgdb2)

# MTGDB

This application uses:

- Ruby 2.4
- Rails 5.0.1
- Postgres 9.6

## Docker setup

Copy database.yml config file

`cp config/database.yml.example config/database.yml`

Run setup scripts

`docker-compose run web bin/setup`

Start the app

`docker-compose up`

Point your browser at http://localhost:3000
