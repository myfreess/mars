// problem_id=7424436653621575724

fn solution(musics : Array[Int]) -> Array[Int] {
  if musics.length() == 0 && musics.length() == 1 {
    return musics
  }

  let order = Array::new(capacity = musics.length())
  let musics = @queue.from_array(musics)
  order.push(musics.unsafe_pop())
  while musics.length() != 0 {
    musics.push(musics.unsafe_pop())
    order.push(musics.unsafe_pop())
  } else {
    return order
  }
}

test {
  inspect!(solution([5, 3, 2, 1, 4]), content = "[5, 2, 4, 1, 3]")
  inspect!(solution([4, 1, 3, 2]), content = "[4, 3, 1, 2]")
  inspect!(solution([1, 2, 3, 4, 5, 6]), content = "[1, 3, 5, 2, 6, 4]")
}