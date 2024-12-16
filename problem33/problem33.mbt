// problem_id=7424418560665108524

fn solution(front : Array[Int],back : Array[Int]) -> Int {
  let n = front.length()
  let dp = Array::makei(n + 1, fn { _ => Array::make(3, 0) })
  dp[0][0] = 1
  for i in 1..<(n + 1) {
    let front_num = front[i - 1]
    let back_num = back[i - 1]
    for j in 0..<3 {
      dp[i][(j + front_num) % 3] = dp[i][(j + front_num) % 3] + dp[i - 1][j]
      dp[i][(j + back_num) % 3] = dp[i][(j + back_num) % 3] + dp[i - 1][j]
    }
  }
  return dp[n][0]
}

test {
  inspect!(solution([1, 2, 3], [2, 3, 2]), content = "3")
  inspect!(solution([3, 1, 2, 4], [1, 2, 3, 1]), content = "6")
  inspect!(solution([1, 2, 3, 4, 5], [1, 2, 3, 4, 5]), content = "32")
}