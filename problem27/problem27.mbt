// problem_id=7424436653623541804

fn solution(u : Array[Int]) -> Int {
  // assert u.length() > 1
  u.sort()
  let min_level = u[0]
  let mut count = 1
  for i = 1; i < u.length(); i = i + 1 {
    if u[i] == min_level {
      count += 1
    } else {
      break
    }
  }
  return u.length() - count
}

test {
  inspect!(solution([1, 2, 3, 1, 2]), content = "3")
  inspect!(solution([100000, 100000, 100000, 100000]), content = "0")
  inspect!(solution([1, 1, 1, 2, 2, 2]), content = "3")
}