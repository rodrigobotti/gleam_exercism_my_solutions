import gleam/float
import gleam/list
import gleam/order.{type Order}

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  { f -. 32.0 } /. 1.8
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  case left, right {
    Fahrenheit(fl), Fahrenheit(fr) -> float.compare(fl, fr)
    Celsius(cl), Celsius(cr) -> float.compare(cl, cr)
    Celsius(cl), Fahrenheit(fr) -> float.compare(cl, fahrenheit_to_celsius(fr))
    Fahrenheit(fl), Celsius(cr) -> float.compare(fahrenheit_to_celsius(fl), cr)
  }
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  cities
  |> list.sort(by: fn(l, r) {
    compare_temperature(l.temperature, r.temperature)
  })
}
