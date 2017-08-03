+++
title       = "Your first app"
weight      = 2
+++

In your project folder, create a new file named `Hello.elm`:

```elm
module Hello exposing (..)

import Html exposing (div, text)


main =
    div [] [ text "Hello" ]
```

Back at the terminal prompt, run:

```
elm-reactor
```

Then open http://localhost:8000 and click on `Hello.elm`. This should display the text “Hello” on an otherwise blank page. Excellent -- we have our first Elm app!

---

Let's break it down:

```elm
module Hello exposing (..)
```

This file defines an Elm module, and this line states the module’s name. The module name must match the file name; so in this case, the file must be named `Hello.elm`.

```elm
import Html exposing (div, text)
```

This imports functions from the `Html` module. `div` and `text` are functions that produce HTML nodes.

```elm
main =
```

Programs in Elm start with the `main` function. The Elm runtime uses this its entry point.

```elm
div [] [ text "Hello" ]
```

This is the body of our `main` function. It returns a `div` containing some plain text, equivalent to the following HTML:

```html
<div>Hello</div>
```

The `div` function takes two arguments:

1. a list of attributes (e.g. `class`, `id`, etc.)

    In this example, we have passed in an empty list (`[]`), so the `div` will have no attributes.

2. a list of HTML child nodes

    In this example, we have passed a list with a single entry: a text node. To create the text node, we called the `text` function, passing it a string (`"Hello"`).
