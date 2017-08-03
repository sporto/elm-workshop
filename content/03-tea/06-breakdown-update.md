+++
title       = "Update"
weight      = 6
+++

The next part is the `udpate` function, which is equivalent to a **reducer** in Redux:

```elm
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )
```

This function is responsible for updating your program’s model in response to the messages it receives; the Elm Runtime calls it automatically when it receives a message. This function takes two arguments: the **incoming message** (which will be a value of the `Msg` type we defined above), and the **current model**. It should return an **updated model** and a **command to run** if you need to kick off a side effect such as an HTTP request (or `Cmd.none` if you don’t).

In this example, we just return the existing model without modification, and we perform no command. At this point, the only message we’ve said we can receive is a `NoOp`, so it makes sense that our `update` function that responds to these messages will effectively “do nothing”. Once again, this function is effectively a placeholder that we’ll expand as we add features to our program.
