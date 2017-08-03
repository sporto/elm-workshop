+++
title       = "Start"
weight      = 1
+++


For this chapter we will create a simple counter application. Copy this into `Counter.elm`:

```elm
module Counter exposing (..)

import Html exposing (Html, div, button, text)


-- MODEL


type alias Model =
    { count : Int
    }


initialModel : Model
initialModel =
    { count = 0
    }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


-- MESSAGES


type Msg
    = NoOp


-- VIEW


view : Model -> Html Msg
view model =
    let
        count =
            toString model.count
    in
        div [] [ text count, btnIncrease ]


btnIncrease =
    button [] [ text "Increase" ]


-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


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

## `let` expressions

Note the use of `let … in` in `view`:

```
view model =
    let
        count =
            toString model.count
    in
        div [] [ text count, btnIncrease ]
```

`let` allows you to break a function into smaller, reusable parts. You can think of this as declaring a local variable in a function in JavaScript e.g.

```
function view(model) {
	const count = ...

	... use count ...
}
```

---

Take some time to understand this app then open this in Elm Reactor, you will see ‘0’ as the current count and an ‘Increase’ button that doesn't do anything yet.
