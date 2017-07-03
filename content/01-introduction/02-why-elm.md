+++
title       = "Why Elm"
weight      = 2
+++

## Safe and Robust

It is very hard to get runtime errors in Elm. This is because of the great type system and the abscence of null. So programs in Elm are more robust.

## Better errors handling

In JavaScript it is easy to ignore possible errors. You can't do this in Elm. The compiler pushes us to explicitly think about and deal with all possible values of any expression.

## A great type system

All core and third party packages in Elm conform to the Elm type system. This means that the compiler can catch all type issues (unlike TypeScript or Flow).

## Confident refactoring experience

Because of the robust type system, refactoring a program in Elm is much easier. When you make a change, the compiler will let you know about every place in your code that is affected.

## Less setup

There is not a lot to set up and decide when starting an Elm project. A single installer provides everything you need, and there are no tools that need to be configured to work together.

## Easier to test

Because all Elm functions are pure, they are easier to test as they don't rely on side effects. Building a whole program from pure functions makes it much easier to test, and Elm guarantees this for every program you write.

## Guaranteed immutable data

Elm has only one way to update data. It doesn't let us modify data values that other parts of our code assume will remain unchanged, which is an easy mistake to make in Javascript.

## Terse functional programming

If you like **lodash**, **ramda** or **sanctuary**, Elm offers an even simpler syntax for functional programming, which includes partial application and the pipeline operator.
