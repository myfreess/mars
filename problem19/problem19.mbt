// problem_id=7424418560665370668

fn solution(k : Int, s : String) -> String {
  let s = s.to_array()
  let mut move_count = k
  for i = 0; i < s.length() && k > 0; i = i + 1 {
    if s[i] == '0' {
      let mut curr_zero = i
      while curr_zero > 0 && s[curr_zero - 1] == '1' && move_count > 0 {
        s.swap(curr_zero, curr_zero - 1)
        curr_zero = curr_zero - 1
        move_count = move_count - 1
      }
    }
  } else {
    String::from_array(s)
  }
}


test {
  inspect!(solution(2, "01010"), content = "00101")
  inspect!(solution(3, "1101001"), content = "0110101")
  inspect!(solution(1, "1001"), content = "0101")
}