#! /usr/bin/env python3

import numpy as np
import scipy
import trimesh
import six
import skimage
import tensorflow as tf

import unittest

class ComputeVersionTest(unittest.TestCase):
  def test_v(self):
    self.assertEqual(np.__version__, '1.19.2')
    self.assertEqual(skimage.__version__, '0.18.3')
    self.assertEqual(scipy.__version__, '1.7.1')
    self.assertEqual(trimesh.__version__, '3.9.34')
    self.assertEqual(six.__version__, '1.15.0')
    self.assertEqual(tf.__version__, '2.6.0')

if __name__ == '__main__':
  unittest.main()

