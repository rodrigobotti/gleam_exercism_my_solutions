import gleam/int
import gleam/list

pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

fn pizza_price_rec(pizza: Pizza, acc: Int) -> Int {
  case pizza {
    ExtraSauce(p) -> pizza_price_rec(p, acc + 1)
    ExtraToppings(p) -> pizza_price_rec(p, acc + 2)
    Margherita -> 7 + acc
    Caprese -> 9 + acc
    Formaggio -> 10 + acc
  }
}

pub fn pizza_price(pizza: Pizza) -> Int {
  pizza_price_rec(pizza, 0)
}

pub fn order_price(order: List(Pizza)) -> Int {
  let extra = case order |> list.length {
    1 -> 3
    2 -> 2
    _ -> 0
  }

  let price =
    order
    |> list.map(pizza_price)
    |> int.sum

  price + extra
}
