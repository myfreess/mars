// problem_id=7424418560929628204

fn solution(a : Int, b : Int) -> Int {
  let a= a.to_string()
  let b = b.to_string()
  let mut max_result = 0
  for i = 0; i <= a.length(); i = i + 1 {
    let n = 
      try { 
        @strconv.parse_int!(a.substring(end = i) + b + a.substring(start = i)) 
      } catch {
        _ => abort("impossible")
      }
    max_result = @math.maximum(max_result, n)
  }
  return max_result
}

test {
  inspect!(solution(76543, 4), content = "765443")
  inspect!(solution(1, 0), content = "10")
  inspect!(solution(44, 5), content = "544")
  inspect!(solution(666, 6), content = "6666")
}