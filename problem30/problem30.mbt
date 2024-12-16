// problem_id=7424418560932020268

fn solution(s : String) -> Int {
  let mut k_count = 0
  let mut u_count = 0
  for chr in s.iter() {
    match chr {
      'K' | 'k' => k_count += 1
      'U' | 'u' => u_count += 1
      _ => continue
    }
  }
  return @math.minimum(k_count, u_count)
}

test {
  inspect!(solution("AUBTMKAxfuu"), content = "1")
  inspect!(solution("KKuuUuUuKKKKkkkkKK"), content = "6")
  inspect!(solution("abcdefgh"), content = "0")
}