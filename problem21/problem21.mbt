// problem_id=7424418560931561516

fn distance(n : Int, i : Int, j : Int) -> Int {
  @math.minimum((i - j).abs(), n - (i - j).abs())
}

fn solution(arr : Array[Int]) -> Int {
  let mut max_value = 0
  for i in 0..<arr.length() {
    for j in 0..<arr.length() {
      max_value = @math.maximum(max_value, (arr[i] + arr[j]) * distance(arr.length(), i, j))
    }
  } else {
    return max_value
  }
}

test "max contribution value" {
  inspect!(solution([1, 2, 3]), content = "5")
  inspect!(solution([4, 1, 2, 3]), content = "12")
  inspect!(solution([1, 5, 3, 7, 2]), content = "24")
}