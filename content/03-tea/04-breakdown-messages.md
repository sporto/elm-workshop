+++
title       = "Messages"
weight      = 4
+++

The next part are the messages in our application:

```elm
type Msg
    = NoOp
```

We have only listed one message that our program can receive, which we’ve named `NoOp` (meaning “no operation”). Our program doesn’t yet have any features that would require responding to a message, so we’re just providing a dummy message here as a placeholder.

A `type` declaration defines a **union type** in Elm (also known as an algebraic data type , or ADT). Note that this is different from `type alias`, which simply gives a new, more convenient name to some existing type (as we did with our `Model` above).

Our message type above defines only a single message (`NoOp`), but in general a union type defines a list of possible values. Here’s a quick example:

```elm
type Answer = Yes | No
```

Here we’re adding a whole new type of value to Elm, called an `Answer`. In our program, any value with a type of `Answer` is guaranteed to have one of two values: `Yes` or `No`.

To learn more about union types, check out [the relevant section of the official Elm language tutorial](https://guide.elm-lang.org/types/union_types.html).
