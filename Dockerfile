FROM ubuntu:20.04

RUN apt-get update
RUN apt-get -y install git
RUN git clone https://github.com/tensorflow/graphics.git

RUN cd graphics/tensorflow_graphics/projects/local_implicit_grid/ \
   && git clone https://github.com/ayush7138/fse_skoltech.git \
   && cd fse_skoltech/ \
   && mv * ../ \
   && cd .. \
   && chmod +x run_fse.sh \
   && chmod +x pylint_test.sh
