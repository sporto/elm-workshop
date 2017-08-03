+++
title       = "TEA Breakdown"
weight      = 3
+++

## Application Model

```elm
type alias Model =
    String
```

Here we define what our application’s model will look like. In this case, we are aliasing the built-in `String` type. So our whole application’s model is simply a string.

Our application’s model can be any type of value supported by Elm, including:

- a record (effectively a JSON object with a fixed set of fields)
- a list (what we call an array in JavaScript)
- a number
- a boolean (true or false)
- a tuple (a fixed-length list of values of specific types)
- a union type (more on this later)


## Initial model

```elm
init : ( Model, Cmd Msg )
init =
    ( "Hello", Cmd.none )
```

`init` is a function that returns the initial state of the application. The first line `init : ( Model, Cmd msg )` is the function’s type signature. This is saying that `init` returns a tuple, containing  a `Model` and  a  `Cmd Msg`.

### Commands (`Cmd`)

A command is how we tell the Elm runtime to perform a side effect. Here are some of the side effects supported by the Elm Runtime:

- Send an HTTP request (Ajax)
- Get the current time
- Generate a random number
- Access local storage
- A batch of commands to be performed in parallel

Each of these is represented by a value with a type of `Cmd`.

Our program's `init` function has an opportunity to return a command to be performed when our program first starts. In this example, we don't need Elm to do anything at start-up, so we return `Cmd.none`.
