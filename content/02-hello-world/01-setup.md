+++
title       = "Setup"
weight      = 1
+++

In an empty directory run:

```bash
elm-package install -y
```

This will:

- Install core Elm modules for building applications: `html`, `core` and `virtual-dom`
- Create a file called `elm-package.json`. This file contains a list of dependecies for your project. Take a minute to look at it.
- Add a folder `elm-stuff`. This folder contains the downloaded packages and compilation artifacts.

When checking an Elm project in source control the `elm-stuff` folder should be ignored.