
TESTS = test/spec
REPORTER = spec
XML_FILE = reports/TEST-all.xml
HTML_FILE = reports/coverage.html

test: test-mocha

test-mocha:
	@NODE_ENV=test mocha \
	    --timeout 200 \
		--reporter $(REPORTER) \
		$(TESTS)

test-travis: istanbul coveralls clean

test-cov: istanbul clean

istanbul:
	istanbul cover _mocha -- -R spec test/spec

coveralls:
	cat ./coverage/lcov.info | ./node_modules/coveralls/bin/coveralls.js

clean:
	rm -rf ./coverage
