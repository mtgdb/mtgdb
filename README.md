[![Build Status](https://api.travis-ci.org/mtgdb/mtgdb.svg?branch=master)](https://travis-ci.org/mtgdb/mtgdb) [![Code Climate](https://codeclimate.com/github/mtgdb/mtgdb/badges/gpa.svg)](https://codeclimate.com/github/mtgdb/mtgdb) [![Test Coverage](https://codeclimate.com/github/mtgdb/mtgdb/badges/coverage.svg)](https://codeclimate.com/github/mtgdb/mtgdb/coverage) [![Issue Count](https://codeclimate.com/github/mtgdb/mtgdb/badges/issue_count.svg)](https://codeclimate.com/github/mtgdb/mtgdb)

# MTGDB

This application uses:

- Ruby 2.4.0
- Rails 5.0.1
- PostgreSQL 9.6

### Workflow

Develop in feature branches from the master branch, then create PRs back into master. Review apps will be created when PRs are opened. The work is available on the staging Heroku app when merged into master.

## Local development using Docker

### Setup

The setup script creates sets up the database, config/database.yml and .env (copied from config/database.yml.example & .ev.example respectively).

```
$ docker-compose build
```

Then run:

```
$ docker-compose run web bin/setup
```

You can start the app using Docker with:

```
$ docker-compose up
```

The site should be available at: `http://localhost:3000`

## Testing

### Setup

```
$ docker-compose run web rake db:test:load
```

You can run the suite using Docker with:

```
$ docker-compose run web bin/test spec
```
