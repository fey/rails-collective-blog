lint:
	bundle exec rubocop --config $(CURDIR)/.rubocop.yml .
	bundle exec slim-lint --config $(CURDIR)/.slim-lint.yml views

lint-fix:
	bundle exec rubocop -A --config $(CURDIR)/.rubocop.yml .
