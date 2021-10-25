PIP = /bin/pip

help:
	@echo "make requirements"
	@echo "make run"
	@echo "make test"

requirements:
	$(PIP) install --no-cache-dir -r requirements_new.txt

run:
	python3 resample_geometry.py --input_mesh=demo_data/bunny_watertight.obj --output_ply=demo_data/bunny_pts.ply
	python3 reconstruct_geometry.py --input_ply=demo_data/bunny_pts.ply --npoints=2048 --steps=3001 --part_size 0.1 --output_ply=/tmp/output.ply

test: 
	$(PIP) list

clean:
	rm -rf __pycache__
.PHONY: run clean

