# TEA Breakdown

## Application Model

```elm
type alias Model =
    String
```

Here we define how our application model will look like. In this case we are aliasing the build-in `String` type. So our whole application model is a string.

Our application model could be anything:

- A record
- A list
- A number
- A tuple
- A union type (more on this later)


## Initial model

```
init : ( Model, Cmd msg )
init =
    ( "Hello", Cmd.none )
```

`init` is a function that returns the initial state of the application. The first line `init : ( Model, Cmd msg )` is the function signature. This is saying that `init` return a tuple of `Model` and `Cmd`.

### Commands (Cmd)

Commands is how we tell the Elm runtime to perform side effects. Side effects may include:

- An http request
- Get the current time
- Generate a random number
- Access local storage

In this case we tell Elm that we don't need any side effect initially i.e. `Cmd.none`.
