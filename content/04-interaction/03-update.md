+++
title       = "Update"
weight      = 3
+++

Our application is still not doing anything as we are ignoring the message we added. We need to do respond to it. Change `update` to:

```elm
update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        ChangeCount howMuch ->
            ( { model | count = model.count + howMuch }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )
```

Here we have introduced `case`. We pattern match on `msg`. Note how we extract `howMuch` in pattern.

## Update syntax

In Elm you update a record with the following syntax:

```elm
{ model | count = model.count + howMuch }
```

This returns a new version of `model` where `count` has been updated.

---

Try this in your browser. Clicking the button should update the count now.