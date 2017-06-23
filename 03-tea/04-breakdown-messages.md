# Messages

The next part are the messages in our application:

```
type Msg
    = NoOp
```

We only have one message, which is `NoOp` for no operation.

`type` is defines a union type in Elm (also known as algebraic data types - ADTs). Note that this is different from `type alias`.

A union type is a type that could be one of several possibilities. e.g. 

```
type Answer = Yes | No
```

Here `Answer` can be either `Yes` or `No`.

To learn about Union type you can go here *TODO*.