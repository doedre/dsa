#include <vector>

namespace {

  void merge(std::vector<int>& vec, const std::size_t start, const std::size_t end) {
    const std::size_t mid = (end + start) / 2;
    std::size_t left = start;
    std::size_t right = mid + 1;

    std::vector<int> temp(end - start + 1);
    for (auto& elem : temp) {
      if (left > mid) {
        elem = vec[right++];
      } else if (right > end) {
        elem = vec[left++];
      } else {
        if (vec[left] < vec[right]) {
          elem = vec[left++];
        } else {
          elem = vec[right++];
        }
      }
    }

    std::size_t i = start;
    for (const int elem : temp) {
      vec[i++] = elem;
    }
  }

  void range_merge_sort(std::vector<int>& vec, const std::size_t start, const std::size_t end) {
    if (start >= end) {
      return;
    }

    const int mid = (end + start) / 2;
    range_merge_sort(vec, start, mid);
    range_merge_sort(vec, mid + 1, end);

    return merge(vec, start, end);
  }
}

std::vector<int> merge_sort(std::vector<int> vec) {
  const std::size_t size = vec.empty() ? 0 : vec.size() - 1;
  range_merge_sort(vec, 0, size);
  return vec;
}

