# Langflow Documentation Images

This directory contains rendered images of diagrams and other visual assets used in the Langflow documentation. The images are organized to mirror the structure of the source diagram files.

## Directory Structure

```
images/
├── README.md                     # This file
│
├── diagrams/                     # Rendered diagram images
│   ├── c4/                       # C4 model diagram images
│   │   ├── c4_model/             # Core C4 diagrams
│   │   │   ├── context/          # Context diagrams (Level 1)
│   │   │   ├── container/        # Container diagrams (Level 2)
│   │   │   ├── component/        # Component diagrams (Level 3)
│   │   │   └── code/             # Code diagrams (Level 4)
│   │   │
│   │   ├── backend/              # Backend-specific diagrams
│   │   │   ├── component_system/ # Component system diagrams
│   │   │   ├── flows/            # Flow processing diagrams
│   │   │   ├── database/         # Database schema diagrams
│   │   │   └── sequences/        # Backend sequence diagrams
│   │   │
│   │   ├── frontend/             # Frontend-specific diagrams
│   │   │   ├── components/       # Frontend component diagrams
│   │   │   ├── state/            # State management diagrams
│   │   │   ├── flows/            # Flow editor diagrams
│   │   │   └── sequences/        # Frontend sequence diagrams
│   │   │
│   │   ├── deployment/           # Deployment diagrams
│   │   │   └── aws/              # AWS deployment diagrams
│   │   │
│   │   └── developer/            # Developer-focused diagrams
│   │       ├── workflows/        # Development workflow diagrams
│   │       └── guides/           # Developer guide diagrams
│   │
│   ├── banking_journeys/         # Banking-specific journey diagrams
│   │   ├── it_users/             # IT user journey diagrams
│   │   ├── digital_users/        # Digital user journey diagrams
│   │   ├── retail_users/         # Retail user journey diagrams
│   │   ├── customer_service/     # Customer service diagrams
│   │   └── compliance/           # Compliance diagrams
│   │
│   ├── sequence/                 # Standalone sequence diagrams
│   │   ├── frontend/             # Frontend sequences
│   │   ├── backend/              # Backend sequences
│   │   ├── user/                 # User perspective sequences
│   │   ├── developer/            # Developer perspective sequences
│   │   └── admin/                # Admin perspective sequences
│   │
│   └── integration/              # Integration diagrams
│
└── screenshots/                  # Application screenshots (if any)
    ├── ui/                       # UI screenshots
    ├── flows/                    # Flow examples
    └── components/               # Component examples
```

## Image Formats

This directory contains the following image formats:

- **SVG**: Vector format for diagrams, preferred for web display and scaling
- **PNG**: Raster format for screenshots and other photographic content

## Generated vs. Manual Images

- **Generated Images**: Most images in the `diagrams/` directory are automatically generated from PlantUML source files in the `diagrams/` directory, using the `render_plantuml.sh` script
- **Manual Images**: Screenshots and other manually created images are stored separately and managed directly

## Using the Images

The images in this directory are referenced from:

1. **Markdown Documentation**: Files in the `docs/` directory
2. **Interactive Viewer**: The `index.html` documentation portal
3. **README Files**: Various README.md files throughout the repository

## Image Naming Conventions

Images follow these naming conventions:

1. They match the name of their source diagram file (for generated diagrams)
2. They use lowercase letters, numbers, and underscores
3. They have descriptive names indicating their content
4. They include appropriate file extensions (.svg, .png)

## Rendering New Images

To render new diagram images:

1. Create or update a diagram in the `diagrams/` directory
2. Run the `render_plantuml.sh` script from the `reverse_docs` directory
3. The script will automatically create the appropriate output directories if they don't exist
4. The rendered images will be placed in this directory, mirroring the source file structure

```bash
cd reverse_docs
./render_plantuml.sh
```

## Image Quality Standards

- **SVG Diagrams**: Clean, readable text; consistent styling; appropriate size
- **Screenshots**: Clear, focused on relevant UI elements; appropriate resolution
- **All Images**: Descriptive filenames; proper directory organization

## Related Resources

- Source diagram files are in the `diagrams/` directory
- Documentation referring to these images is in the `docs/` directory
- The main documentation portal in `index.html` provides an interactive way to view these images