test:
	bundle exec rspec

rubocop:
	bundle exec rubocop
	bundle exec rubocop --require rubocop-rspec

rubycritic:
	bundle exec rubycritic --format console

review: rubocop rubycritic

format:
	bundle exec rubocop --auto-correct

check:
	bundle check

setup:
	bundle exec bin/setup

console:
	bundle exec bin/console

.PHONY: test review format check setup console

.DEFAULT_GOAL := test
