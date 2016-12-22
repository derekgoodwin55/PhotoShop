cd ..
set -x
 ./build/MIA/bin/MIA resources/test-images/snaily.jpg -h
 ./build/MIA/bin/MIA resources/test-images/snaily.jpg -sharpen 0.0 tests/regression_testing_images/sharpen0.jpg
 ./build/MIA/bin/MIA resources/test-images/snaily.jpg -sharpen 10.0 tests/regression_testing_images/sharpen10.jpg
 ./build/MIA/bin/MIA resources/test-images/snaily.jpg -edge tests/regression_testing_images/edge.jpg
 ./build/MIA/bin/MIA resources/test-images/snaily.jpg -threshold 0.0 tests/regression_testing_images/threshold0.jpg
 ./build/MIA/bin/MIA resources/test-images/snaily.jpg -threshold 0.5 tests/regression_testing_images/thresholdhalf.jpg
 ./build/MIA/bin/MIA resources/test-images/snaily.jpg -threshold 1.0 tests/regression_testing_images/threshold1.jpg
 ./build/MIA/bin/MIA resources/test-images/snaily.jpg -blur 0.0 tests/regression_testing_images/blur0.jpg
 ./build/MIA/bin/MIA resources/test-images/snaily.jpg -blur 20.0 tests/regression_testing_images/blur20.jpg
 ./build/MIA/bin/MIA resources/test-images/snaily.jpg -saturate -10.0 tests/regression_testing_images/saturate-10.jpg
 ./build/MIA/bin/MIA resources/test-images/snaily.jpg -saturate 10.0 tests/regression_testing_images/saturate10.jpg
 ./build/MIA/bin/MIA resources/test-images/snaily.jpg -saturate 0 tests/regression_testing_images/saturate0.jpg
 ./build/MIA/bin/MIA resources/test-images/snaily.jpg -quantize 2 tests/regression_testing_images/quantize2.jpg
 ./build/MIA/bin/MIA resources/test-images/snaily.jpg -quantize 10 tests/regression_testing_images/quantize10.jpg
 ./build/MIA/bin/MIA resources/test-images/snaily.jpg -quantize 100 tests/regression_testing_images/quantize100.jpg
 ./build/MIA/bin/MIA resources/test-images/snaily.jpg -quantize 500 tests/regression_testing_images/quantize500.jpg
 ./build/MIA/bin/MIA resources/test-images/snaily.jpg -channel 0.0 0.0 0.0 tests/regression_testing_images/channel0.jpg
 ./build/MIA/bin/MIA resources/test-images/snaily.jpg -channel 1.0 0.0 0.0 tests/regression_testing_images/channel1.jpg
 ./build/MIA/bin/MIA resources/test-images/snaily.jpg -channel 0.0 1.0 0.0 tests/regression_testing_images/channel2.jpg
 ./build/MIA/bin/MIA resources/test-images/snaily.jpg -channel 0.0 0.0 1.0 tests/regression_testing_images/channel3.jpg
 ./build/MIA/bin/MIA resources/test-images/snaily.jpg -channel 0.5 0.5 0.5 tests/regression_testing_images/channel4.jpg
 ./build/MIA/bin/MIA resources/test-images/snaily.jpg -channel 1.0 1.0 1.0 tests/regression_testing_images/channel5.jpg
 ./build/MIA/bin/MIA resources/test-images/colorCircles.png -sharpen 0.0 tests/regression_testing_images/1.png
 ./build/MIA/bin/MIA resources/test-images/snaily.jpg -sharpen 0.0 tests/regression_testing_images/2.png
 ./build/MIA/bin/MIA resources/test-images/colorCircles.png -sharpen 0.0 tests/regression_testing_images/3.jpg
 ./build/MIA/bin/MIA resources/test-images/graphWithoutAlpha.png -sharpen 10.0 -edge tests/regression_testing_images/sharpenedge10.jpg
 ./build/MIA/bin/MIA resources/test-images/graphWithoutAlpha.png -threshold 1.0 -saturate 10.0 tests/regression_testing_images/threshold1saturate10.jpg
 ./build/MIA/bin/MIA resources/test-images/brainColor.jpg -quantize 10 -edge tests/regression_testing_images/quantize10edge.jpg

 set +x
echo ./build/MIA/bin/MIA tests/regression_testing_images/3.jpg -compare tests/gold-standard_images/3.jpg
if !(./build/MIA/bin/MIA tests/regression_testing_images/3.jpg -compare tests/gold-standard_images/3.jpg);
  then echo "***ERROR*** the comparison test ./build/MIA/bin/MIA tests/regression_testing_images/3.jpg -compare tests/gold-standard_images/3.jpg";
fi
echo ./build/MIA/bin/MIA tests/regression_testing_images/sharpen10.jpg -compare tests/gold-standard_images/sharpen10.jpg
if !(./build/MIA/bin/MIA tests/regression_testing_images/sharpen10.jpg -compare tests/gold-standard_images/sharpen10.jpg);
  then echo "***ERROR*** the comparison test ./build/MIA/bin/MIA tests/regression_testing_images/sharpen10.jpg -compare tests/gold-standard_images/sharpen10.jpg";
fi
echo ./build/MIA/bin/MIA tests/regression_testing_images/edge.jpg -compare tests/gold-standard_images/edge.jpg
if !(./build/MIA/bin/MIA tests/regression_testing_images/edge.jpg -compare tests/gold-standard_images/edge.jpg);
  then echo "***ERROR*** the comparison test ./build/MIA/bin/MIA tests/regression_testing_images/edge.jpg -compare tests/gold-standard_images/edge.jpg";
fi
echo ./build/MIA/bin/MIA tests/regression_testing_images/threshold0.jpg -compare tests/gold-standard_images/threshold0.jpg
if !(./build/MIA/bin/MIA tests/regression_testing_images/threshold0.jpg -compare tests/gold-standard_images/threshold0.jpg);
  then echo "***ERROR*** the comparison test ./build/MIA/bin/MIA tests/regression_testing_images/threshold0.jpg -compare tests/gold-standard_images/threshold0.jpg";
fi
echo ./build/MIA/bin/MIA tests/regression_testing_images/thresholdhalf.jpg -compare tests/gold-standard_images/thresholdhalf.jpg
if !(./build/MIA/bin/MIA tests/regression_testing_images/thresholdhalf.jpg -compare tests/gold-standard_images/thresholdhalf.jpg);
  then echo "***ERROR*** the comparison test ./build/MIA/bin/MIA tests/regression_testing_images/thresholdhalf.jpg -compare tests/gold-standard_images/thresholdhalf.jpg";
fi
echo ./build/MIA/bin/MIA tests/regression_testing_images/threshold1.jpg -compare tests/gold-standard_images/threshold1.jpg
if !(./build/MIA/bin/MIA tests/regression_testing_images/threshold1.jpg -compare tests/gold-standard_images/threshold1.jpg);
  then echo "***ERROR*** the comparison ./build/MIA/bin/MIA tests/regression_testing_images/threshold1.jpg -compare tests/gold-standard_images/threshold1.jpg";
fi
echo ./build/MIA/bin/MIA tests/regression_testing_images/blur0.jpg -compare tests/gold-standard_images/blur0.jpg
if !(./build/MIA/bin/MIA tests/regression_testing_images/blur0.jpg -compare tests/gold-standard_images/blur0.jpg);
  then echo "***ERROR*** the comparison test ./build/MIA/bin/MIA tests/regression_testing_images/blur0.jpg -compare tests/gold-standard_images/blur0.jpg";
fi
echo ./build/MIA/bin/MIA tests/regression_testing_images/blur20.jpg -compare tests/gold-standard_images/blur20.jpg
if !(./build/MIA/bin/MIA tests/regression_testing_images/blur20.jpg -compare tests/gold-standard_images/blur20.jpg);
  then echo "***ERROR*** the comparison test ./build/MIA/bin/MIA tests/regression_testing_images/blur20.jpg -compare tests/gold-standard_images/blur20.jpg";
fi
echo ./build/MIA/bin/MIA tests/regression_testing_images/saturate-10.jpg -compare tests/gold-standard_images/saturate-10.jpg
if !(./build/MIA/bin/MIA tests/regression_testing_images/saturate-10.jpg -compare tests/gold-standard_images/saturate-10.jpg);
  then echo "***ERROR*** the comparison test ./build/MIA/bin/MIA tests/regression_testing_images/saturate-10.jpg -compare tests/gold-standard_images/saturate-10.jpg";
fi
echo ./build/MIA/bin/MIA tests/regression_testing_images/saturate10.jpg -compare tests/gold-standard_images/saturate10.jpg
if !(./build/MIA/bin/MIA tests/regression_testing_images/saturate10.jpg -compare tests/gold-standard_images/saturate10.jpg);
  then echo "***ERROR*** the comparison test ./build/MIA/bin/MIA tests/regression_testing_images/saturate10.jpg -compare tests/gold-standard_images/saturate10.jpg";
fi
echo ./build/MIA/bin/MIA tests/regression_testing_images/saturate0.jpg -compare tests/gold-standard_images/saturate0.jpg
if !(./build/MIA/bin/MIA tests/regression_testing_images/saturate0.jpg -compare tests/gold-standard_images/saturate0.jpg);
  then echo "***ERROR*** the comparison test ./build/MIA/bin/MIA tests/regression_testing_images/saturate0.jpg -compare tests/gold-standard_images/saturate0.jpg";
fi
echo ./build/MIA/bin/MIA tests/regression_testing_images/quantize2.jpg -compare tests/gold-standard_images/quantize2.jpg
if !( ./build/MIA/bin/MIA tests/regression_testing_images/quantize2.jpg -compare tests/gold-standard_images/quantize2.jpg);
  then echo "***ERROR*** the comparison test ./build/MIA/bin/MIA tests/regression_testing_images/quantize2.jpg -compare tests/gold-standard_images/quantize2.jpg";
fi
echo ./build/MIA/bin/MIA tests/regression_testing_images/quantize10.jpg -compare tests/gold-standard_images/quantize10.jpg
if !(./build/MIA/bin/MIA tests/regression_testing_images/quantize10.jpg -compare tests/gold-standard_images/quantize10.jpg);
  then echo "***ERROR*** the comparison test ./build/MIA/bin/MIA tests/regression_testing_images/quantize10.jpg -compare tests/gold-standard_images/quantize10.jpg";
fi
echo ./build/MIA/bin/MIA tests/regression_testing_images/quantize100.jpg -compare tests/gold-standard_images/quantize100.jpg
if !(./build/MIA/bin/MIA tests/regression_testing_images/quantize100.jpg -compare tests/gold-standard_images/quantize100.jpg);
  then echo "***ERROR*** the comparison test ./build/MIA/bin/MIA tests/regression_testing_images/quantize100.jpg -compare tests/gold-standard_images/quantize100.jpg";
fi
echo ./build/MIA/bin/MIA tests/regression_testing_images/quantize500.jpg -compare tests/gold-standard_images/quantize500.jpg
if !(./build/MIA/bin/MIA tests/regression_testing_images/quantize500.jpg -compare tests/gold-standard_images/quantize500.jpg);
  then echo "***ERROR*** the comparison test ./build/MIA/bin/MIA tests/regression_testing_images/quantize500.jpg -compare tests/gold-standard_images/quantize500.jpg";
fi
echo ./build/MIA/bin/MIA tests/regression_testing_images/channel0.jpg -compare tests/gold-standard_images/channel0.jpg
if !(./build/MIA/bin/MIA tests/regression_testing_images/channel0.jpg -compare tests/gold-standard_images/channel0.jpg);
  then echo "***ERROR*** the comparison test ./build/MIA/bin/MIA tests/regression_testing_images/channel0.jpg -compare tests/gold-standard_images/channel0.jpg";
fi
echo ./build/MIA/bin/MIA tests/regression_testing_images/channel1.jpg -compare tests/gold-standard_images/channel1.jpg
if !(./build/MIA/bin/MIA tests/regression_testing_images/channel1.jpg -compare tests/gold-standard_images/channel1.jpg);
  then echo "***ERROR*** the comparison test ./build/MIA/bin/MIA tests/regression_testing_images/channel1.jpg -compare tests/gold-standard_images/channel1.jpg";
fi
echo ./build/MIA/bin/MIA tests/regression_testing_images/channel2.jpg -compare tests/gold-standard_images/channel2.jpg
if !(./build/MIA/bin/MIA tests/regression_testing_images/channel2.jpg -compare tests/gold-standard_images/channel2.jpg);
  then echo "***ERROR*** the comparison test ./build/MIA/bin/MIA tests/regression_testing_images/channel2.jpg -compare tests/gold-standard_images/channel2.jpg";
fi
echo ./build/MIA/bin/MIA tests/regression_testing_images/channel3.jpg -compare tests/gold-standard_images/channel3.jpg
if !(./build/MIA/bin/MIA tests/regression_testing_images/channel3.jpg -compare tests/gold-standard_images/channel3.jpg);
  then echo "***ERROR*** the comparison test ./build/MIA/bin/MIA tests/regression_testing_images/channel3.jpg -compare tests/gold-standard_images/channel3.jpg";
fi
echo ./build/MIA/bin/MIA tests/regression_testing_images/channel4.jpg -compare tests/gold-standard_images/channel4.jpg
if !(./build/MIA/bin/MIA tests/regression_testing_images/channel4.jpg -compare tests/gold-standard_images/channel4.jpg);
  then echo "***ERROR*** the comparison test ./build/MIA/bin/MIA tests/regression_testing_images/channel4.jpg -compare tests/gold-standard_images/channel4.jpg";
fi
echo ./build/MIA/bin/MIA tests/regression_testing_images/channel5.jpg -compare tests/gold-standard_images/channel5.jpg
if !(./build/MIA/bin/MIA tests/regression_testing_images/channel5.jpg -compare tests/gold-standard_images/channel5.jpg);
  then echo "***ERROR*** the comparison test ./build/MIA/bin/MIA tests/regression_testing_images/channel5.jpg -compare tests/gold-standard_images/channel5.jpg";
fi
echo ./build/MIA/bin/MIA tests/regression_testing_images/1.png -compare tests/gold-standard_images/1.png
if !(./build/MIA/bin/MIA tests/regression_testing_images/1.png -compare tests/gold-standard_images/1.png);
  then echo "***ERROR*** the comparison test ./build/MIA/bin/MIA tests/regression_testing_images/1.png -compare tests/gold-standard_images/1.png";
fi
echo ./build/MIA/bin/MIA tests/regression_testing_images/2.png -compare tests/gold-standard_images/2.png
if !(./build/MIA/bin/MIA tests/regression_testing_images/2.png -compare tests/gold-standard_images/2.png);
  then echo "***ERROR*** the comparison test ./build/MIA/bin/MIA tests/regression_testing_images/2.png -compare tests/gold-standard_images/2.png";
fi
echo ./build/MIA/bin/MIA tests/regression_testing_images/3.jpg -compare tests/gold-standard_images/3.jpg
if !(./build/MIA/bin/MIA tests/regression_testing_images/3.jpg -compare tests/gold-standard_images/3.jpg);
  then echo "***ERROR*** the comparison test ./build/MIA/bin/MIA tests/regression_testing_images/3.jpg -compare tests/gold-standard_images/3.jpg";
fi
echo ./build/MIA/bin/MIA tests/regression_testing_images/sharpenedge10.jpg -compare tests/gold-standard_images/sharpenedge10.jpg
if !(./build/MIA/bin/MIA tests/regression_testing_images/sharpenedge10.jpg -compare tests/gold-standard_images/sharpenedge10.jpg);
  then echo "***ERROR*** the comparison test ./build/MIA/bin/MIA tests/regression_testing_images/sharpenedge10.jpg -compare tests/gold-standard_images/sharpenedge10.jpg";
fi
echo ./build/MIA/bin/MIA tests/regression_testing_images/threshold1saturate10.jpg -compare tests/gold-standard_images/threshold1saturate10.jpg
if !(./build/MIA/bin/MIA tests/regression_testing_images/threshold1saturate10.jpg -compare tests/gold-standard_images/threshold1saturate10.jpg);
  then echo "***ERROR*** the comparison test ./build/MIA/bin/MIA tests/regression_testing_images/threshold1saturate10.jpg -compare tests/gold-standard_images/threshold1saturate10.jpg";
fi
echo ./build/MIA/bin/MIA tests/regression_testing_images/quantize10edge.jpg -compare tests/gold-standard_images/quantize10edge.jpg
if !(./build/MIA/bin/MIA tests/regression_testing_images/quantize10edge.jpg -compare tests/gold-standard_images/quantize10edge.jpg);
  then echo "***ERROR*** the comparison test ./build/MIA/bin/MIA tests/regression_testing_images/quantize10edge.jpg -compare tests/gold-standard_images/quantize10edge.jpg";
fi

# These tests should fail.
echo ./build/MIA/bin/MIA tests/regression_testing_images/threshold1saturate10.jpg -compare tests/gold-standard_images/quantize10edge.jpg
if !(./build/MIA/bin/MIA tests/regression_testing_images/threshold1saturate10.jpg -compare tests/gold-standard_images/quantize10edge.jpg);
  then echo "***ERROR*** the comparison test ./build/MIA/bin/MIA tests/regression_testing_images/threshold1saturate10.jpg -compare tests/gold-standard_images/quantize10edge.jpg failed";
fi
echo ./build/MIA/bin/MIA tests/regression_testing_images/channel2.jpg -compare tests/gold-standard_images/quantize500.jpg
if !(./build/MIA/bin/MIA tests/regression_testing_images/channel2.jpg -compare tests/gold-standard_images/quantize500.jpg);
  then echo "***ERROR*** the comparison test ./build/MIA/bin/MIA tests/regression_testing_images/channel2.jpg -compare tests/gold-standard_images/quantize500.jpg failed";
fi
