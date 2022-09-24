.PHONY: test

setup: install build prepare-db

install:
	bin/setup
	yarn

prepare-db:
	bin/rails db:migrate
	bin/rails db:fixtures:load

start:
	bin/dev

check: test lint

lint:
	bundle exec rubocop
	bundle exec slim-lint app/views/

lint-fix:
	bundle exec rubocop -A

test:
	RAILS_ENV=test bin/rails test

ci: setup check

deploy:
	railway up
	railway run bin/rails db:migrate

build:
	bin/rails assets:precompile
