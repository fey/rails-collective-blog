PORT?=3000
RACK_ENV?=development

lint:
	bundle exec rubocop
	bundle exec slim-lint app/views/

lint-fix:
	bundle exec rubocop -A

.PHONY: test

setup: install prepare-db
	bin/rails assets:precompile

install:
	bin/setup
	yarn

prepare-db:
	bin/rails db:migrate
	bin/rails db:fixtures:load

start:
	RAILS_ENV=development bin/dev

check: test lint

test:
	RAILS_ENV=test bin/rails test

ci: setup check

render-build:
	bundle install
	bundle exec rails assets:precompile
	bundle exec rails assets:clean
	bundle exec rails db:migrate

render-start:
	bundle exec puma -t 5:5 -p ${PORT} -e ${RACK_ENV}
