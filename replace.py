#!/usr/bin/env python3
import fileinput

filename = ['resample_geometry.py', 'reconstruct_geometry.py']

for i in len(filename):
  with fileinput.FileInput(filename[i], inplace=True, backup='.bak') as file:
      for line in file:
          print(line.replace('tensorflow_graphics.projects.local_implicit_grid.core', 'core'), end='')
