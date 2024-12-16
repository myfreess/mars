// problem_id=7424418560930512940
fn solution(s : String) -> String {
  let buf = StringBuilder::new(size_hint = s.length())
  // strip leading zero
  let s = s.trim_start("0")
  let dot_pos = s.last_index_of(".")
  let mut integer_part = ""
  let mut decimal_part = ""
  if dot_pos == -1 {
    integer_part = s
    decimal_part = ""
  } else {
    integer_part = s.substring(end = dot_pos)
    decimal_part = s.substring(start = dot_pos)
  }
  let start = integer_part.length() % 3
  buf.write_string(integer_part.substring(end = start))
  if start > 0 && integer_part.length() > 3 {
    buf.write_char(',')
  }
  for i = start; i < integer_part.length(); i = i + 3 {
    buf.write_string(integer_part.substring(start = i, end = i + 3))
    if i + 3 < integer_part.length() {
      buf.write_char(',')
    }
  } else {
    buf.write_string(decimal_part)
    buf.to_string()
  }
}

test {
  inspect!(solution("0000123456789"), content = "123,456,789")
  inspect!(solution("1"), content = "1")
  inspect!(solution("12"), content = "12")
  inspect!(solution("123"), content = "123")
  inspect!(solution("1234"), content = "1,234")
  inspect!(solution("1294512.12412"), content = "1,294,512.12412")
  inspect!(solution("0000123456789.99"), content = "123,456,789.99")
  inspect!(solution("1234.5678"), content = "1,234.5678")
}