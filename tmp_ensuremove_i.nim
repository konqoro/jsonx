import jsonx/streams

proc test(): string =
  var s = streams.open("")
  result = ensureMove(s.s)
  s.s = ""

discard test()
