// problem_id=7424436653624754220

fn solution(s : String, a : Array[Int], m : Int, k : Int) -> Int {
  let s = s.to_array()
  let dishes = Array::new(capacity = s.length())
  for i = 0; i < s.length(); i = i + 1 {
    dishes.push((a[i], s[i] == '1'))
  }
  dishes.sort_by_key(fn { x => x.0 })
  let selected_dishes = Array::new(capacity = k)
  let mut mushroom_count = 0
  let mut total_price = 0
  for pair in dishes.iter() {
    let (price, has_mushroom) = pair
    if selected_dishes.length() == k {
      break
    }
    if has_mushroom && mushroom_count >= m {
      continue
    }
    selected_dishes.push((price, has_mushroom))
    total_price += price
    if has_mushroom {
      mushroom_count += 1
    }
  }
  if selected_dishes.length() < k {
    return -1
  } else {
    return total_price
  }
}

test {
  inspect!(solution("001", [10, 20, 30], 1, 2), content = "30")
  inspect!(solution("111", [10, 20, 30], 1, 2), content = "-1")
  inspect!(solution("0101", [5, 15, 10, 20], 2, 3), content = "30")
}