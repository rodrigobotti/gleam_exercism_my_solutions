import gleam/list

pub fn new_list() -> List(String) {
  []
}

pub fn existing_list() -> List(String) {
  ["Gleam", "Go", "TypeScript"]
}

pub fn add_language(languages: List(String), language: String) -> List(String) {
  [language, ..languages]
}

pub fn count_languages(languages: List(String)) -> Int {
  // // manual:
  // case languages {
  //   [] -> 0
  //   [_head, ..tail] -> 1 + count_languages(tail)
  // }
  list.length(languages)
}

pub fn reverse_list(languages: List(String)) -> List(String) {
  // // manual
  // case languages {
  //   [] -> []
  //   [head, ..tail] -> list.append(reverse_list(tail), [head])
  // }
  list.reverse(languages)
}

pub fn exciting_list(languages: List(String)) -> Bool {
  case languages {
    ["Gleam", ..] | ["Gleam"] -> True
    [_, "Gleam"] | [_, "Gleam", _] -> True
    _ -> False
  }
}
