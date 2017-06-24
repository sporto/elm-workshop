# Your first app

In this folder add file `Hello.elm`:

```elm
module Hello exposing (..)

import Html exposing (div, text)


main =
    div []
        [ text "Hello"
        ]
```

In the terminal run:

```
elm-reactor
```

Then open http://localhost:8000 and click on `Hello.elm`. This should show `Hello`. Excellent, our first Elm app!

---

Let's break it down:

```
module Hello exposing (..)
```

Is the name of the current module. This should match the file name i.e. `Hello.elm`

```
import Html exposing (div, text)
```

This imports functions from the Html module. `div` and `text` are functions that produce html nodes.

```
main =
```

Programs in Elm start on the `main` function. The Elm runtime uses this as entry point.

```
div []
    [ text "Hello"
    ]
```

This creates a div and text, equivalent to:

```
<div>Hello</div>
```

The `div` function takes arguments. The first argument is a list of attributes e.g. `class`, `id`, etc. The second argument is a list of children html nodes.