// problem_id=7424418560931168300

fn solution(s : String, t : String) -> Int {
  let mut operations = 0
  let mut i = 0
  let mut j = 0
  while i < s.length() && j < t.length() {
    if s[i] == t[j] {
      i += 1
      j += 1
    } else {
      operations += 1
      i += 1
      j += 1
    }
  }
  if i < s.length() {
    operations += s.length() - i
  }
  return operations
}

test {
  inspect!(solution("aba", "abb"), content = "1")
  inspect!(solution("abcd", "efg"), content = "4")
  inspect!(solution("xyz", "xy"), content = "1")
  inspect!(solution("hello", "helloworld"), content = "0")
  inspect!(solution("same", "same"), content = "0")
}