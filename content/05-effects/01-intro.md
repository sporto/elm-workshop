+++
title       = "The Outside World"
weight      = 1
+++

So far, the Elm programs we have written
have all been self-contained.
They started with a static model
(like the number zero)
and updated it in response to user interaction with your view
(like a button click).
In real-world projects,
you will usually want
to fetch data from or send data to an outside source
(like a server API),
or respond to other events
(like the passage of time).

Elm is very simple partly because it’s a pure functional language,
where every function always returns the same value given the same arguments.
This makes Elm functions very easy to reason about,
to compose into complex programs,
and to write automated tests for.
But a function like JavaScript’s `Date.now`,
which returns the current date and time (always a different value),
can’t exist in Elm.
If you’re used to JavaScript,
you might find Elm’s approach to
accessing the outside world
unfamiliar, even convoluted at first.

Let’s write a program that deals with the current time
to see how Elm does it.
