// problem_id=7414004855077584940
fn solution(max : Int, cards : Array[Int]) -> (Int, Int) {
  fn total(fst : Int, snd : Int) -> Int {
    fst * 3 + snd * 2
  }
  let count_table = @hashmap.new(capacity = cards.length())
  for card in cards {
    if count_table.contains(card) {
      count_table[card] = count_table[card].unwrap() + 1
    } else {
      count_table[card] = 1
    }
  }
  let count_table = count_table.iter2()
  let mut max_full_house = (0, 0)
  for c1, cc1 in count_table {
    if cc1 >= 3 {
      for c2, cc2 in count_table {
        if c2 != c1 && cc2 >= 2 && total(c1, c2) <= max {
          if c1 > max_full_house.0 || (c1 == max_full_house.0 && c2 > max_full_house.1) {
            max_full_house = (c1, c2)
          }
        }
      }
    }
  }
  return max_full_house
}

test {
  inspect!(solution(34, [6, 6, 6, 8, 8, 8, 5, 5, 1]), content = "(8, 5)")
  inspect!(solution(37, [9, 9, 9, 9, 6, 6, 6, 6, 13]), content = "(6, 9)")
  inspect!(solution(40, [1, 11, 13, 12, 7, 8, 11, 5, 6]), content = "(0, 0)")
}