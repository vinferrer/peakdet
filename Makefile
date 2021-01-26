.PHONY: all lint

all_tests: lint unittest integration

help:
	@echo "Please use 'make <target>' where <target> is one of:"
	@echo "  lint			to run flake8 on all Python files"
	@echo "  unittest		to run unit tests on peakdet"
	@echo "  integration	to run the integration test set on peakdet"
	@echo "  all_tests		to run 'lint', 'unittest', and 'integration'"

lint:
	@flake8 peakdet

unittest:
	@pip install -e ".[test]"
	@py.test --cov-append --cov-report term-missing --cov=phys2bids peakdet/

integration:
	@pip install -e ".[test]"
	@py.test --log-cli-level=INFO --cov-append --cov-report term-missing --cov=peakdet -k test_integration peakdet/tests/test_integration.py