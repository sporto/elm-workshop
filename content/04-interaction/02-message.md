## Messages

To get this button to do something we need our view to trigger a message when the button is clicked.

First thing we need is to add a message to our application. Add a new **constructor** to `Msg`. 

```
type Msg
    = NoOp
    | ChangeCount Int
```

Note how this **constructor** `ChangeCount Int` can take a payload, in this case an integer.

## View

Let's trigger this new message from the view. Add a new import to the application:

```elm
import Html.Events exposing (onClick)
```

Change `btnIncrease` to:

```elm
btnIncrease =
    button [ onClick (ChangeCount 1) ] [ text "Increase" ]
```

Now this view when clicked will trigger `ChangeCount 1`.