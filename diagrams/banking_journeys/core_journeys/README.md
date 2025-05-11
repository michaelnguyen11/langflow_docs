# Core User Journeys

This directory contains sequence diagrams that illustrate the core user journeys for Langflow's two primary user types:

1. **Flow Designers** - Users who create and deploy AI agents
2. **API Integrators** - Developers who integrate with Langflow's APIs

## Flow Designer Journey

The [Flow Designer Journey](flow_designer_journey.puml) shows the complete lifecycle of creating an AI agent in Langflow:

- **Authentication and Setup** - Logging in and creating a new flow
- **Design** - Building flows using components from the catalog
- **Testing** - Validating component and flow functionality
- **Refinement** - Fine-tuning flow behavior and performance
- **Validation** - Comprehensive testing including edge cases
- **Documentation** - Adding documentation and usage examples
- **Deployment** - Deploying flows to production
- **Monitoring** - Tracking usage and performance
- **Iteration** - Improving flows based on real-world performance

This journey applies to any user who is building flows in the Langflow UI, regardless of their specific role within their organization.

## API Integration Journey

The [API Integration Journey](api_integration_journey.puml) shows the end-to-end process for developers integrating Langflow into their applications:

- **Setup and Authentication** - Setting up API access
- **API Exploration** - Learning the API capabilities
- **Implementation** - Building the core integration
- **Testing** - Validating the integration
- **Integration** - Connecting with client applications
- **Deployment** - Deploying to staging and production
- **Monitoring** - Tracking API usage and performance
- **Maintenance** - Ongoing optimization and updates

This journey applies to any developer who needs to integrate with Langflow's APIs, regardless of their specific role or the type of application they're building.

## Domain-Specific Implementations

These core journeys serve as the foundation for more specific implementations in various domains. For banking-specific implementations, see the [domain_specific](../domain_specific) directory.

## Rendering the Diagrams

To render these PlantUML diagrams:

1. Use the main script in the root directory:
   ```
   ./render_plantuml.sh
   ```

2. Or render specific diagrams:
   ```
   java -jar plantuml.jar reverse_docs/diagrams/banking_journeys/core_journeys/*.puml
   ```

The rendered SVG files will be available in the `images/diagrams/banking_journeys/core_journeys/` directory. 