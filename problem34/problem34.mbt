fn solution(nums : Array[Int]) -> Int {
  let nums = @hashset.from_array(nums).iter().collect()
  nums.sort()
  if nums.length() < 3 {
    nums[nums.length() - 1]
  } else {
    nums[nums.length() - 3]
  }
}

test {
  inspect!(solution([3, 2, 1]), content = "1")
  inspect!(solution([1, 2]), content = "2")
  inspect!(solution([2, 2, 3, 1]), content = "1")
}