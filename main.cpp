#include <iostream>
#include <tesseract/baseapi.h>

using namespace std;

int
main(void) {
  cout << tesseract::TessBaseAPI::Version() << endl;
  return 0;
}
