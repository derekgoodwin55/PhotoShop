/*******************************************************************************
 * Name            : main.cc
 * Project         : MIA
 * Module          : main
 * Description     : Entry point for MIA application
 * Copyright       : 2016 CSCI3081W TAs. All rights reserved.
 * Creation Date   : 1/15/15
 * Original Author : Seth Johnson
 *
 ******************************************************************************/

/*******************************************************************************
 * Includes
 ******************************************************************************/
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include "include/mia_app.h"
#include "include/mia_filter_manager.h"
#include "lib/libimgtools/src/include/image_handler.h"
#include "lib/libimgtools/src/include/pixel_buffer.h"

/*******************************************************************************
 * Non-Member Functions
 ******************************************************************************/
void compare_images(std::string image_1, std::string image_2) {
  image_tools::PixelBuffer* buffer_1;
  image_tools::PixelBuffer* buffer_2;
  buffer_1 = image_tools::ImageHandler::LoadImage(image_1);
  buffer_2 = image_tools::ImageHandler::LoadImage(image_2);
  image_tools::ColorData color_1;
  image_tools::ColorData color_2;

  if (buffer_1->height() != buffer_2->height() ||
      buffer_1->width() != buffer_2->width()) {
    std::cout << "0\n" << std::endl;
    return;
  }

  for (int i = 0; i < buffer_1->width(); i++) {
    for (int j = 0; j < buffer_1->height(); j++) {
      color_1 = buffer_1->get_pixel(i, j);
      color_2 = buffer_2->get_pixel(i, j);

      if (color_1.red() != color_2.red() ||
          color_1.green() != color_2.green() ||
          color_1.blue() != color_2.blue()) {

        std::cout << "0\n" << std::endl;
        return;
      }
    }
  }
  std::cout << "1\n" << std::endl;
}

int parse_args(int argc, char** argv, std::string img_1, std::string img_2) {
  image_tools::PixelBuffer* buffer;
  image_tools::MIAFilterManager filter_manager;
  std::string file_name;

	/********************************
	 * COMPARE
	 ********************************/
	if (std::string (argv[2]) == std::string("-compare")) {
		std::string arg_1;
		std::string arg_2;

		if (argc == 4) {
	  	/* Set arg_1 and arg_2 equal to the arguments 
  		 * before and after "-compare" */
		  arg_1 = argv[1];
	  	arg_2 = argv[3];

		} else {
		  std::cout << "Error: Invalid use of compare.\n" << std::endl;
		  system("cat src/app/MIA/src/help");
		  return 1;
		}

		/* Check if arg_1 and arg_2 are valid image files */
		if ((arg_1.find(".png") || arg_1.find(".jpg") || arg_1.find(".jpeg")) &&
		   (arg_2.find(".png") || arg_2.find(".jpg") || arg_2.find(".jpeg"))) {
		  compare_images(arg_1, arg_2);

		} else {
		  std::cout << "Error: Invalid use of compare.\n" << std::endl;
		  system("cat src/app/MIA/src/help");
		  return 1;
		}

    return 0;
	}

	for (int i = 1; i < argc; i++) {
		std::string arg = argv[i];

		if (arg.find(".") != std::string::npos) {
		  file_name = arg;
		  arg = arg.substr(arg.find("."));
		} else if (arg == "-h") {

		} else if (i == 1) {
		  std::cout << "Error: First command line argument must be a file.\n" << std::endl;
		  system("cat src/app/MIA/src/help");
		  return 1;
		}

		/********************************
		 * HELP
		 ********************************/
		if (arg == "-h") {
		  system("cat src/app/MIA/src/help");

		/********************************
		 * SHARPEN
		 ********************************/
		} else if (arg == "-sharpen") {
		  /* Check for argument following -sharpen */
		  if (i + 1 == argc) {
		    std::cout << "Error: No sharpen amount following -sharpen.\n" << std::endl;
		    system("cat src/app/MIA/src/help");
		    return 1;
		  }
		  std::istringstream iss(std::string(argv[i+1]));
		  float sharpen = 0;

		  /* Check if argument following -sharpen is a float */
		  if (!(iss >> sharpen).fail()) {
		    if (sharpen > 100 || sharpen < 0) {
		     std::cout << "Error: Sharpen value must be between 0 and 100.\n" << std::endl;
		      system("cat src/app/MIA/src/help");
		      return 1; 
		    }
		    filter_manager.SetSharpen(sharpen);
		    filter_manager.ApplySharpen(&buffer);
		    i++;

		  } else {
		    std::cout << "Error: Argument following -sharpen must be a float.\n" << std::endl;
		    system("cat src/app/MIA/src/help");
		    return 1; 
		  }

		/********************************
		 * EDGE DETECT
		 ********************************/
		} else if (arg == "-edge") {
		  filter_manager.ApplyEdgeDetect(&buffer);

		  if (i + 2 < argc) {
		    if (std::string(argv[i + 1]) == "detect" &&
		        std::string(argv[i + 2]) == "edge") {
		      i+=2;
		    }
		  } 

		/********************************
		 * THRESHOLD
		 ********************************/
		} else if (arg == "-threshold") {
		  /* Check for argument following -threshold */
		  if (i + 1 == argc) {
		    std::cout << "Error: No threshold amount following -threshold.\n" << std::endl;
		    system("cat src/app/MIA/src/help");
		    return 1;
		  }
		  std::istringstream iss(std::string(argv[i+1]));
		  float threshold = 0;

		  /* Check if argument following -threshold is a float */
		  if (!(iss >> threshold).fail()) {
		    if (threshold > 1 || threshold < 0) {
		      std::cout << "Error: Threshold value must be between 0 and 1.\n" << std::endl;
		      system("cat src/app/MIA/src/help");
		      return 1;
		    }
		    filter_manager.SetThreshold(threshold);
		    filter_manager.ApplyThreshold(&buffer);
		    i++;

		  } else {
		    std::cout << "Error: Argument following -threshold must be a float.\n" << std::endl;
		    system("cat src/app/MIA/src/help");
		    return 1;
		  }

		/********************************
		 * QUANTIZE
		 ********************************/
		} else if (arg == "-quantize") {
		  /* Check for argument following -quantize */
		  if (i + 1 == argc) {
		    std::cout << "Error: No number of quantize bins following -quantize.\n" << std::endl;
		    system("cat src/app/MIA/src/help");
		    return 1;
		  }
		  std::istringstream iss(std::string(argv[i+1]));
		  int quantize = 0;

		  /* Check if argument following -quantize is a int */
		  if (!(iss >> quantize).fail()) {
		    if (quantize < 2) {
		      std::cout << "Error: Number of quantize bins must be greater than 2.\n" << std::endl;
		      system("cat src/app/MIA/src/help");
		      return 1;
		    }
		    filter_manager.SetQuantize(quantize);
		    filter_manager.ApplyQuantize(&buffer);
		    i++;

		  } else {
		    std::cout << "Error: Argument following -quantize must be an int.\n" << std::endl;
		    system("cat src/app/MIA/src/help");
		    return 1;
		  }

		/********************************
		 * BLUR
		 ********************************/
		} else if (arg == "-blur") {
		  /* Check for argument following -blur */
		  if (i + 1 == argc) {
		    std::cout << "Error: No blur amount following -blur.\n" << std::endl;
		    system("cat src/app/MIA/src/help");
		    return 1;
		  }
		  std::istringstream iss(std::string(argv[i+1]));
		  float blur = 0;

		  /* Check if argument following -blur is a int */
		  if (!(iss >> blur).fail()) {
		    if (blur < 0 || blur > 100) {
		      std::cout << "Error: Blur amount must be between 0 and 100.\n" << std::endl;
		      system("cat src/app/MIA/src/help");
		      return 1;
		    }
		    filter_manager.SetBlur(blur);
		    filter_manager.ApplyBlur(&buffer);
		    i++;

		  } else {
		    std::cout << "Error: Argument following -blur must be a float.\n" << std::endl;
		    system("cat src/app/MIA/src/help");
		    return 1;
		  }

		/********************************
		 * SATURATE
		 ********************************/
		} else if (arg == "-saturate") {
		  /* Check for argument following -saturate */
		  if (i + 1 == argc) {
		    std::cout << "Error: No saturate amount following -saturate.\n" << std::endl;
		    system("cat src/app/MIA/src/help");
		    return 1;
		  }
		  std::istringstream iss(std::string(argv[i+1]));
		  float saturate = 0;

		  /* Check if argument following -blur is a int */
		  if (!(iss >> saturate).fail()) {
		    if (saturate > 10 || saturate < -10) {
		      std::cout << "Error: Saturate amount must be between -10 and 10.\n" << std::endl;
		      system("cat src/app/MIA/src/help");
		      return 1;
		    }

		    filter_manager.SetSaturation(saturate);
		    filter_manager.ApplySaturate(&buffer);
		    i++;

		  } else {
		    std::cout << "Error: Argument following -saturate must be a float.\n" << std::endl;
		    system("cat src/app/MIA/src/help");
		    return 1;
		  }

		/********************************
		 * CHANNELS 0-1
		 ********************************/
		} else if (arg == "-channel") {
		  /* Check for arguments following -channel */
		  if (i + 3 >= argc) {
		    std::cout << "Error: No/not enough channel amounts following -channel.\n" << std::endl;
		    system("cat src/app/MIA/src/help");
		    return 1;
		  }

		  /* Check if arguments following -channel are floats */
		  for (int j = 1; j < 4; j++) {
		    std::istringstream iss(std::string(argv[i + j]));
		    float channel = 0;
		    if ((iss >> channel).fail()) {
		      std::cout << "Error: Arguments following -channel must be floats.\n" << std::endl;
		      system("cat src/app/MIA/src/help");
		      return 1;
		    } else if (channel < 0 || channel > 1) {
		        std::cout << "Error: Channel values must be between 0 and 1.\n" << std::endl;
		        system("cat src/app/MIA/src/help");
		        return 1;
		    }
		  }

		  filter_manager.SetChannels(atof(argv[i + 1]),
		                             atof(argv[i + 2]),
		                             atof(argv[i + 3]));
		  filter_manager.ApplyChannel(&buffer);
		  i+=3;

		/********************************
		 * IMAGE I/O
		 ********************************/
		} else if (arg == ".png" || arg == ".jpg" || arg == ".jpeg") {
		  if (i == 1) {
		    buffer = image_tools::ImageHandler::LoadImage(file_name);
		  } else if (i == (argc - 1)) {
		    image_tools::ImageHandler::SaveImage(file_name, buffer);
		  }

		/********************************
		 * INVALID ARGUMENT
		 ********************************/
		} else {
		  std::cout << "Error: Invalid command-line argument" << std::endl;
		  system("cat src/app/MIA/src/help");
		  return 1;
		}
  }
}

int main(int argc, char** argv) {
  if (argc == 1) {
    image_tools::MIAApp *app = new image_tools::MIAApp(
        400,
        400,
        "resources/marker.png");
    app->Init(argc, argv, 50, 50,
              image_tools::ColorData(1, 1, static_cast<float>(0.95)));
    app->RunMainLoop();
    delete app;
  } else {
    /* Command line interface */

    /********************************
     * IMAGE SEQUENCE
     ********************************/
    if (std::string(argv[1]).find("###.png") != std::string::npos ||
        std::string(argv[1]).find("###.jpg") != std::string::npos ||
        std::string(argv[1]).find("###.jpeg") != std::string::npos) {

      std::string arg_string = std::string(argv[1]);
      int img_num = 1;
      std::string img_num_str;

      while(1) {
        if (img_num < 10) {
          img_num_str = std::string("00") + std::to_string(img_num);

        } else if (img_num < 100) {
          img_num_str = std::string("0") + std::to_string(img_num);

        } else {
          img_num_str = std::to_string(img_num);
        }

        std::string stack_file = arg_string.substr(0, arg_string.find("###.")) + img_num_str + arg_string.substr(arg_string.find("."));
        std::cout << stack_file << std::endl;
        
        img_num++;
        if (img_num >= 1000)
          break;
      }
    } else {
      parse_args(argc, argv, std::string("."), std::string("."));
    }
  }
  return 0;
} /* main() */
