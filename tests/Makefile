################################################################################
# Name            : Makefile
# Project         : Image Processing Suite
# Description     : Tests Makefile
# Creation Date   : Fri May 16 15:44:49 2014
# Original Author : Michael Major
################################################################################

all: make-root regression-tests

# Make sure that the apps have been made, and then call a bash script that
# generates "golden standard" images.
golden: make-root
	bash generate_golden_images.bash

#
regression-tests:
	echo running regression tests
	bash regression_tests.bash

#
make-root:
	echo making sure apps have been built and running regression tests
	@make -C ..
