import gleam/list

pub fn wines_of_color(wines: List(Wine), color: Color) -> List(Wine) {
  // // without gleam/list.filter
  // case wines {
  //   [] -> []
  //   [w, ..tail] if w.color == color -> [w, ..wines_of_color(tail, color)]
  //   [_, ..tail] -> wines_of_color(tail, color)
  // }
  wines |> list.filter(fn(w) { w.color == color })
}

pub fn wines_from_country(wines: List(Wine), country: String) -> List(Wine) {
  wines |> list.filter(fn(w) { w.country == country })
}

pub fn filter(
  wines: List(Wine),
  color color: Color,
  country country: String,
) -> List(Wine) {
  wines |> list.filter(fn(w) { w.color == color && w.country == country })
}

pub type Wine {
  Wine(name: String, year: Int, country: String, color: Color)
}

pub type Color {
  Red
  Rose
  White
}
