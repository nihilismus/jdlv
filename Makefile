run:
	bundle exec exe/jdlv "100,100" "2,2|3,2|4,2|4,3|3,4" 5

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
