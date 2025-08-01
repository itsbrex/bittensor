SHELL := /bin/bash
.PHONY: init-venv clean-venv clean install install-dev reinstall reinstall-dev

init-venv:
	python3 -m venv venv && source ./venv/bin/activate

clean-venv:
	source ./venv/bin/activate && \
	pip freeze > make_venv_to_uninstall.txt && \
	pip uninstall -r make_venv_to_uninstall.txt -y && \
	rm make_venv_to_uninstall.txt

clean:
	rm -rf dist/ build/ bittensor.egg-info/ .pytest_cache/ lib/

install: init-venv
	source ./venv/bin/activate && \
	python3 -m pip install .

install-dev: init-venv
	source ./venv/bin/activate && \
	python3 -m pip install -e '.[dev]'

reinstall: clean clean-venv install

reinstall-dev: clean clean-venv install-dev
