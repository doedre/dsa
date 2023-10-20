#include <algorithm>
#include <cassert>
#include <iostream>
#include <memory>

#include <input_generation.hpp>
#include <merge_sort.hpp>

int main() {
  try {
    for (unsigned i = 0; i < iterations; ++i) {
      auto vec = random_vector<int>();
      vec = merge_sort(std::move(vec));
      assert(std::is_sorted(vec.cbegin(), vec.cend()));
    }
  } catch (const std::exception& exc) {
    std::cout << exc.what() << "\n";
  }

  return 0;
}
