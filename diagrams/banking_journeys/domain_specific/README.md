# Domain-Specific Implementations

This directory contains sequence diagrams that demonstrate how the core Langflow user journeys are implemented in specific banking contexts.

## Directory Structure

```
domain_specific/
├── retail_banking/           # Implementations for retail banking
│   └── ai_assisted_customer_service.puml  # Customer service AI agent
│
├── corporate_banking/        # Implementations for corporate banking
│   └── ai_solution_design_implementation.puml  # Corporate solution design
│
└── regulatory_compliance/    # Implementations for regulatory compliance
    └── regulatory_compliance_monitoring.puml  # Compliance monitoring
```

## Relationship to Core Journeys

These domain-specific diagrams show how the abstract patterns from the core journeys are applied to specific banking use cases:

1. **Flow Designer Journey** implementations show how specific types of banking users (like branch representatives or product owners) create specialized flows for their specific needs.

2. **API Integration Journey** implementations show how developers in banking contexts integrate Langflow's capabilities into banking-specific applications and systems.

## Retail Banking Implementations

The retail banking examples demonstrate how customer-facing banking employees use Langflow to:
- Assist customers with financial questions and transactions
- Generate personalized financial recommendations
- Process banking transactions with AI assistance
- Generate compliant documentation

## Corporate Banking Implementations

The corporate banking examples show how digital channel and product teams use Langflow to:
- Design AI solutions for corporate clients
- Implement and test financial product workflows
- Deploy AI capabilities to banking channels
- Monitor usage and performance in corporate contexts

## Regulatory Compliance Implementations

The regulatory compliance examples illustrate how compliance teams use Langflow to:
- Monitor transactions for regulatory issues
- Generate compliance reports and documentation
- Implement automated regulatory checks
- Manage audit trails and compliance evidence

## Extending with New Domain-Specific Examples

When adding new domain-specific examples:

1. Create a new subdirectory for the domain if needed
2. Create PlantUML diagrams that show how the core journeys are implemented
3. Update this README.md with information about the new examples
4. Ensure the examples clearly reference which core journey they implement

## Rendering the Diagrams

To render these PlantUML diagrams:

1. Use the main script in the root directory:
   ```
   ./render_plantuml.sh
   ```

2. Or render specific diagrams:
   ```
   java -jar plantuml.jar reverse_docs/diagrams/banking_journeys/domain_specific/**/*.puml
   ```

The rendered SVG files will be available in the corresponding directories under `images/diagrams/banking_journeys/domain_specific/`. 