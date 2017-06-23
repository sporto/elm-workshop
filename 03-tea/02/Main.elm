module Main exposing (..)

import Html exposing (Html, div, text)


-- Application Model


type alias Model =
    String


init : ( Model, Cmd msg )
init =
    ( "", Cmd.none )



-- Messages


type Msg
    = NoOp



-- VIEWS


view : Model -> Html Msg
view model =
    div [] [ text "Hello" ]



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
