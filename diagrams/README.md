# Langflow Diagrams

This directory contains various architectural and sequence diagrams that visually document the Langflow system. The diagrams are created using PlantUML and are organized by type and subsystem.

## Directory Structure

```
diagrams/
├── README.md                 # This file
│
├── c4/                       # C4 model diagrams
│   ├── README.md             # Overview of C4 model approach
│   ├── c4_model/             # Core C4 diagrams
│   │   ├── context/          # Context diagrams (Level 1)
│   │   ├── container/        # Container diagrams (Level 2)
│   │   ├── component/        # Component diagrams (Level 3)
│   │   └── code/             # Code diagrams (Level 4)
│   │
│   ├── backend/              # Backend-specific C4 diagrams
│   │   ├── component_system/ # Component system diagrams
│   │   ├── flows/            # Flow processing diagrams
│   │   ├── database/         # Database schema diagrams
│   │   └── sequences/        # Backend sequence diagrams
│   │
│   ├── frontend/             # Frontend-specific C4 diagrams
│   │   ├── components/       # Frontend component diagrams
│   │   ├── state/            # State management diagrams
│   │   ├── flows/            # Flow editor diagrams
│   │   └── sequences/        # Frontend sequence diagrams
│   │
│   ├── deployment/           # Deployment diagrams
│   │   └── aws/              # AWS deployment diagrams
│   │
│   └── developer/            # Developer-focused diagrams
│       ├── workflows/        # Development workflow diagrams
│       └── guides/           # Developer guide diagrams
│
├── banking_journeys/         # Banking-specific journey diagrams
│   ├── it_users/             # IT user journey diagrams
│   ├── digital_users/        # Digital user journey diagrams
│   ├── retail_users/         # Retail user journey diagrams
│   ├── customer_service/     # Customer service diagrams
│   └── compliance/           # Compliance diagrams
│
├── sequence/                 # Standalone sequence diagrams
│   ├── frontend/             # Frontend sequences
│   ├── backend/              # Backend sequences
│   ├── user/                 # User perspective sequences
│   ├── developer/            # Developer perspective sequences
│   └── admin/                # Admin perspective sequences
│
└── integration/              # Integration diagrams
    └── confluence_integration_flow.puml  # Confluence integration
```

## Diagram Types

### C4 Model Diagrams

The [C4 model](https://c4model.com/) provides a way to visualize software architecture at different levels of abstraction:

1. **Context (Level 1)**: System context - shows the system and its interactions with users and other systems
2. **Container (Level 2)**: Shows the high-level technology choices and how containers communicate
3. **Component (Level 3)**: Decomposes containers into components, showing the key logical components and their interactions
4. **Code (Level 4)**: Shows how components are implemented with code (classes, interfaces, etc.)

### Sequence Diagrams

Sequence diagrams show the time-ordered interactions between objects in a process. They document:

- The participants involved in a process
- The order of interactions
- Message exchanges between participants
- Decision points and alternative flows
- System boundaries and external interactions

### Banking Journey Diagrams

Domain-specific diagrams showing Langflow applications in banking contexts:

- Customer service workflows
- IT integration journeys
- Digital user experiences
- Compliance processes

## Working with the Diagrams

### Viewing Diagrams

1. **Pre-rendered SVG**: Generated SVG images are available in the `images/diagrams/` directory
2. **PlantUML Source**: Original `.puml` files can be viewed in any text editor
3. **Rendering**: To render the diagrams, use:
   - The included `render_plantuml.sh` script
   - Online PlantUML server (paste the content)
   - VS Code with the PlantUML extension
   - IntelliJ IDEA with the PlantUML plugin

### Creating New Diagrams

1. Create a new `.puml` file in the appropriate subdirectory
2. Use the existing diagrams as templates for consistent styling
3. Include the appropriate PlantUML includes for the diagram type
4. Run the rendering script to generate the SVG output
5. Add documentation for your diagram in the `docs/diagrams/` directory

### Rendering Diagrams

To render all diagrams, use the included script:

```bash
./render_plantuml.sh
```

This will generate SVG files in the `images/diagrams/` directory matching the source file structure.

## Diagram Conventions

- **Consistent Styling**: Each diagram type follows consistent color schemes and notations
- **Meaningful Names**: File names clearly indicate the diagram's purpose
- **Documentation**: Each diagram has corresponding documentation in the `docs/diagrams/` folder
- **Hierarchy**: Diagrams follow the C4 model hierarchy from high-level context to detailed code
- **Focus**: Each diagram focuses on a specific aspect rather than trying to show everything

## Related Resources

- Documentation for each diagram can be found in `docs/diagrams/`
- Pre-rendered images are available in `images/diagrams/`
- The main documentation portal at `index.html` provides an interactive way to explore diagrams