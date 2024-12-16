// problem_id=7424436653624459308

fn solution(s : String, c : String) -> Int {
  let products = Array::new(capacity = s.length())
  for chr in s.iter() {
    products.push(chr.to_int())
  }
  let demands = Array::new(capacity = c.length())
  for chr in c.iter() {
    demands.push(chr.to_int())
  }
  let product_count = @hashmap.new(capacity = products.length())
  let demand_count = @hashmap.new(capacity = demands.length())
  for product in products {
    product_count[product] = product_count.get_or_default(product, 0) + 1
  }
  for demand in demands {
    demand_count[demand] = demand_count.get_or_default(demand, 0) + 1
  }
  let mut total_count = 0
  for product, count in demand_count.iter2() {
    if product_count.contains(product) {
      total_count += @math.minimum(product_count[product].unwrap(), count)
    }
  } else {
    return total_count
  }
}

test {
  inspect!(solution("abc", "abcd"), content = "3")
  inspect!(solution("abbc", "bb"), content = "2")
  inspect!(solution("bcdea", "abcd"), content = "4")
}