# Langflow User Journeys

This directory contains sequence diagrams showing how different types of users interact with the Langflow platform, with a special focus on application in banking contexts.

## New Two-Layered Structure

The documentation is organized using a two-layered approach:

### Layer 1: Core User Types
- **Flow Designer Journey** - End-to-end process for users creating, testing, and deploying AI agents
- **API Integration Journey** - Complete developer workflow for integrating Langflow into applications

### Layer 2: Domain-Specific Examples
- Banking-specific implementations that build on the core journeys
- Examples showing how different banking roles utilize the platform

## Directory Structure

```
banking_journeys/
├── core_journeys/                 # Core user type journeys
│   ├── flow_designer_journey.puml # Journey for creating AI agents
│   └── api_integration_journey.puml # Journey for API integration
│
└── domain_specific/              # Domain-specific examples
    ├── retail_banking/           # Retail banking implementations
    ├── corporate_banking/        # Corporate banking implementations
    └── regulatory_compliance/    # Compliance-specific implementations
```

## Core User Journeys

### Flow Designer Journey
This journey illustrates the end-to-end process for users who want to create AI agents:
- Designing and building flows
- Testing agent functionality
- Deploying agents to production
- Monitoring and improving performance

### API Integration Journey
This journey illustrates the process for developers integrating with Langflow's APIs:
- API authentication and access
- Component and flow management via API
- Running flows through the API
- Monitoring and managing deployment

## Banking-Specific Examples

The domain-specific examples demonstrate how the core journeys are implemented in banking contexts, including:

- Customer service assistants for retail banking
- Regulatory compliance monitoring systems
- Financial product recommendation engines
- Fraud detection and prevention systems
- Transaction monitoring and anomaly detection

## Recommended Reading Sequence

1. First review the core user journeys to understand the general workflow patterns
2. Then explore domain-specific examples relevant to your specific use case
3. Reference the C4 architecture diagrams to understand the underlying system components

## Related Documentation

- See main C4 architecture diagrams in `/diagrams/c4/` for component references
- See implementation details in `/docs/backend/` and `/docs/frontend/` directories 