PROJECT="MyMLProject"
AUTHOR="Asmaul Shahana"
RELEASE="0.0.0.1"

install:
	pip install -r requrements.txt

docs:
	echo "Generating docs..." && \
	cd docs && \
	sphinx-quickstart -q -p ${PROJECT} -a ${AUTHOR} -r ${RELEASE} --ext-viewcode --ext-todo --ext-autodoc && \
	cd .. && \
	cd my_py_pkg && \
	sphinx-apidoc -o ../docs src/

build:
	python setup.py sdist bdist_wheel

publish: build
	twine upload dist/*	

.PHONY: docs build