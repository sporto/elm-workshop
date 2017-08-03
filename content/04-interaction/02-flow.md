+++
title       = "Flow"
weight      = 2
+++

Here’s what we want to happen when a user clicks that ‘Increase’ button:

{{<mermaid>}}
sequenceDiagram
    participant View
    participant Runtime
    participant Update
    View->>Runtime: ChangeCount
    Runtime->>Update: ChangeCount and Current Model
    Update-->>Runtime: (Updated model, Commands)
    Runtime->>View: Updated model
{{< /mermaid >}}

1. The **View** generates a message, **ChangeCount**
2. The Elm runtime calls our **Update** function with the message and the current model
3. **Update** returns an updated model and commands to run
4. The Elm runtime renders the **View** again with the updated model
