+++
title       = "Exercise"
weight      = 8
+++

The program we just wrote is structured according to TEA (The Elm Architecture), which should make it easy to extend. To begin, we might alter the representation of our model so that it can store more than just a single string.

Instead, let's use a **record**. Much like a JSON object, Elm records store values for a number of keys. Let’s move our model’s string into a record key, so that we can later add more keys with other values as needed.

1. Change the `Model` to a record, like this:

    ```elm
    type alias Model = {
        message: String
    }
    ```

2. Create a function called `initialModel` that returns a record like the one above, to be used as the program’s initial state. Add a function signature to `initialModel`.

3. In `init`, call `initialModel` to obtain the initial model, rather than using a hard-coded value.

4. Change the view so it uses `model.message` to get the text to be displayed in the user interface.
