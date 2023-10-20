#include <array>
#include <limits>
#include <vector>

template<typename T = unsigned char>
requires std::unsigned_integral<T>
std::vector<T> counting_sort(std::vector<T> vec) {
  if (vec.empty())
    return vec;

  constexpr auto k = std::numeric_limits<unsigned char>::max() + 1;
  std::array<char, k> count{0};
  std::vector<T> output(vec.size());

  for (const auto key : vec) {
    count[key] = count[key] + 1;
  }

  for (int i = 1; i < k; ++i) {
    count[i] += count[i - 1];
  }

  for (int i = vec.size() - 1; i >= 0; --i) {
    const auto key = vec[i];
    count[key] -= 1;
    output[count[key]] = key;
  }

  return output;
}
