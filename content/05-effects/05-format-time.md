+++
title       = "Format Time"
weight      = 5
+++

We can understand why our program is currently displaying
‘Just’ followed by a large number
by looking again at our `view` function:

```elm
view : Model -> Html Msg
view model =
    case model.time of
        Nothing ->
            text "Loading…"

        Just _ ->
            text (toString model.time)
```

Since `model.time` no longer contains `Nothing`,
the second branch of the `case` is now generating our view.
That branch says
to convert the value of `model.time` to a `String`
and display it as HTML text.

Remember, `model.time` isn’t just a `Time` value; it’s a `Maybe Time`,
which means that its value is either `Nothing`
or it’s `Just Time`
(a `Time` value tagged with the `Just` constructor).
So the word ‘Just’ in the output is just that tag,
and the large number must be the `Time`.
Indeed, if you refresh the page repeatedly,
you’ll see the large number gets larger each time!

We can use pattern matching
in our `case` statement again
to extract just the `Time` from `model.time`’s `Just Time` value.
Replace the underscore
(which tells Elm we aren’t interested in the value)
in `Just _` with a variable name:

```elm
        Just time ->
            text (toString model.time)
```

With the unadorned `Time` value in `time`,
we can now display _that_ instead of `model.time`:

```elm
        Just time ->
            text (toString time)
```

Now our program displays just the large number
that represents the current time.
The [documentation for the `Time` type][time.time] reveals that
`Time` is just an alias for `Float` – a floating point number.
In fact, a `Time` is just
a number of milliseconds since midnight on 1 January, 1970.

We can use some of the other functions in [the `Time` module][time]
to convert such a value in to the hours, minutes and seconds
we need for our clock.
Let’s write a function to do this.
If you’re feeling confident,
go ahead and try writing it yourself before you read on.

Here’s what a reasonable first attempt might look like:

```elm
toClock : Time -> String
toClock time =
    let
        hours =
            Time.inHours time

        minutes =
            Time.inMinutes time

        seconds =
            Time.inSeconds time
    in
        hours ++ ":" ++ minutes ++ ":" ++ seconds
```

Here we’ve used a `let` block
to calculate the `hours`, `minutes` and `seconds` separately,
then we’ve tried to return these
in a single `String`.

If we try to run this,
the compiler reminds us that `++`
only works with `String`s
and we’ve given it a `Float`.
We can use `toString` to
perform the necessary conversions:

```elm
toClock : Time -> String
toClock time =
    let
        hours =
            toString (Time.inHours time)

        minutes =
            toString (Time.inMinutes time)

        seconds =
            toString (Time.inSeconds time)
    in
        hours ++ ":" ++ minutes ++ ":" ++ seconds
```

This will run,
but the numbers aren’t quite what we’re after.
First of all,
because the `Time` functions return
floating point numbers (`Float`) and not integers (`Int`),
our values are fractional hours, minutes and seconds
(with digits after the decimal point).
We can round these down with `floor`:

```elm
toClock : Time -> String
toClock time =
    let
        hours =
            toString (floor (Time.inHours time))

        minutes =
            toString (floor (Time.inMinutes time))

        seconds =
            toString (floor (Time.inSeconds time))
    in
        hours ++ ":" ++ minutes ++ ":" ++ seconds
```

> **Note:** Documentation for built-in functions
> like `floor` and `toString`
> may be found in [the `Basics` module][basics].

And then to get just
the number of hours in the current day,
the number of minutes in the current hour,
and the number of seconds in the current minute,
we can use the `%` operator:

```elm
toClock : Time -> String
toClock time =
    let
        hours =
            toString (floor (Time.inHours time) % 24)

        minutes =
            toString (floor (Time.inMinutes time) % 60)

        seconds =
            toString (floor (Time.inSeconds time) % 60)
    in
        hours ++ ":" ++ minutes ++ ":" ++ seconds
```

If you run the program now,
you’ll probably notice that our `Time` value
actually represents the current UTC time,
not the time in your local time zone.
If we were actually trying to build a boring, old clock
(and not a totally awesome stopwatch)
we could use Elm’s [`Date` module][date]
to perform a `Date.now` task to fetch a current `Date`
(which like JavaScript’s `Date.now` returns a local date and time).
The current UTC time is all we need for our stopwatch, though.

Finally, we want to format each of the three numbers
with a leading zero if it happens to be a single digit.
We can use [`String.padLeft`][string.padleft] for this:

```elm
toClock : Time -> String
toClock time =
    let
        hours =
            String.padLeft 2 '0' (toString (floor (Time.inHours time) % 24))

        minutes =
            String.padLeft 2 '0' (toString (floor (Time.inMinutes time) % 60))

        seconds =
            String.padLeft 2 '0' (toString (floor (Time.inSeconds time) % 60))
    in
        hours ++ ":" ++ minutes ++ ":" ++ seconds
```

If you’re starting to find those three expressions
difficult to read with all those parentheses,
congratulations – you’re a human being (not a compiler)!
We can use Elm’s **pipeline operator** (`|>`) to
make these expressions much more readable.

```elm
        hours =
            Time.inHours time
                |> floor
                |> (\hours -> hours % 24)
                |> toString
                |> String.padLeft 2 '0'
```

`|>` passes the value on its left into the function on its right.
This lets us build a complex expression as
a series of transformations.
We start with `Time.inHours time`
(the number of hours in `time`, as a `Float`)
then we pass that value as an argument to `floor`
to round it down to the nearest integer.

We now have a whole number of hours, as an `Int`.
To get the number of hours in the current day,
we want the value of the expression `hours % 24`.
To use this expression as a function in our pipeline,
we write an **anonymous function**
(just like a JavaScript arrow function)
that takes an `hours` argument and returns `hours % 24`.
In Elm, we write this as `\hours -> hours % 24`.

Next, we convert our `Int` to a `String` with `toString`,
and finally we pad it with a leading zero if necessary
with `String.padLeft 2 '0'`.
Note that `String.padLeft` takes three arguments,
so the expression `String.padLeft 2 '0'` (with just two arguments)
acts as a function that takes a single argument
(the value provided by the pipeline operator).
This technique of giving a function only some of its arguments
is called **partial application**,
and it’s especially handy when used within a pipeline like this.

Go ahead and repeat the same pattern for minutes and seconds.
There should be no surprises here,
so see if you can do it on your own before you
refer to the finished function:

```elm
toClock : Time -> String
toClock time =
    let
        hours =
            Time.inHours time
                |> floor
                |> (\hours -> hours % 24)
                |> toString
                |> String.padLeft 2 '0'

        minutes =
            Time.inMinutes time
                |> floor
                |> (\minutes -> minutes % 60)
                |> toString
                |> String.padLeft 2 '0'

        seconds =
            Time.inSeconds time
                |> floor
                |> (\seconds -> seconds % 60)
                |> toString
                |> String.padLeft 2 '0'
    in
        hours ++ ":" ++ minutes ++ ":" ++ seconds
```

> **Note:** These three pipelines are very similar.
> You might like to try to find a way to eliminate the repitition,
> say by writing a `toClockComponent` function.
> You might decide that
> you prefer the clarity of this version, though,
> and that’s fine too.

Our clock’s looking pretty good now,
but if we’re going to turn it into a stopwatch,
we’ll need to learn to make it count up!

[time.time]: http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Time
[time.time]: http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Time#Time
[basics]: http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Basics
[string.padleft]: http://package.elm-lang.org/packages/elm-lang/core/5.1.1/String#padLeft
[date]: http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Date
