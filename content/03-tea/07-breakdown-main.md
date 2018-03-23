+++
title       = "Program"
weight      = 7
+++

Lastly we have:

```elm
-- SUBSCRIPTIONS


subscriptions model =
    Sub.none


-- MAIN


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

- Mouse movement
- Window resizing
- Time increments
- Animation frames
- Messages from JavaScript code

The `subscriptions` function takes the program’s current model as an argument, and returns a list of the subscriptions we wish to receive messages from. The Elm Runtime calls this function automatically every time our program’s model changes, to give our program an opportunity to change its subscriptions in response.

In this simple example, we have no need to receive messages from the outside world, so we simply return `Sub.none` regardless of the value of our model.

## Html.program

Finally, our program’s `main` function calls `Html.program` to connect everything together. `Html.program` takes a single argument, a record specifying our `init`, `view`, `update` and `subscriptions` functions, and wires them all together to produce an application that is ready for the Elm Runtime to run.

Here again is the diagram that shows how these parts all work together:

<img src="/images/diagram-tea.png" width="480px" />
