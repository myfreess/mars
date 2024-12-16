// problem_id=7414004855075848236

fn solution(a : Int, b : Int, arr : Array[Int]) -> Int {
  let mut result = 0
  let total_sum = arr.fold(init = 0, fn { x, y => x + y})
  if total_sum % 10 == a || total_sum % 10 == b {
    result = 1
  }
  // dp[i][mod_a][mod_b]
  let dp = Array::makei(arr.length() + 1, fn { _ => Array::makei(10, fn { _ => Array::make(10, 0) }) })
  dp[0][0][0] = 1
  for i in 1..<(arr.length() + 1) {
    let num = arr[i - 1] % 10
    for mod_a in 0..<10 {
      for mod_b in 0..<10 {
        if dp[i - 1][mod_a][mod_b] > 0 {
          let new_mod_a = (mod_a + num) % 10 
          dp[i][new_mod_a][mod_b] += dp[i - 1][mod_a][mod_b]
          let new_mod_b = (mod_b + num) % 10
          dp[i][mod_a][new_mod_b] += dp[i - 1][mod_a][mod_b]
        }
      }
    }
  }
  result += dp[arr.length()][a][b]
  return result
}

test {
  inspect!(solution(1, 2, [1,1,1]), content = "3")
  inspect!(solution(3, 5, [1,1,1]), content = "1")
  inspect!(solution(1, 1, [1, 1]), content = "2")
}