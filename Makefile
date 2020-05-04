#!/usr/bin/make

deb:
	fakeroot dpkg-buildpackage -uc -b

lint:
	# stop the build if there are Python syntax errors or undefined names
	flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics
	flake8 . --count --statistics

test: lint
	pytest-3

deb_clean:
	fakeroot debian/rules clean

.PHONY: deb deb_clean lint
