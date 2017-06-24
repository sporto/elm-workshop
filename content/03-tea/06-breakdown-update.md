+++
title       = "Update"
weight      = 6
+++

The next part is the **udpate** function:

```
update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    ( model, Cmd.none )
```

This function is called when a message is triggered. This function takes a **message** and the current **model** and should return an **updated model** and a **command to run**.

In this case it just return the previous model as is and no commands.

This function is the equivalent to a **reducer** in Redux.