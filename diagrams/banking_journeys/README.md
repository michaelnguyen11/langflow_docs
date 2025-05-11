# Banking-Specific AI Journeys

This directory contains sequence diagrams showing how different functional divisions within a banking organization interact with the Langflow platform as an internal Generative AI solution.

## Purpose

These diagrams illustrate end-to-end workflows that map to the components defined in the C4 architecture model, showing how they work together to solve banking-specific challenges across different user types.

## Directory Structure

### Functional Division Organization

- **it_users/** - Sequence diagrams for IT division employees (technical banking staff)
- **digital_users/** - Sequence diagrams for Digital division employees (bridge between business and IT)
- **retail_users/** - Sequence diagrams for Retail Banking employees (customer-facing branch staff)

### Legacy Organization (For Reference)

- **customer_service/** - Sequence diagrams related to AI-enabled customer service
- **compliance/** - Sequence diagrams for regulatory compliance and risk management
- **development/** - Sequence diagrams for bank-specific AI solution development

## Key Banking Roles by Division

### IT Users
- Backend developers
- Infrastructure specialists
- Security engineers
- DevOps engineers
- System administrators
- Integration specialists

### Digital Users
- Product owners
- Business analysts
- Digital experience designers
- Digital channel managers
- Innovation specialists
- Agile coaches

### Retail Users
- Branch customer service representatives
- Relationship managers
- Financial advisors
- Tellers
- Branch managers
- Call center representatives

## Recommended Reading Sequence

1. First review the division-specific journeys to understand the complete workflow for each user type
2. Then examine the detailed sequences for specific aspects of each workflow
3. Reference the C4 architecture diagrams to understand the underlying system components

## Related Documentation

- See main C4 architecture diagrams in `/diagrams/c4/` for component references
- See implementation details in `/backend/` and `/frontend/` directories 