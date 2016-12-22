cd ..
set -x
./build/MIA/bin/MIA resources/test-images/snaily.jpg -h
./build/MIA/bin/MIA resources/test-images/snaily.jpg -sharpen 0.0 tests/gold-standard_images/sharpen0.jpg
./build/MIA/bin/MIA resources/test-images/snaily.jpg -sharpen 10.0 tests/gold-standard_images/sharpen10.jpg
./build/MIA/bin/MIA resources/test-images/snaily.jpg -edge tests/gold-standard_images/edge.jpg
./build/MIA/bin/MIA resources/test-images/snaily.jpg -threshold 0.0 tests/gold-standard_images/threshold0.jpg
./build/MIA/bin/MIA resources/test-images/snaily.jpg -threshold 0.5 tests/gold-standard_images/thresholdhalf.jpg
./build/MIA/bin/MIA resources/test-images/snaily.jpg -threshold 1.0 tests/gold-standard_images/threshold1.jpg
./build/MIA/bin/MIA resources/test-images/snaily.jpg -blur 0.0 tests/gold-standard_images/blur0.jpg
./build/MIA/bin/MIA resources/test-images/snaily.jpg -blur 20.0 tests/gold-standard_images/blur20.jpg
./build/MIA/bin/MIA resources/test-images/snaily.jpg -saturate -10.0 tests/gold-standard_images/saturate-10.jpg
./build/MIA/bin/MIA resources/test-images/snaily.jpg -saturate 10.0 tests/gold-standard_images/saturate10.jpg
./build/MIA/bin/MIA resources/test-images/snaily.jpg -saturate 0 tests/gold-standard_images/saturate0.jpg
./build/MIA/bin/MIA resources/test-images/snaily.jpg -quantize 2 tests/gold-standard_images/quantize2.jpg
./build/MIA/bin/MIA resources/test-images/snaily.jpg -quantize 10 tests/gold-standard_images/quantize10.jpg
./build/MIA/bin/MIA resources/test-images/snaily.jpg -quantize 100 tests/gold-standard_images/quantize100.jpg
./build/MIA/bin/MIA resources/test-images/snaily.jpg -quantize 500 tests/gold-standard_images/quantize500.jpg
./build/MIA/bin/MIA resources/test-images/snaily.jpg -channel 0.0 0.0 0.0 tests/gold-standard_images/channel0.jpg
./build/MIA/bin/MIA resources/test-images/snaily.jpg -channel 1.0 0.0 0.0 tests/gold-standard_images/channel1.jpg
./build/MIA/bin/MIA resources/test-images/snaily.jpg -channel 0.0 1.0 0.0 tests/gold-standard_images/channel2.jpg
./build/MIA/bin/MIA resources/test-images/snaily.jpg -channel 0.0 0.0 1.0 tests/gold-standard_images/channel3.jpg
./build/MIA/bin/MIA resources/test-images/snaily.jpg -channel 0.5 0.5 0.5 tests/gold-standard_images/channel4.jpg
./build/MIA/bin/MIA resources/test-images/snaily.jpg -channel 1.0 1.0 1.0 tests/gold-standard_images/channel5.jpg
./build/MIA/bin/MIA resources/test-images/colorCircles.png -sharpen 0.0 tests/gold-standard_images/1.png
./build/MIA/bin/MIA resources/test-images/snaily.jpg -sharpen 0.0 tests/gold-standard_images/2.png
./build/MIA/bin/MIA resources/test-images/colorCircles.png -sharpen 0.0 tests/gold-standard_images/3.jpg
./build/MIA/bin/MIA resources/test-images/graphWithoutAlpha.png -sharpen 10.0 -edge tests/gold-standard_images/sharpenedge10.jpg
./build/MIA/bin/MIA resources/test-images/graphWithoutAlpha.png -threshold 1.0 -saturate 10.0 tests/gold-standard_images/threshold1saturate10.jpg
./build/MIA/bin/MIA resources/test-images/brainColor.jpg -quantize 10 -edge tests/gold-standard_images/quantize10edge.jpg
