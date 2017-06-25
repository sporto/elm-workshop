+++
title       = "The Elm Architecture"
weight      = 1
+++

In Elm most applications are build using a pattern called **The Elm Architecture**. If you have used Redux this architecture will be very familiar.

<img src="/images/diagram-tea.png" width="480px" />

This is the Elm architecture:

- ➊ When our application first starts we have a model that is passed to a view function.
- ➋ The view renders the current model.
- ➌ When the user interacts with the application, we trigger a message that is send to the Elm Runtime (➍) e.g. `ExpandDetails`.
- ➎ The Elm runtime calls an `update` function passing the triggered message and the current model.
- ➏ The `update` function takes this message and model and return an updated model and side effects to run (➐).
- ➑ The Elm runtime calls the view again with the updated model and runs the side effects.

## Terminology in Elm vs Redux

| Concept                            | Elm      | Redux   |
| ---                                | ---      | ---     |
| Application state                  | Model    | State   |
| Application events                 | Message  | Action  |
| Function that transforms the state | Update   | Reducer |
