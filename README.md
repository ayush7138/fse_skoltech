## FSE project for Foundations of Software Engineering course 2021 (Skoltech) 
It represents improved in sence of the engineering original project which can be found by 
https://github.com/tensorflow/graphics/tree/master/tensorflow_graphics%2Fprojects%2Flocal_implicit_grid
Its based on CVPR 2020 paper ([Local Implicit Grid Representations for 3D Scenes](https://arxiv.org/abs/2003.08981)) 
and has short description on web page ([project webpage](http://maxjiang.ml/proj/lig))

By autors: Ayush Gupta, Oleg Nikolaev, Oleg Sautenkov, 
next engineering staff was done:

- The public git repository with all source and engineering files, as well as 
README file with description for a successful run of the original project 
- Docker container to build docker image locally ("Dockerfile")
- Docker image at Dockerhub (link:) to pull and run image
- Build system in form of Makefiles ("Makefile") by which:
  -  installation of requirements ("requirements_new")
  -  run: obtain external data, perform data preprocessing, training and model optimization ("run_fse")
  -  test and check the critical functionality ("test_version") 
  parts are done
- Code linting ("pylint_test")
- Deployment system based on GitHub workflows

### Short description of the original project

Shape priors learned from data are commonly used to reconstruct 3D objects from partial or noisy data. Yet no such shape priors are available for indoor scenes, since typical 3D autoencoders cannot handle their scale, complexity, or diversity. In this paper, we introduce Local Implicit Grid Representations, a new 3D shape representation designed for scalability and generality. The motivating idea is that most 3D surfaces share geometric details at some scale – i.e., at a scale smaller than an entire object and larger than a small patch. We train an autoencoder to learn an embedding of local crops of 3D shapes at that size. Then, we use the decoder as a component in a shape optimization that solves for a set of latent codes on a regular grid of overlapping crops such that an interpolation of the decoded local shapes matches a partial or noisy observation. We demonstrate the value of this proposed approach for 3D surface reconstruction from sparse point observations, showing significantly better results than alternative approaches.

### Short description of main parts of the code 
Code is tested with python 3.7+ and tensorflow 1.14+ (other requirements can be founf in "requirements_new").
Scene reconstruction using pretrained part encoding is done by releasing the evaluation code to use our pretrained model for scene reconstruction, along with definitions for the local implicit grid layer and part-autoencoder model. To directly use script for surface reconstruction, prepare the input point cloud as a .ply file with vertex attributes: x, y, z, nx, ny, nz. Programm will create an input .ply file from a mesh and reconstruct a meshed surface given an input point cloud.
For demo input data, "demo_data" is used. 

```bash
# download the model weights.
wget https://storage.googleapis.com/local-implicit-grids/pretrained_ckpt.zip
unzip pretrained_ckpt.zip; rm pretrained_ckpt.zip

# fetch a test object and compute point cloud.
mkdir -p demo_data
wget https://cs.uwaterloo.ca/~c2batty/bunny_watertight.obj
mv bunny_watertight.obj demo_data

# reconstruct an object. since objects are much smaller than entire scenes,
# we can use a smaller point number and number of optimization steps to speed
# up.
python reconstruct_geometry.py \
--input_ply demo_data/bunny.ply \
--part_size=0.20 --npoints=2048 --steps=3001
# download more demo data for scene reconstruction.
wget http://storage.googleapis.com/local-implicit-grids/demo_data.zip
unzip demo_data.zip; rm demo_data.zip
# reconstruct a dense scene
python reconstruct_geometry.py \
--input_ply demo_data/living_room_33_1000_per_m2.ply \
--part_size=0.25
# reconstruct a sparser scene using a larger part size
python reconstruct_geometry.py \
--input_ply demo_data/living_room_33_100_per_m2.ply \
--part_size=0.50
```

### Get started