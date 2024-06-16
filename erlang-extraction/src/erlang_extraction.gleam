pub type GbTree(key, value)

@external(erlang, "gb_trees", "empty")
pub fn gb_trees_empty() -> GbTree(key, value)

@external(erlang, "gb_trees", "insert")
pub fn gb_trees_insert(
  key: key,
  value: value,
  tree: GbTree(key, value),
) -> GbTree(key, value)

@external(erlang, "gb_trees", "delete_any")
pub fn gb_trees_delete(key: key, tree: GbTree(key, value)) -> GbTree(key, value)

pub fn new_gb_tree() -> GbTree(k, v) {
  gb_trees_empty()
}

pub fn insert(tree: GbTree(k, v), key: k, value: v) -> GbTree(k, v) {
  gb_trees_insert(key, value, tree)
}

pub fn delete(tree: GbTree(k, v), key: k) -> GbTree(k, v) {
  gb_trees_delete(key, tree)
}
