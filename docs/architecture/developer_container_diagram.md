# Developer Container Diagram for Langflow

## Overview

The Developer Container Diagram illustrates the containerized development environment for Langflow. This diagram shows how the development environment is structured using containers, allowing for a consistent and isolated development experience across different developer machines.

## Diagram Elements

### Development Containers

- **Dev Container**: The main development container with all required dependencies.
  - **Backend Environment**: Python environment with all backend dependencies.
  - **Frontend Environment**: Node.js environment with all frontend dependencies.
  - **Development Tools**: Code linters, formatters, and testing tools.

- **Database Container**: PostgreSQL database for development.
  - **Database Data Volume**: Persists database data between container restarts.

- **Redis Container**: Redis instance for caching and session management.

- **Vector Database Container**: Optional container for vector database development (e.g., Chroma).

### Local Machine Integration

- **Source Code Mount**: Mounts local source code into the container.
- **IDE Integration**: VS Code or other IDE integration with the container.
- **Port Forwarding**: Maps container ports to local ports.

### Development Network

- **Container Network**: Connects all development containers.
- **External Service Access**: Allows containers to access external services.

## Container Configuration

- **Dockerfile.dev**: Development Dockerfile for the main container.
- **docker-compose.dev.yml**: Orchestrates the development containers.
- **.devcontainer/**: VS Code devcontainer configuration.
- **Environment Files**: Development environment variables.

## Development Workflows

- **Starting the Environment**: Command to start the development environment.
- **Running Tests**: Commands to run tests within the container.
- **Database Migrations**: Process for running database migrations.
- **Debugging**: Setup for debugging the application.

## Component System Development Environment

The diagram emphasizes the development environment for the Component System:

- **Component Development Tools**: Special tools for component development.
- **LangChain Integration**: Development setup for LangChain component integration.
- **Custom Component Testing**: Environment for testing custom components.
- **Hot Reloading**: Allows for immediate testing of component changes.

## Purpose

This diagram helps developers understand:

- How to set up the development environment
- The containerized structure of the development environment
- How the different services interact within the environment
- How to work with the Component System in the development environment
- How local code is integrated with the containers

## Related Diagrams

For more information, please refer to:

- [Developer Component Diagram](developer_component_diagram.md): Shows the components developers work with.
- [Developer Workflow Diagram](developer_workflow_diagram.md): Shows the development workflows.
- [AWS Deployment Diagram](aws_deployment_diagram.md): Shows how the containerized application is deployed in production. 