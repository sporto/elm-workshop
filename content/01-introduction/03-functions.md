+++
title       = "Functions"
weight      = 3
+++

In Elm functions are a bit different than in languages like JavaScript, so it is worth familiarising yourself with how they are written and called in Elm.

Let's create a function in the Elm repl (read-evaluate-print loop). In your terminal, start a repl session:

```
elm-repl
```

The first time you use the repl Elm needs to download the core modules, so it can take a little while. Try:

```elm
1 + 1
```

It should print `2 : number` after a few seconds. From that point on, responses should be immediate.

Create a function `add`:

```elm
add a b = a + b
```

This is a function called `add` that takes two arguments `a` and `b`. In Elm you use spaces to separate the arguments, not parentheses or commas. In JavaScript this is equivalent to:

```js
// ES5
function add(a, b) {
  return a + b
}

// ES6 arrow function
const add = (a, b) => a + b
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
increment = add 2
```

Then you can pass the missing argument to get the final result:

```elm
add2 3  -- 5 : number
```

## Exercise

1. Write a function that takes two words and concatenates them with a space in the middle. e.g.

```
join "Hello" "World"
```

Should return `Hello World`. The string concatenation operator in Elm is `++`.

2. Using this function, create a partially applied function where the first word is always "Hello". e.g.

```elm
sayHello "Sam"
```

Should return `Hello Sam`.

{{% panel %}}Type `:exit` to exit the repl.{{% /panel %}}
