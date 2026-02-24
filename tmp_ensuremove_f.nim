import jsonx/streams

proc test(): string =
  let s = streams.open("")
  result = ensureMove(s.s)

discard test()
