+++
title       = "Subscriptions"
weight      = 6
+++

Rather than a static view of
the time at which we loaded the page,
we’d like our clock to update
as the seconds tick by.
We already know how to command Elm to fetch the current time,
but we can only issue commands
in our `init` function (when our program starts up),
and in our `update` function (in response to a message).

What we need is a way to command Elm to send you
not just a _single_ message with the current `Time`,
but to send you a new message once every second.
This is what **subscriptions** are for.

Every Elm program we’ve written so far has contained
a `subscriptions` function that returns `Sub.none`:

```elm
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
```

Just as `Cmd.none` means “I don’t have a command for Elm right now”,
`Sub.none` means “There’s nothing I want Elm to subscribe me to right now.”

Elm’s core modules offer several functions for creating subscriptions.
[`Time.every`][time.every], for example, lets us subscribe to
receive a message with the current `Time`
every second:

```elm
subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every Time.second NewTime
```

Run your program now, and our clock should be ticking!

`Time.every` uses JavaScript’s `setInterval` function.
As you may know, `setInterval` isn’t guaranteed to run exactly on time,
so to make sure our clock doesn’t skip any seconds,
we can subscribe to more frequent events,
say one every 100 milliseconds:

```elm
subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every (100 * Time.millisecond) NewTime
```

To confirm this change is working,
look at the message count on the Elm debugger
at the bottom of your browser window.
It should be counting up roughly ten times per second.

Notice that the `subscriptions` function
receives your program’s current model as an argument.
Elm calls `subscriptions`
whenever your program makes a change to its model.
This gives you the freedom to vary your subscriptions
in response to changes in the state of your program.

For example, we could wait until
our program had received the first `Time` value
(from the command issued by our `init` function)
before subscribing to further time updates:

```elm
subscriptions : Model -> Sub Msg
subscriptions model =
    case model.time of
        Nothing ->
            Sub.none

        Just _ ->
            Time.every (100 * Time.millisecond) NewTime
```

Now that we have a ticking clock, it’s time to turn it into a stopwatch!

[time.every]: http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Time#every
