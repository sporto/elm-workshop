+++
title       = "Structure"
weight      = 2
+++

Here is a basic application using the Elm architecture. 

```elm
module Main exposing (..)

import Html exposing (Html, div, text)


-- MODEL


type alias Model =
    String


init : ( Model, Cmd Msg )
init =
    ( "Hello", Cmd.none )


-- MESSAGES


type Msg
    = NoOp


-- VIEW


view : Model -> Html Msg
view model =
    div [] [ text model ]


-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
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

Copy this into a `Main.elm` file (you can either overwrite the file from the previous chapter, or start a new project folder with `elm-package install -y`), and open it using elm-reactor. You should see "Hello". Admittedly, this is a lot of code to do very little, but it's a really solid foundation to build real-world applications upon. Let's break this down in the next section.
