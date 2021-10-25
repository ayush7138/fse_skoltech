VENV = venv
PYTHON = $(VENV)/bin/python3
PIP = $(VENV)/bin/pip

help:
	@echo "make requirements"
	@echo "make run"
	@echo "make test"

requirements:
	python3 -m venv $(VENV)
	$(PIP) install -r requirements.txt

run: $(VENV)/bin/activate
	$(PYTHON) somefile.py

test: 
	python3 -m venv $(VENV)
	$(PIP) list

clean:
	rm -rf __pycache__
	rm -rf $(VENV)
.PHONY: run clean

