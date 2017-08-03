+++
title       = "Update"
weight      = 4
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

Here we have introduced a `case` condition. We pattern-match on the `msg` argument. Note how we extract the message payload into `howMuch` in the first pattern.

## Update syntax

In the first branch of our `case` expression, we want to produce an updated model, with the `count` increased by `howMuch`. In Elm, you update a record with the following syntax:

```elm
{ model | count = model.count + howMuch }
```

This returns a new version of `model` where `count` has been updated. Any other fields that might be present in `model` will remain unmodified in the new record.

---

Try this in your browser. Clicking the button should update the count now.
