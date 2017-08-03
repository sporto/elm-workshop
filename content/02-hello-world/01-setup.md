+++
title       = "Setup"
weight      = 1
+++

In an empty directory run:

```bash
elm-package install -y
```

This does a few things:

- Installs core Elm modules for building  applications: `html`, `core` and `virtual-dom`
- Creates a file called `elm-package.json`. This file contains a list of dependecies for your project. Take a minute to look at it.
- Adds a subfolder named `elm-stuff`. This folder contains the downloaded packages and compilation artifacts.

When tracking an Elm project in source control, you should ignore the `elm-stuff` folder (e.g. by adding it to your project’s `.gitignore` file).
