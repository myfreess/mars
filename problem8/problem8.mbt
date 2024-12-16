// problem_id=7414004855077847084

fn solution(numbers : Array[Int]) -> Int {
  let limit = numbers.length() / 2
  let count_table = @hashmap.new(capacity = limit)
  for number in numbers {
    count_table[number] = count_table.get_or_default(number, 0) + 1
    if count_table[number].unwrap() > limit {
      return number
    }
  } else {
    panic()
  }
}

test {
  inspect!(solution([1, 3, 8, 2, 3, 1, 3, 3, 3]), content = "3")
  inspect!(solution([5, 5, 5, 1, 2, 5, 5]), content = "5")
  inspect!(solution([9, 9, 9, 9, 8, 9, 8, 8]), content = "9")
}