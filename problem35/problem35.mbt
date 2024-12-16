// problem_id=7424418560668090412

fn solution(a : Array[Int], b : Array[Int]) -> Array[Int] {
  let u = @hashset.from_array(a).intersection(@hashset.from_array(b)).iter().collect()
  u.sort()
  return u.rev()
}

test {
  inspect!(solution([1, 2, 3, 7], [2, 5, 7]), content = "[7, 2]")
  inspect!(solution([1, 4, 8, 10], [2, 4, 8, 10]), content = "[10, 8, 4]")
  inspect!(solution([3, 5, 9], [1, 4, 6]), content = "[]")
  inspect!(solution([1, 2, 3], [1, 2, 3]), content = "[3, 2, 1]")
}
