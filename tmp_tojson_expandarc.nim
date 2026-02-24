import jsonx

type Foo = object
  i: int
  s: string

let x = Foo(i: 1, s: "abc")
discard toJson(x)
