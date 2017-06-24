+++
title       = "View"
weight      = 5
+++

The next part is the view:

```
view : Model -> Html Msg
view model =
    div [] [ text model ]
```

This is a function that take a `Model` and return `Html`.

Note `Html Msg`. `Msg` is a type variable. This means that this `Html` emits messages of a concrete type `Msg`. 

Type variables are like generics in other languages. e.g. `Html<Msg>` in Rust.