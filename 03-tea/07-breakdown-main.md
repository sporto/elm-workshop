# Program

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

## Html.program