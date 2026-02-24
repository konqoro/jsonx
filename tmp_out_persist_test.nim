import jsonx

type PageState = object
  title: string
  page: int

proc initPageState(title: string): PageState =
  PageState(title: title, page: -1)

var state = initPageState("keep-me")
fromJson("""{"page": 3}""", state)

echo "title=", state.title
echo "page=", state.page
