// problem_id=7427688461827653676

// Each pairing corresponds to an out team, with only one team not out in the end
fn solution(n : Int) -> Int {
  if n == 0 {
    return 0
  } else {
    return n - 1
  }
}

test {
  inspect!(solution(7), content = "6")
  inspect!(solution(14), content = "13")
}