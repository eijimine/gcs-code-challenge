#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
npm install
./bin/shakapacker
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate
bundle exec rake db:seed
