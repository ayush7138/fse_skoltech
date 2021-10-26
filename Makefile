PIP = /bin/pip

help:
	@echo "make requirements"
	@echo "make run"
	@echo "make test"

requirements:
	$(PIP) install --no-cache-dir -r requirements_new.txt
	$(PIP) freeze
	$(PIP) install pylint

run:
	python3 replace.py
	python3 resample_geometry.py --input_mesh=demo_data/bunny_watertight.obj --output_ply=demo_data/bunny_pts.ply
	# python3 reconstruct_geometry.py --input_ply=demo_data/bunny_pts.ply --npoints=2048 --steps=3001 --part_size 0.1 --output_ply=/tmp/output.ply
	python3 reconstruct_geometry.py --input_ply demo_data/living_room_33_100_per_m2.ply --part_size=0.50

test: 
	$(PIP) list
	python3 -m unittest discover -v

clean:
	rm -rf __pycache__
.PHONY: run clean

