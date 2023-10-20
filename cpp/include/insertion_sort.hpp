#include <vector>

std::vector<int> insertion_sort(std::vector<int> vec) {
  for (std::size_t i = 1; i < vec.size(); ++i) {
    const auto key = vec[i];
    auto j = i - 1;
    while (j > 0 && vec[j] > key) {
      vec[j + 1] = vec[j];
      --j;
    }
    vec[j] = key;
  }

  return vec;
}
