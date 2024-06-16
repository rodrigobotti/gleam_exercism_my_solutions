import gleam/option.{Some}
import gleam/regex.{Match}
import gleam/string

pub fn is_valid_line(line: String) -> Bool {
  let assert Ok(re) = regex.from_string("\\[DEBUG|INFO|WARNING|ERROR\\] \\w+")
  regex.check(re, line)
}

pub fn split_line(line: String) -> List(String) {
  let assert Ok(re) = regex.from_string("<[\\*\\~=-]*>")
  regex.split(re, line)
}

pub fn tag_with_user_name(line: String) -> String {
  let assert Ok(re) = regex.from_string("\\s+User\\s+(\\S+)")

  case regex.scan(with: re, content: line) {
    [Match(content: _, submatches: [Some(username)])] ->
      "[USER] " <> string.trim(username) <> " " <> line
    _ -> line
  }
}
