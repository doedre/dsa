#include <cstdlib>
#include <ctime>
#include <iostream>
#include <vector>

namespace {
  void quicksort(std::vector<int>& vec, const std::size_t start, const std::size_t end) {
    if (end <= start) return;
    else if (end - start + 1 == 0) return;

    const std::size_t rand_index = start + (rand() % (end - start + 1));
    std::swap(vec[start], vec[rand_index]);
    const auto pivot = vec[start];

    std::size_t i = start + 1;
    for (std::size_t j = i; j <= end; ++j) {
      if (vec[j] < pivot) {
        std::swap(vec[i++], vec[j]);
      }
    }

    std::swap(vec[start], vec[i - 1]);
    quicksort(vec, start, i - 2);
    quicksort(vec, i, end);
  }
}

std::vector<int> quick_sort(std::vector<int> vec) {
  srand(time(0));
  const std::size_t sz = vec.empty() ? 0 : vec.size() - 1;
  quicksort(vec, 0, sz);
  return vec;
}

