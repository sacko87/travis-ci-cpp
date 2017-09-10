#include <iostream>
#include <leptonica/allheaders.h>
#include <tesseract/baseapi.h>

using namespace std;

int
main(void) {
  cout << getImagelibVersions();
  cout << tesseract::TessBaseAPI::Version() << endl;
  return 0;
}
