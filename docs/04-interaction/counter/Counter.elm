module Counter exposing (..)

import Html exposing (Html, div, button, text)
import Html.Events exposing (onClick)


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
    | ChangeCount Int



-- VIEW


view : Model -> Html Msg
view model =
    let
        count =
            toString model.count
    in
        div [] [ text count, btnIncrease ]


btnIncrease =
    button [ onClick (ChangeCount 1) ] [ text "Increase" ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeCount howMuch ->
            ( { model | count = model.count + howMuch }, Cmd.none )

        NoOp ->
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
