import jsonx/streams

proc f(): string =
  let s = streams.open("")
  result = ensureMove(s.s)

proc g(): string =
  var s = streams.open("")
  result = ensureMove(s.s)

proc h(): string =
  var s = streams.open("")
  let tmp = ensureMove(s.s)
  result = tmp

proc i(): string =
  var s = streams.open("")
  result = ensureMove(s.s)
  s.s = ""

discard g()
