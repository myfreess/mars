// problem_id=7414004855076077612

fn digit(chr : Char) -> Int {
  chr.to_int() - 48
}

fn solution(numbers : Array[String]) -> Int {
  fn go(index : Int, current_sum : Int) -> Int {
    if index == numbers.length() {
      if current_sum % 2 == 0 {
        return 1
      } else {
        return 0
      }
    }
    let mut count = 0
    for d in numbers[index].iter() {
      count += go(index + 1, current_sum + digit(d))
    } else {
      return count
    }
  }
  go(0, 0)
}

test {
  inspect!(solution(["123", "456", "789"]), content = "14")
  inspect!(solution(["123456789"]), content = "4")
  inspect!(solution(["14329", "7568"]), content = "10")
}