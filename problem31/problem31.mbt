// problem_id=7427688461827588140

fn digit(chr : Char) -> Int {
  chr.to_int() - 48
}

fn solution(word : String) -> Int {
  let integers = @hashset.new()
  let mut num = 0
  for c in word.iter() {
    match c {
      '0'..='9' => {
        num = num * 10 + digit(c)
      }
      _ => {
        if num != 0 && not(integers.contains(num)) {
          integers.add(num)
        }
        num = 0
      }
    }
  } else {
    if num != 0 && not(integers.contains(num))  {
      integers.add(num)
    }
    return integers.size()
  }
}


test {
  inspect!(solution("a123bc34d8ef34"), content="3")
  inspect!(solution("t1234c23456"), content="2")
  inspect!(solution("a1b01c001d4"), content="2")
}