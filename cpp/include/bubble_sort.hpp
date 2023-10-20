#include <vector>

std::vector<int> bubble_sort(std::vector<int> vec) {
  std::size_t len = vec.size();
  do {
    int newlen = 0;
    for (std::size_t i = 1; i < len; ++i) {
      if (vec[i - 1] > vec[i]) {
        std::swap(vec[i], vec[i - 1]);
        newlen = i;
      }
    }
    len = newlen; 
  } while (len > 1);

  return vec;
}
