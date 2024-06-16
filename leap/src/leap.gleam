fn divisible_by(n: Int, divisor: Int) -> Bool {
  n % divisor == 0
}

pub fn is_leap_year(year: Int) -> Bool {
  case divisible_by(year, 100) {
    True -> divisible_by(year, 400)
    False -> divisible_by(year, 4)
  }
}
