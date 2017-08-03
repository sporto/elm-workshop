+++
title       = "The Elm Architecture"
weight      = 1
+++

Most Elm applications are built using a pattern called **The Elm Architecture** (TEA). If you have used Redux, this architecture will be very familiar. This is not a coincidence -- Redux was heavily inspired by Elm!

<img src="/images/diagram-tea.png" width="480px" />

This is the Elm architecture:

- ➊ When our application first starts, we have an initial model that is passed to our program’s `view` function.
- ➋ The `view` function renders the current model to produce our program’s user interface (typically as HTML).
- ➌ When the user interacts with the rendered view, a message is sent to the Elm Runtime (➍) e.g. `ExpandDetails`.
- ➎ The Elm Runtime calls our program’s `update` function, passing in the message and the current model.
- ➏ The `update` function returns an updated model, and optionally a list of side effects to run (➐).
- ➑ The Elm Runtime calls our `view` function again to render our interface with the updated model. It also performs any side effects requested by our program.

## Terminology in Elm vs Redux

| Concept                            | Elm      | Redux   |
| ---                                | ---      | ---     |
| Application state                  | Model    | State   |
| Application events                 | Message  | Action  |
| Function that transforms the state | Update   | Reducer |
