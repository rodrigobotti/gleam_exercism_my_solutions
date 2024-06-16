import gleam/option.{type Option, None, Some, unwrap}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  case player.name {
    Some(name) -> name
    None -> "Mighty Magician"
  }
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health, player.level {
    h, _ if h > 0 -> None
    0, l if l >= 10 -> Some(Player(..player, health: 100, mana: Some(100)))
    _, _ -> Some(Player(..player, health: 100))
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  let damage = cost * 2
  case player.mana {
    Some(m) if m < cost -> #(player, 0)
    None -> {
      let health = player.health - cost
      let health = case health {
        h if h <= 0 -> 0
        h -> h
      }
      #(Player(..player, health: health), 0)
    }
    _ -> #(Player(..player, mana: Some(unwrap(player.mana, 0) - cost)), damage)
  }
}
