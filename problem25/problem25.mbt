// problem_id=7414004855075225644

fn min(x : Int, y : Int, z : Int) -> Int {
  @math.minimum(x, @math.minimum(y, z))
}

fn solution(dna1 : String, dna2 : String) -> Int {
  let memo = Array::makei(
    dna1.length(),
    fn { _ => Array::make(dna2.length(), -1) }
  )
  fn dfs(i1 : Int, i2 : Int) -> Int {
    if i1 == -1 {
      return i2 + 1
    }
    if i2 == -1 {
      return i1 + 1
    }
    if memo[i1][i2] != -1 {
      return memo[i1][i2]
    }
    if dna1[i1] == dna2[i2] {
      memo[i1][i2] = dfs(i1 - 1, i2 - 1)
    } else {
      memo[i1][i2] = min(
        dfs(i1, i2 - 1) + 1,
        dfs(i1 - 1, i2) + 1,
        dfs(i1 - 1, i2 - 1) + 1
      )
    }
    return memo[i1][i2]
  }
  dfs(dna1.length() - 1, dna2.length() - 1)
}

test {
  inspect!(solution("AGT", "AGCT"), content = "1")
  inspect!(solution("AACCGGTT", "AACCTTGG"), content = "4")
  inspect!(solution("ACGT", "TGC"), content = "3")
  inspect!(solution("A", "T"), content = "1")
  inspect!(solution("AGCTTAGC", "AGCTAGCT"), content = "2")
  inspect!(solution("AGCCGAGC", "GCTAGCT"), content = "4")
}