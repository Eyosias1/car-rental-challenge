#!/usr/bin/env bash
# exit on error
set -o errexit

brew install postgresql@15 libpq
brew link --force libpq
brew services start postgresql@15
bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate
bundle exec rake db:seed
