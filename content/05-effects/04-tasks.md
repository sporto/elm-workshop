+++
title       = "Tasks"
weight      = 4
+++

Let’s return to our `init` function,
which so far just creates a `Model` with a `time` value of `Nothing`:

```elm
init : ( Model, Cmd Msg )
init =
    ( { time = Nothing }, Cmd.none )
```

`init` doesn’t just return that initial `Model` value, however.
It also returns `Cmd.none`,
just like every other `init` function we have written so far.
`Cmd.none` tells Elm
we don’t have a command for it to run right now.
But there _is_ something that we want Elm to do for us
when our program first starts:
we want it to fetch the current time for us!

As we learned in [an earlier section]({{< ref "02-start.md" >}}),
functions like `Time.now`
that fetch information from the outside world
return a task
that you can command Elm to perform.

To do this, we’ll use the `Task.perform` function.
First, let’s `import` the `Task` module
at the top of our program:

```elm
import Task
```

If we look at [the documentation for `Task.perform`][task.perform],
you’ll see that it conveniently shows how to use it
to fetch the current time from an `update` function.
Using this as a guide,
we can make our `init` function issue the same command.

```elm
init : ( Model, Cmd Msg )
init =
    ( { time = Nothing }, Task.perform NewTime Time.now )
```

We’re getting close, but
the compiler has a new ~~error message~~ piece of guidance for us.
It doesn’t recognise `NewTime`,
our first argument to `Task.perform`.
This argument is
the message we are asking Elm to send us
when it finishes the task we are commanding it to perform.
Elm doesn’t recognise it because
we haven’t included `NewTime` as one of the possible values
of our `Msg` type:

```elm
type Msg
   = Todo
```

All we have there now is a `Todo` value that we aren’t using.
Let’s replace it with `NewTime`,
a message that we will expect to contain a `Time` value:

```elm
type Msg
    = NewTime Time
```

Great, we’re giving Elm a command!
Once it has retrieved the current time,
Elm will call our `update` function with a `NewTime` message
containing the current `Time`.
Let’s make our `update` function handle this message
in the a `case` statement:

```elm
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NewTime time ->
            ( { model | time = Just time }, Cmd.none )
```

Using pattern matching,
we extract the `Time` value contained in the message and store it in a variable `time`.
We then return an updated `model`
with its time field set to `Just time`
(a `Maybe` containing an actual `Time` value),
replacing the `Nothing` value set by `init`.

Notice that we still return `Cmd.none` here, too.
Every time our `update` function is called,
we have the option to give Elm another command,
but for now we have nothing else that needs doing.

Run our program now,
and you’ll see it displays an interesting value:
the word ‘Just’ followed by a large number.
Before you proceed to the next section,
can you guess why it’s showing this?

[task.perform]: http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Task#perform
