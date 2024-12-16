// problem_id=7427688461827653676

fn solution(stones : Array[Int]) -> Int {
  stones.sort() // incr order
  let n = stones.length()
  if n == 1 {
    return 0
  }
  let total_empty = stones[n - 1] - stones[0] + 1 - n
  let left_gap = stones[1] - stones[0] - 1
  let right_gap = stones[n - 1] - stones[n - 2] - 1
  let min_gap = @math.minimum(left_gap, right_gap)
  let max_moves = total_empty - min_gap
  return max_moves
}

test {
  inspect!(solution([3, 4, 5, 10]), content = "4")
  inspect!(solution([7, 4, 9]), content = "2")
  inspect!(solution([6, 5, 4, 3, 10]), content = "3")
  inspect!(solution([1, 2, 3, 4, 5]), content = "0")
}