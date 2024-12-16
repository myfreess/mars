// problem_id=7424436653372506156

fn solution(a : Int, b : Int) -> Int {
  let r = a / b 
  if r * b < a {
    r + 1
  } else {
    r
  }
}

test {
  inspect!(solution(10, 1), content = "10")
  inspect!(solution(10, 2), content = "5")
  inspect!(solution(10, 3), content = "4")
}