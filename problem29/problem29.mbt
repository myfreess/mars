// problem_id=7424418560666681388

fn solution(s : String, k : Int) -> String {
  let buf = StringBuilder::new(size_hint = s.length() * 2 ^ k)
  let mut s = s
  for i = 0; i < k; i = i + 1 {
    for chr in s.iter() {
      match chr {
        'a' => buf.write_string("bc")
        'b' => buf.write_string("ca")
        'c' => buf.write_string("ab")
        _   => panic()
      }
    }
    s = buf.to_string()
    buf.reset()
  }
  return s
}

test {
  inspect!(solution("abc", 2), content = "caababbcbcca")
  inspect!(solution("abca", 3), content = "abbcbccabccacaabcaababbcabbcbcca")
  inspect!(solution("cba", 1), content = "abcabc")
}