+++
title       = "View"
weight      = 5
+++

The next part is the `view` function:

```elm
view : Model -> Html Msg
view model =
    div [] [ text model ]
```

This is a function that takes a `Model` argument and returns `Html`.

If you’re wondering about the `Html Msg`. The `Msg` here is called a type variable. In this example, it indicates that the `Html` that our `view` returns  will only ever emit the messages specified in our program’s `Msg` type.  Being specific about this enables the Elm compiler to guarantee that our program handles all possible messages.

For the language nerds, types like `Html` that take a type variable are equivalent to the ‘generics’ that you’ll find in many other typed languages, like Java or Rust.
