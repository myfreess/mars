// problem_id=7424436653622296620

// fn gcd(x : Int, y : Int) -> Int {
//   loop x, y {
//     x, 0 => x
//     x, y => continue y, x % y
//   }
// }

// not optimized

// 这题应该是用质数求

///|
type BitMap Array[UInt]

///|
fn op_get(self : BitMap, k : Int) -> Bool {
  (self._[k / 32] & (0x80000000U >> (k % 32))) != 0
}

///|
fn set(self : BitMap, k : Int) -> Unit {
  let n = k % 32
  let i = k / 32
  self._[i] = self._[i] | (0x80000000U >> n)
}

///|
fn unset(self : BitMap, k : Int) -> Unit {
  let n = k % 32
  let i = k / 32
  self._[i] = self._[i] & (0x80000000U >> n).lnot()
}

///|
let is_prime_ : BitMap = {
  let bitmap = BitMap(Array::make(20000, 0xFFFF_FFFFU))
  bitmap.unset(0)
  bitmap.unset(1)
  bitmap
}

///|
fn is_prime(n : Int) -> Bool {
  if n != 2 && n % 2 == 0 {
    is_prime_.unset(n)
    return false
  } else {
    return is_prime_[n]
  }
}

///|
fn eratosthenes(n : Int) -> Array[Int] {
  let primes : Array[Int] = Array::new(capacity=100)
  for i = 2; i <= n; i = i + 1 {
    if is_prime(i) {
      primes.push(i)
      if i.to_uint64() * i.to_uint64() > n.to_uint64() {
        continue
      }
      for j = i * i; j <= n; j = j + i {
        is_prime_.unset(j)
      }
    }
  } else {
    primes
  }
}

///|
let primes : Array[Int] = eratosthenes(640000 - 1) // length = 52074

test {
  inspect!(
    eratosthenes(500),
    content="[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499]",
  )
}

///|
fn solution(n : Int, k : Int) -> Int {
  let mut result = k
  if is_prime(k) {
    for i = 2; i < n + 1; i = i + 1 {
      result += i * k
    } else {
      return result
    }
  } else {
    for i = 0; i < n - 1; i = i + 1 {
      result += primes[i] * k
    } else {
      return result
    }
  }
}

test {
  inspect!(solution(3, 1), content="6")
  inspect!(solution(2, 2), content="6")
  inspect!(solution(4, 3), content="30")
}
