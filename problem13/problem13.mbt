// problem_id=7424436653623246892

fn solution(n : Int) -> Array[Int] {
  let result = Array::new(capacity = n)
  for i = 0; i < n; i = i + 1 {
    for j = n; j > i; j = j - 1 {
      result.push(j)
    }
  } else {
    return result
  }
}

test {
  inspect!(solution(3), content = "[3, 2, 1, 3, 2, 3]")
  inspect!(solution(4), content = "[4, 3, 2, 1, 4, 3, 2, 4, 3, 4]")
  inspect!(solution(5), content = "[5, 4, 3, 2, 1, 5, 4, 3, 2, 5, 4, 3, 5, 4, 5]")
}