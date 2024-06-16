import gleam/string

fn is_yell(s: String) -> Bool {
  string.uppercase(s) == s && string.lowercase(s) != s
}

pub fn hey(remark: String) -> String {
  let remark = remark |> string.trim

  case remark {
    "" -> "Fine. Be that way!"
    _ ->
      case string.ends_with(remark, "?"), is_yell(remark) {
        True, True -> "Calm down, I know what I'm doing!"
        False, True -> "Whoa, chill out!"
        True, False -> "Sure."
        _, _ -> "Whatever."
      }
  }
}
