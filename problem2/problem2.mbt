// problem_id=7414004855076700204




fn solution(k : Int, data : Array[Int]) -> Int {
  // memo[nth_day][rest_food]
  let memo = Array::makei(data.length(), fn { _ => Array::make(k + 1, -1) })
  fn dfs(curr_date : Int, rest_food : Int) -> Int {
    if curr_date == data.length() {
      return 0
    }
    if memo[curr_date][rest_food] != -1 {
      return memo[curr_date][rest_food]
    }
    let mut cost = @int.max_value
    let bought = if rest_food == 0 { 1 } else { 0 }
    for i = bought; i <= k - rest_food; i = i + 1 {
      let current_cost = i * data[curr_date] + dfs(curr_date + 1, rest_food + i - 1)
      cost = @math.minimum(cost, current_cost)
    }
    memo[curr_date][rest_food] = cost
    return cost
  }
  dfs(0, 0)
}

test {
  inspect!(solution(2, [1, 2, 3, 3, 2]), content = "9")
  inspect!(solution(3, [4, 1, 5, 2, 1, 3]), content = "9")
  inspect!(solution(1, [3, 2, 4, 1]), content = "10")
  inspect!(solution(1, [5, 3, 2, 4, 1]), content = "15")
}