.PHONY: test

setup: install

install:
	bin/setup

check: lint test

lint:
	bundle exec rubocop

lint-fix:
	bundle exec rubocop -A

test:
	bin/rails test
