test:
	coverage run -m unittest discover tests/
	coverage report -m
	coverage html
	coverage xml
	open htmlcov/index.html

conda-build-and-install:
	conda build . --output-folder=./
	conda install ./**/*.tar.bz2

test-package:
	cd tests && \
	coverage run -m --include=**/template/* --omit=**/test_*.py unittest discover . && \
	coverage report -m && \
	coverage html && \
	coverage xml && \
	conda uninstall template -y --force && \
	cd ..

clean:
	rm -rf .coverage htmlcov coverage.xml tests/.coverage tests/htmlcov tests/coverage.xml
	rm -rf channeldata.json index.html noarch/ osx-64/ linux-32/ linux-64/ win-32/ win-64/

.PHONY: test clean conda-build-and-install test-package
