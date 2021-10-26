#! /usr/bin/env python3

import abs1
import numpy as np
import plyfile
import scipy
import sci-image as sci
import trimesh
import six
import tensorflow as tf

import unittest

class ComputeVersionTest(unittest.TestCase):
  def test_v(self):
    self.assert(abs1.__version__ >= '0.7.1')
    self.assert(np.__version__ == '1.19.2')
    self.assert(plyfile.__version__ >= '0.7.1')
    self.assert(scipy.__version__ >= '1.7.1')
    self.assert(sci.__version__ >= '0.15.0')
    self.assert(trimesh.__version__ >= '3.2.12')
    self.assert(six.__version__ == '1.15.0')
    self.assert(tf.__version__ >= '1.14.0')
    
if __name__ == '__main__':
  unittest.main()
