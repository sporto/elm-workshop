+++
title       = "Start the Clock"
weight      = 2
+++

Create a new Elm program, `Stopwatch.elm`.

> **Note:** If you find typing all this out tedious,
> most Elm language support packages for popular editors include
> a snippet for a new program.
> In Visual Studio Code, for example,
> with the Elm extension installed,
> you can type `Html.program` in an empty file,
> hit Tab,
> and have all of this code generated for you automatically.

```elm
module Stopwatch exposing (..)

import Html exposing (Html, div, button, text)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


type Msg
    = Todo


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
```

All that’s missing from this program
is a `view` function
(the Elm compiler will point this out helpfully
if you try to run it).

Although our ultimate aim is to
create a fully-functional stopwatch,
we’ll start simple.
Let’s make this program
display the current time
when it starts.
Since Elm requires the `view` function to render our program
using nothing but the current model,
let’s assume our model will contain the current time,
which we’ll convert to a string
with `toString`:

```elm
view : Model -> Html Msg
view model =
    text (toString model.time)
```

Compile the program now
(if you're using elm-reactor, just refresh your browser).
The compiler will complain
that our model doesn’t have a field named `time`.
So, it’s clear what we need to do next:
add that field to our `Model` type.

```elm
type alias Model =
    { time : Time }
```

In order to use the `Time` type,
we’ll need to add an `import` for it
to the top of this module:

```elm
import Time exposing (Time)
```

This process of pretending that something exists
(in this example, `model.time` in our `view`)
and then following the compiler’s directions to add it
is a really nice way to add features to an Elm program.
Try to think of every compiler error as
helpful guidance about what to do next,
not a complaint that you’re doing something wrong.

With these changes in place,
the compiler will have a new direction for us:
the model returned by our `init` function
is missing the `time` field.
Let’s fix it!

```elm
init : ( Model, Cmd Msg )
init =
    ( { time = Time.now }, Cmd.none )
```

When our program starts up,
we want the `init` function to
set the `time` in our model to the current time.
Looking at the [Elm Core API reference][core],
we can see that [the `Time` module has a `now` function][time.now],
so it seems natural to use that here.
But the Elm compiler points out
that `Time.now` doesn’t return a `Time`;
it returns a `Task.Task x Time`.
What is a `Task.Task x Time`?

Remember that as a pure functional language,
Elm doesn’t have functions that
return different values at different times
as we might expect `Time.now` to do.
Instead, `Time.now` returns a _task_ that
we can _command_ the Elm runtime to perform.
When it completes this task,
the Elm runtime will send our `update` function a _message_
with the current time.

We’ll see how to perform tasks like this shortly,
but right now
we need to get our `init` function to compile.
If we’re going to command Elm to obtain the current time,
that means our program’s initial model
must represent the state where
we are still waiting to receive that time.

[core]: http://package.elm-lang.org/packages/elm-lang/core/latest/
[time.now]: http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Time#now
