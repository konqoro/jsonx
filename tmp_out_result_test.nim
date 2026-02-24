import jsonx
import jsonx/parsejson

type PageState = object
  title: string
  page: int

proc readJson(dst: var PageState; p: var JsonParser) =
  eat(p, tkCurlyLe)
  while p.tok != tkCurlyRi:
    if p.tok != tkString:
      raiseParseErr(p, "string for object key")
    case p.a
    of "title":
      discard getTok(p)
      eat(p, tkColon)
      readJson(dst.title, p)
    of "page":
      discard getTok(p)
      eat(p, tkColon)
      readJson(dst.page, p)
    else:
      raiseParseErr(p, "known PageState field")
    expectObjectSeparator(p)
  eat(p, tkCurlyRi)

proc withDefaultTitle(json: string): PageState =
  result = PageState(title: "keep-me", page: -1)
  fromJson(json, result)

let state = withDefaultTitle("""{"page": 3}""")
echo "title=", state.title
echo "page=", state.page
