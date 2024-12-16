// problem_id=7414004855077617708

fn solution(array : Array[Int]) -> Int {
  let dp = Array::makei(array.length(), fn { _ => Array::make(array.length(), -1) })
  let mut max_r = @int.min_value
  for down = 0; down < array.length(); down = down + 1 {
    for up = down; up < array.length(); up = up + 1 {
      if up == down {
        dp[down][up] = array[up]
        // println("dp[\{down}][\{up}] = array[\{up}] = \{array[up]}")
      } else {
        dp[down][up] = @math.minimum(dp[down][up - 1], array[up])
        // println("dp[\{down}][\{up}] = min(array[\{up}], dp[\{down}][\{up - 1}]) = \{dp[down][up]}")
      }
      max_r = @math.maximum(max_r, dp[down][up] * ((up - down) + 1))
    }
  } else {
    return max_r
  }
}

test {
  inspect!(solution([1, 2, 3, 4, 5]), content = "9")
  inspect!(solution([5, 4, 3, 2, 1, 6]), content = "9")
  inspect!(solution([4, 4, 4, 4]), content = "16")
}