+++
title       = "Program"
weight      = 7
+++

Lastly we have:

```elm
subscriptions model =
    Sub.none



-- Main


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
```

## Subscriptions

Subscriptions is how Elm programs listen for external events, for example:

- Mouse move
- Window resize
- Time change
- A message from JavaScript

In this case we declare that we have no subscriptions by using `Sub.none`.

## Html.program

Finally, `Html.program` connects everything together. This function takes a record with our `init`, `view`, `update` and `subscriptions` and takes cares of wiring up all the parts. Refer to the previous diagram to understand how this work.

<img src="/images/diagram-tea.png" width="480px" />