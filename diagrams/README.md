# Diagrams

This directory contains various diagrams used to visualize the Langflow architecture and components.

## Rendering PlantUML Diagrams

There are two ways to render the PlantUML diagrams:

### 1. Using VSCode Extension (Recommended for C4 Diagrams)

The VSCode PlantUML extension can render the C4 diagrams correctly, as it has built-in support for the C4 PlantUML macros.

1. Install the "PlantUML" extension for VSCode
2. Open any .puml file
3. Use Alt+D (or Option+D on Mac) to preview the diagram

### 2. Using the Rendering Scripts

For standard UML diagrams (sequence, class, etc.), you can use the included rendering scripts:

```bash
# Render a specific diagram
./render_plantuml.sh diagrams/sequence/user_flow.puml

# Render all diagrams
./render_plantuml.sh
```

For C4 diagrams specifically, use the dedicated script:

```bash
# Render C4 diagrams
./render_c4_diagrams.sh
```

## Issues with C4 PlantUML

The C4 diagrams in this repository use C4 PlantUML macros. There are known issues with rendering these diagrams using the command-line PlantUML renderer:

1. The C4 PlantUML library needs to be imported, which can cause issues with GitHub access
2. The renderer may not find the required dependencies

The `render_c4_diagrams.sh` script provides a workaround by using standard UML notation instead of C4-specific macros.

## Viewing Diagrams

You can view the rendered diagrams:

1. Directly as PNG files in the filesystem
2. Using the documentation viewer (index.html)
3. In VSCode's preview (for .puml files)

## Troubleshooting

If you encounter issues rendering diagrams:

1. Make sure you have Java installed
2. For C4 diagrams, use the VSCode extension or the `render_c4_diagrams.sh` script
3. Check for network connectivity issues if imports are failing