// problem_id=7414004855075520556

///|
fn compile_template(t : String) -> (String, Array[String], String) {
  let start = {
    let i = t.index_of("{")
    if i == -1 {
      0
    } else {
      i
    }
  }
  let end = {
    let i = t.last_index_of("}")
    if i == -1 {
      t.length()
    } else {
      i
    }
  }
  let head = t.substring(start=0, end=start)
  let tail = t.substring(start=end + 1, end=t.length())
  let t = t.substring(start~, end=end + 1)
  let template = Array::new(capacity=t.length() / 4)
  let mut offset = 0
  while offset < t.length() {
    let i = t.index_of(from=offset, "{")
    if i == -1 {
      template.push(t.substring(start=offset, end=t.length()))
      break
    }
    let part = t.substring(start=offset, end=i)
    if part != "" {
      template.push(part)
    }
    offset = t.index_of(from=offset, "}") + 1
  }
  return (head, template, tail)
}

///|
fn wildcard_match(
  template : (String, Array[String], String),
  title : String
) -> Bool {
  let (head, template, tail) = template
  if not(title.starts_with(head) && title.ends_with(tail)) {
    return false
  }
  if template.length() == 0 {
    return true
  }
  let title = title.substring(
    start=head.length(),
    end=title.length() - tail.length(),
  )
  let mut offset = 0
  for part in template.iter() {
    let i = title.index_of(from=offset, part)
    if i == -1 {
      return false
    } else {
      offset = i + part.length()
    }
  } else {
    return true
  }
}

///|
fn solution(template : String, titles : Array[String]) -> Array[Bool] {
  let template = compile_template(template)
  let results = Array::new(capacity=titles.length())
  for title in titles {
    results.push(wildcard_match(template, title))
  } else {
    return results
  }
}

test {
  inspect!(solution("{}", ["foo", "bar", "baz"]), content="[true, true, true]")
  inspect!(
    solution("f{}o", ["foo", "bar", "baz"]),
    content="[true, false, false]",
  )
  inspect!(
    solution("ad{xyz}cdc{y}f{x}e", [
      "adcdcefdfeffe", "adcdcefdfeff", "dcdcefdfeffe", "adcdcfe",
    ]),
    content="[true, false, false, true]",
  )
  inspect!(
    solution("{xxx}h{cQ}N{vF}u{XTA}S{NTA}MLCq{yyy}", [
      "CLSomGhcQNvFuzENTAMLCqxBdj", "CLSomNvFuXTASzENTAMLCqxBdj", "CLSomFuXTASzExBdj",
      "CLSoQNvFuMLCqxBdj", "SovFuXTASzENTAMLCq", "mGhcQNvFuXTASzENTAMLCqx",
    ]),
    content="[false, false, false, false, false, true]",
  )
  inspect!(
    solution("a{bdc}efg", ["abcdefg", "abefg", "efg"]),
    content = "[true, true, false]"
  )
}
