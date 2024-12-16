// problem_id=7424436653624328236

fn solution(values : Array[Int]) -> Int {
  let mut max_score = -1
  let mut max_score_i = values[0]
  for j = 1; j < values.length(); j = j + 1 {
    let current_score = max_score_i + (values[j] - j)
    if current_score > max_score {
      max_score = current_score
    }
    if values[j] + j > max_score_i {
      max_score_i = values[j] + j
    }
  }
  return max_score
}

test {
  inspect!(solution([8, 3, 5, 5, 6]), content = "11")
  inspect!(solution([10, 4, 8, 7]), content = "16")
  inspect!(solution([1, 2, 3, 4, 5]), content = "8")
}