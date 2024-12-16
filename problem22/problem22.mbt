// problem_id=7424436653623017516

fn solution(s : String) -> Int {
  let occurs_count = @hashmap.new(capacity = 100)
  for chr in s.iter() {
    occurs_count[chr] = occurs_count.get_or_default(chr, 0) + 1
  }
  let mut delete_count = 0
  let mut unpaired_char_count = 0
  for _, count in occurs_count.iter2() {
    delete_count += count / 2
    unpaired_char_count += count % 2
  }
  let total_chars = delete_count + unpaired_char_count
  if total_chars <= 26 {
    return delete_count
  } else {
    return delete_count + (total_chars - 26)
  }
}

test {
  inspect!(solution("abab"), content = "2")
  inspect!(solution("aaaa"), content = "2")
  inspect!(solution("abcabc"), content = "3")
}