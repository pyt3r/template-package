PACKAGE_NAME=template

pep8:
	python -m autopep8 ${PACKAGE_NAME}/ -a -r --in-place

lint:
	python -m flake8 ${PACKAGE_NAME}/ --count --show-source --statistics

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
	coverage run -m --include=**/${PACKAGE_NAME}/* --omit=**/test_*.py unittest discover . && \
	coverage report -m && \
	coverage html && \
	coverage xml && \
	conda uninstall ${PACKAGE_NAME} -y --force && \
	cd ..


docs:
	cd docs/ && \
	make html && \
	open build/html/index.html && \
	cd ..

clean:
	rm -rf .coverage htmlcov/ coverage.xml tests/.coverage/ tests/htmlcov/ tests/coverage.xml
	rm -rf channeldata.json index.html noarch/ osx-64/ linux-32/ linux-64/ win-32/ win-64/ icons/
	find . -name "__pycache__" | xargs  rm -rf
	find . -name "*.pyc" | xargs rm -rf
	rm -rf docs/build/

.PHONY: pep8 lint test conda-build-and-install test-package docs clean
