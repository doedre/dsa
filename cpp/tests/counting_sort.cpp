#include <algorithm>
#include <cassert>
#include <iostream>
#include <memory>

#include <input_generation.hpp>
#include <counting_sort.hpp>

int main() {
  try {
    for (unsigned i = 0; i < iterations; ++i) {
      auto vec = random_vector<unsigned char>(10);
      vec = counting_sort(std::move(vec));
      assert(std::is_sorted(vec.cbegin(), vec.cend()));
    }
  } catch (const std::exception& exc) {
    std::cout << "Exception: " << exc.what() << "\n";
    return -1;
  }

  return 0;
}
