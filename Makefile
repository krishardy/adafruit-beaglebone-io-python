NTPDATE=/usr/sbin/ntpdate

default: build

time:
	$(NTPDATE) -b -s -u pool.ntp.org

publish: clean
	python setup.py sdist upload

clean:
	rm -rf Adafruit_BBIO.* build dist
	rm -f *.pyo
	rm -f *.egg
	rm -f overlays/*.pyo overlays/*.pyc
tests:
	py.test

build: time
	python setup.py build --force

install: build
	python setup.py install --force
