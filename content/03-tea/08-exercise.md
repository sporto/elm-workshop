+++
title       = "Exercise"
weight      = 8
+++

Using the TEA program we just made:

- Change the `Model` to a record. e.g.

```
type alias Model = {
    message: String
}
```

- Create a function `initialModel` that return an initial record like the above. Add a function signature to `initialModel`.

- Use `initialModel` in `init`.

- Change the view so it uses `model.message`.