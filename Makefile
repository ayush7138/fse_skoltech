PIP = /bin/pip

help:
	@echo "make requirements"
	@echo "make run"
	@echo "make test"

requirements:
	$(PIP) install --no-cache-dir -r requirements_new.txt

run:
	$(PYTHON) somefile.py

test: 
	$(PIP) list

clean:
	rm -rf __pycache__
.PHONY: run clean

