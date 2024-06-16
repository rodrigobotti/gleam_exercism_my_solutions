pub fn reply(guess: Int) -> String {
  case guess {
    42 -> "Correct"
    41 | 43 -> "So close"
    low if low < 41 -> "Too low"
    high if high > 43 -> "Too high"
    _ -> panic as "unreachable"
  }
}
