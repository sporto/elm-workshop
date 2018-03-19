+++
title       = "Maybes"
weight      = 3
+++

If this were JavaScript,
and we wanted to represent the state
where we are waiting to get the current time,
we might write this `init` function:

```elm
init : ( Model, Cmd Msg )
init =
    ( { time = null }, Cmd.none )
```

But Elm doesn’t let you
set any old variable to a “nothing” value like this.
The ability to do this in JavaScript
is by far the greatest source of bugs
in JavaScript programs.
When a variable that you expect to hold a value
actually contains a “nothing” value like `null` or `undefined`,
your program crashes
with an “undefined is not a function” error.

By preventing you from setting any variable to `null`,
Elm can guarantee that this kind of error will never happen
in your Elm programs.

But of course, sometimes you really do have “nothing”!
Until we are able to get the current time,
our program simply can’t tell what time it is.
To represent this, Elm has the `Maybe` type:

```elm
type Maybe something
    = Nothing
    | Just something
```

(Don’t add this type to your program!
It’s already built into Elm.)

A `Maybe` type represents
a value that is either not present (`Nothing`)
or present (`Just something`).
Whenever you use a `Maybe`,
you get to choose what the `something` type is.
In our program,
we have need of a value that is either “nothing” or
“just” a `Time` value.
So what we want is a `Maybe Time`.

Let’s update our `Model` type
to contain a `Maybe Time` instead of a `Time`:

```elm
type alias Model =
    { time : Maybe Time }
```

Now we can get our `init` function to compile
by setting the initial value of the `time` field
to `Nothing`:

```elm
init : ( Model, Cmd Msg )
init =
    ( { time = Nothing }, Cmd.none )
```

Compile and run the program
to make sure everything is working.
Our `view` function will display this initial value (`Nothing`).

Since this doesn’t look great,
let’s improve our `view` function a little
to better handle this “nothing” case.

We can use a `case` statement
in our `view` function
to handle separately the different possible values
of our `Model`.
Since our program only contains a `Nothing` value so far,
let’s start by handling that:

```elm
view : Model -> Html Msg
view model =
    case model.time of
        Nothing ->
            text "Loading…"
```

Save and run this,
and the compiler will tell you
that you haven’t accounted for all possible values of `model.time`.
We have told Elm that `model.time` is a `Maybe Time`,
so it requires us to handle every possible value of that type.
Again, Elm is making sure that
our programs will never crash as a result of a value
being something other than we expect it to be.

The error message says that
the value we have failed to handle is `Maybe.Just _`.
So we could add this branch to our `case` statement,
using the previous code we had written to output the time:

```elm
        Maybe.Just _ ->
            text (toString model.time)
```

This is a little more verbose than necessary, though.
Elm automatically makes all values in the `Maybe` module
available to us in every module that we write.
So instead of `Maybe.Just`, we can just say `Just`:

```elm
        Just _ ->
            text (toString model.time)
```

That underscore (`_`) represents the `Time` value
that is wrapped in this `Maybe` type.
The underscore tells Elm that
we aren’t interested in this value.
We’ll come back and tweak this
once we have an actual `Time` value
for our program to display.

For now, our `view` function should look like this:

```elm
view : Model -> Html Msg
view model =
    case model.time of
        Nothing ->
            text "Loading…"

        Just _ ->
            text (toString model.time)
```

Run the program and confirm that it shows “Loading…”.

Now we’re ready to get back to the task of
fetching the current time.
