#!/bin/bash

set -ex

source ~/envs/cesium/bin/activate


section "Tests"

if [[$COVERAGE == 1]]
then
    NOSE_FLAGS = '--with-coverage'
    echo "Python version: 3.4/3.5"
    echo "Running coverage.py"
else
    echo "Python version: 2.x"
    echo "Coverage not set up for python 2.x"
fi
nosetests -v --exe $NOSE_FLAGS

section_end "Tests"

section "Build.docs"

if [[ $SKIP_DOCS != 1 ]]; then
  pip install matplotlib
  make html
fi

section_end "Build.docs"
