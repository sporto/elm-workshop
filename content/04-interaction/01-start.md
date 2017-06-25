+++
title       = "Start"
weight      = 1
+++


For this chapter we will create a simple counter application. Copy this into `Counter.elm`:

```elm
module Counter exposing (..)

import Html exposing (Html, div, button, text)


-- Application Model


type alias Model =
    { count : Int
    }


initialModel : Model
initialModel =
    { count = 0
    }


init : ( Model, Cmd msg )
init =
    ( initialModel, Cmd.none )



-- Messages


type Msg
    = NoOp



-- VIEWS


view : Model -> Html Msg
view model =
    let
        count =
            toString model.count
    in
        div [] [ text count, btnIncrease ]


btnIncrease =
    button [] [ text "Increase" ]



-- Update


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    ( model, Cmd.none )


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

## Let .. in

Note the use of `let` and `in` in `view`:

```
view model =
    let
        count =
            toString model.count
    in
        div [] [ text count, btnIncrease ]
```

`let` allows you to break a function into smaller reusable parts. You can thing about this as declaring a local variable in a function in JavaScript e.g.

```
function view(model) {
	const count = ...
	... then use count...
}
```

---

Take some time to understand this app then open this in Elm Reactor, you will see 0 as the current count and a button that doesn't do anything yet.



