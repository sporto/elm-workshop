+++
title       = "Functions"
weight      = 3
+++

In Elm functions are a bit different that languages like JavaScript, so is worth familisaring yourself with how they are written and called in Elm.

Let's create some function in the Elm Repl. In your terminal start a repl session:

```
elm-repl
```

The first time you use the repl Elm needs to download the core modules, so it can take a while. Try:

```
1 + 1
```

It should print `2 : number` after a few seconds. After that it should be immediate.

Create a function `add`:

```elm
add a b = a + b
```

This is a function called `add` that takes two arguments `a` and `b`. In Elm you use spaces to separate the arguments, not parenthesis or commas. In JS this is equivalent to:

```js
// ES5
function add(a, b) {
  return a + b
}

// ES6
const add = (a, b) => { a + b }
``` 

You can call this function like so:

```elm
add 1 2
```

Note how we use spaces to pass arguments to the function.

## Partial application

Partial application is very common in Elm so is important to explain early.

If you pass only one argument to this function you will get back a partially applied function:

```elm
add2 = add 2
```

Then you can pass the missing argument to get the final result:

```elm
add2 3
```

## Exercise

1. Write a function that take two words and concatenates them with a space in the middle. e.g.

```
join "Hello" "World"
```

Should print `Hello World`. The string concatenation operator in Elm is `++`.

2. Using this function, create a partially applied function where the first word is always "Hello". e.g.

```elm
sayHello "Sam"
```

Should print `Hello Sam`.

{{% panel %}}Type `:exit` to exit the repl.{{% /panel %}}

