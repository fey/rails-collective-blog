.PHONY: test

install:
	bin/setup

lint:
	bundle exec rubocop

lint-fix:
	bundle exec rubocop -A

test:
	bin/rails test
