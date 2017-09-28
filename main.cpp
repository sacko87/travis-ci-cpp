#include <iostream>
#include <leptonica/allheaders.h>
#include <tesseract/baseapi.h>
#include <opencv/cv.h>

using namespace std;

int
main(void) {
  cout << getImagelibVersions();
  cout << tesseract::TessBaseAPI::Version() << endl;
  cout << cv::getBuildInformation().c_str() << endl;
  return 0;
}
