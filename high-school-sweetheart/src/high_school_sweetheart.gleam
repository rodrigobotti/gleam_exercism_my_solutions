import gleam/list
import gleam/result
import gleam/string

pub fn first_letter(name: String) -> String {
  name
  |> string.trim
  |> string.first
  |> result.unwrap("")
}

pub fn initial(name: String) {
  name
  |> first_letter
  |> string.uppercase
  |> string.append(".")
}

pub fn initials(full_name: String) {
  full_name
  |> string.split(" ")
  |> list.map(initial)
  |> string.join(" ")
}

pub fn pair(full_name1: String, full_name2: String) {
  let initials1 = initials(full_name1)
  let initials2 = initials(full_name2)
  [
    "",
    //
    "     ******       ******",
    //
    "   **      **   **      **",
    //
    " **         ** **         **",
    //
    "**            *            **",
    //
    "**                         **",
    //
    "**     " <> initials1 <> "  +  " <> initials2 <> "     **",
    //
    " **                       **",
    //
    "   **                   **",
    //
    "     **               **",
    //
    "       **           **",
    //
    "         **       **",
    //
    "           **   **",
    //
    "             ***",
    //
    "              *",
    //
    "",
  ]
  |> string.join("\n")
}
