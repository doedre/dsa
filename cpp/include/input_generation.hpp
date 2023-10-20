#include <concepts>
#include <iostream>
#include <random>
#include <vector>

inline constexpr std::size_t iterations = 100;
inline constexpr std::size_t max_vec_size = 1'000;

template<typename T>
requires std::integral<T>
int random_integer(const T min, const T max) noexcept {
  std::default_random_engine generator(std::random_device{}());
  std::uniform_int_distribution<> int_range(min, max);
  return int_range(generator);
}

template<typename T>
requires std::integral<T>
std::vector<T> random_vector(const std::size_t max_size = max_vec_size) {
  std::vector<T> v;
  const auto vector_size = static_cast<std::size_t>(random_integer(static_cast<T>(0), static_cast<T>(max_size)));
  v.reserve(vector_size);

  for (std::size_t i = 0; i < vector_size; ++i) {
    v.push_back(
        random_integer(
            std::numeric_limits<T>::min(),
            std::numeric_limits<T>::max()
        )
    );
  }
  return v;
}

template<typename T>
requires std::integral<T>
void out_vec(const std::vector<T>& vec) {
  std::cout << "{";
  for (const auto& it : vec) {
    std::cout << " " << static_cast<int>(it);
  }
  std::cout << " }\n";
}

