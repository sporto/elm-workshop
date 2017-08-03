+++
title       = "Messages"
weight      = 3
+++

To get this button to do something we need our view to trigger a message when the button is clicked.

First thing we need is to add a message to our application. Add a new **constructor** to `Msg`:

```elm
type Msg
    = NoOp
    | ChangeCount Int
```

Note how this **constructor** `ChangeCount Int` takes a payload, in this case an integer.

**Note:** Since we aren’t actually using our `NoOp` message constructor anywhere, you could actually remove it, but I’ve left it in here to make it clear how to support more than one kind of message in your program.

## View

Let's trigger this new message from the view. Add a second import next to the existing one near the top of the file:

```elm
import Html.Events exposing (onClick)
```

Now update the `btnIncrease` function with an `onClick` attribute:

```elm
btnIncrease =
    button [ onClick (ChangeCount 1) ] [ text "Increase" ]
```

Now this view when clicked will produce the message `ChangeCount 1`.

