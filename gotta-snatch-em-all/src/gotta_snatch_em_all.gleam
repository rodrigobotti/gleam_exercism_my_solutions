import gleam/list
import gleam/result
import gleam/set.{type Set}
import gleam/string

pub fn new_collection(card: String) -> Set(String) {
  set.from_list([card])
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  case collection |> set.contains(card) {
    True -> #(True, collection)
    False -> #(False, collection |> set.insert(card))
  }
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  let trade =
    set.contains(collection, my_card) && !set.contains(collection, their_card)

  #(trade, collection |> set.delete(my_card) |> set.insert(their_card))
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  collections
  |> list.reduce(set.intersection)
  |> result.unwrap(set.new())
  |> set.to_list
  |> list.sort(by: string.compare)
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  collections
  |> list.fold(set.new(), set.union)
  |> set.size
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  collection
  |> set.filter(fn(c) { c |> string.starts_with("Shiny ") })
}
