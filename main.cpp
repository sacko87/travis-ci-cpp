#include <iostream>
#include <leptonica/allheaders.h>

using namespace std;

int
main(void) {
  cout << getImagelibVersions() << endl;
  return 0;
}
