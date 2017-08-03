+++
title       = "Exercise"
weight      = 3
+++

In the following program, implement the commented parts:

```
module Hello exposing (..)

import Html exposing (div, text)


main =
    div []
        [ text "Hello"

        -- Add another text node with the word "World"
        ]
```

**Note:** In Elm, `--` signals the start of a comment, running to the end of the line (just like `//` in JavaScript).

**Hint:** Although Elm doesn’t use commas between function arguments, it _does_ use commas between the items in a list.
