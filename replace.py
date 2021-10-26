#!/usr/bin/env python3
import fileinput

filename = ['resample_geometry.py', 'reconstruct_geometry.py', 'core/evaluator.py', 'implicit_nets.py', 'local_implicit_grid_layer.py', 'model_g2g.py', 'model_g2v.py', 'point_utils.py', 'postprocess.py', 'reconstruction.py', 'regular_grid_interpolation.py']

for i in filename:
    # Read in the file
    file_py = open(i, 'r')
    filedata = file_py.read()

    # Replace the target string
    filedata = filedata.replace('tensorflow_graphics.projects.local_implicit_grid.core', 'core')

    # Write the file out again
    file_py = open(i, 'w')
    file_py.write(filedata)
