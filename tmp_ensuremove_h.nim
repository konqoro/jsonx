import jsonx/streams

proc test(): string =
  var s = streams.open("")
  let t = ensureMove(s.s)
  result = t

discard test()
