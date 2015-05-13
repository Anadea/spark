web: ./bin/rails server thin -p $PORT -e ${RACK_ENV:-development}
worker: bundle exec rake jobs:work
