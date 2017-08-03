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

If you’re curious, here’s a little explanation about `Html Msg`. Elm’s `Html` type takes an argument that indicates the type of messages the user interface will generate. In this example, we pass it `Msg` to indicate that the `Html` that our `view` returns  will only ever emit the messages specified by our program’s `Msg` type. Being specific about this enables the Elm compiler to guarantee that our program handles every message it can produce.

If you’re familiar with a language like TypeScript, Java or Rust that supports generic types, and you're wondering if `Html` might be a generic, you’re absolutely right. If you’ve never heard of generic types, don’t sweat it.
