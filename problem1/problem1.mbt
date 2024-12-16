// problem_id=7414004855077912620

typealias Occurs = @hashset.T[Int]
fn solution(cards : Array[Int]) -> Int {
  let occurs : Occurs = @hashset.new()
  for card in cards {
    if occurs.contains(card) {
      occurs.remove(card)
    } else {
      occurs.add(card)
    }
  } else {
    let mut res = -1
    occurs.each(fn { unique => res = unique })
    return res
  }
}

test {
  inspect!(solution([1, 1, 2, 2, 3, 3, 4, 5, 5]), content = "4")
  inspect!(solution([0, 1, 0, 1, 2]), content = "2")
  inspect!(solution([7, 3, 3, 7, 10]), content = "10")
}