# Langflow Backend Flow Persistence

## Overview

Flow Persistence refers to the system that manages the creation, retrieval, updating, and deletion (CRUD operations) of flows in Langflow. This system ensures that workflows created by users are properly stored, can be retrieved when needed, can be modified over time, and can be removed when no longer required.

## Flow Persistence Sequence Diagram

The flow persistence process is illustrated in the [Flow Persistence Sequence diagram](../diagrams/c4/backend/flows/flow_persistence_sequence.png).

![Flow Persistence Sequence](../imag../diagrams/c4/backend/flows/flow_persistence_sequence.png)

## Key Components

The Flow Persistence system involves several key components:

### Flow Controller

The Flow Controller handles HTTP requests related to flows:

```python
class FlowController:
    def create_flow(self, request, current_user):
        # Handle flow creation request
        
    def get_flow(self, flow_id, current_user):
        # Handle flow retrieval request
        
    def update_flow(self, flow_id, request, current_user):
        # Handle flow update request
        
    def delete_flow(self, flow_id, current_user):
        # Handle flow deletion request
```

### Flow Service

The Flow Service contains the business logic for flow operations:

```python
class FlowService:
    def create_flow(self, flow_data, user_id):
        # Business logic for flow creation
        
    def get_flow(self, flow_id, user_id):
        # Business logic for flow retrieval
        
    def update_flow(self, flow_id, updated_flow, user_id):
        # Business logic for flow updating
        
    def delete_flow(self, flow_id, user_id):
        # Business logic for flow deletion
```

### Flow Validator

The Flow Validator ensures that flow structures are valid:

```python
class FlowValidator:
    def validate_flow(self, flow_data):
        # Validate flow structure
        
    def check_flow_structure(self, flow_data):
        # Check basic flow structure
        
    def validate_components(self, flow_data):
        # Validate component types and connections
        
    def check_connections(self, flow_data):
        # Check connection validity
```

### Flow Repository

The Flow Repository interfaces with the database:

```python
class FlowRepository:
    def save_flow(self, flow_data):
        # Save flow to database
        
    def find_flow_by_id(self, flow_id):
        # Find flow in database by ID
        
    def update_flow(self, flow_id, flow_data):
        # Update flow in database
        
    def delete_flow(self, flow_id):
        # Delete flow from database
```

### Event Manager

The Event Manager handles events related to flow operations:

```python
class EventManager:
    def publish(self, event_type, event_data):
        # Publish an event
```

## Flow Creation Process

The flow creation process follows these steps:

1. **Request Handling**:
   - The API receives a POST request to `/api/v1/flows`
   - The Flow Controller validates the request body
   - The current user is identified from authentication

2. **Flow Preparation**:
   - A unique flow ID is generated
   - Creation timestamp is set
   - User ID is assigned to the flow
   - Default access control is applied

3. **Flow Validation**:
   - The Flow Validator checks the flow structure
   - Components are validated
   - Connections are checked for validity

4. **Flow Storage**:
   - If validation passes, the flow is prepared for database storage
   - The Flow Repository saves the flow to the database

5. **Event Publishing**:
   - A `flow.created` event is published
   - Subscribers to this event can perform additional actions

6. **Response**:
   - The created flow is returned to the user
   - HTTP 201 Created status is returned with flow details

## Flow Retrieval Process

The flow retrieval process follows these steps:

1. **Request Handling**:
   - The API receives a GET request to `/api/v1/flows/{flow_id}`
   - The current user is identified from authentication

2. **Flow Lookup**:
   - The Flow Repository looks up the flow by ID
   - If the flow doesn't exist, a 404 Not Found is returned

3. **Access Control**:
   - The system checks if the user has permission to view the flow
   - Public flows are accessible to all users
   - Private flows are only accessible to the owner or admins

4. **Event Publishing**:
   - A `flow.accessed` event is published
   - Subscribers can track flow access patterns

5. **Response**:
   - The flow data is returned to the user
   - HTTP 200 OK status is returned with flow details

## Flow Update Process

The flow update process follows these steps:

1. **Request Handling**:
   - The API receives a PUT request to `/api/v1/flows/{flow_id}`
   - The current user is identified from authentication

2. **Flow Lookup**:
   - The Flow Repository looks up the flow by ID
   - If the flow doesn't exist, a 404 Not Found is returned

3. **Access Control**:
   - The system checks if the user has permission to edit the flow
   - Only the owner or admins can edit flows

4. **Flow Validation**:
   - The updated flow is validated
   - If validation fails, a 400 Bad Request is returned with details

5. **Flow Merging**:
   - An update timestamp is set
   - The existing flow data is merged with the updates
   - Fields not included in the update are preserved

6. **Flow Storage**:
   - The Flow Repository updates the flow in the database

7. **Event Publishing**:
   - A `flow.updated` event is published
   - Subscribers can react to flow changes

8. **Response**:
   - The updated flow is returned to the user
   - HTTP 200 OK status is returned with the updated flow

## Flow Deletion Process

The flow deletion process follows these steps:

1. **Request Handling**:
   - The API receives a DELETE request to `/api/v1/flows/{flow_id}`
   - The current user is identified from authentication

2. **Flow Lookup**:
   - The Flow Repository looks up the flow by ID
   - If the flow doesn't exist, a 404 Not Found is returned

3. **Access Control**:
   - The system checks if the user has permission to delete the flow
   - Only the owner or admins can delete flows

4. **Flow Deletion**:
   - The Flow Repository deletes the flow from the database

5. **Event Publishing**:
   - A `flow.deleted` event is published
   - Subscribers can perform cleanup or related actions

6. **Response**:
   - HTTP 204 No Content status is returned
   - No response body is sent

## Database Schema

The Flow persistence system uses the following database schema:

```
Table: flow
- id: UUID (primary key)
- name: String
- description: String
- data: JSON
- user_id: UUID (foreign key)
- is_public: Boolean
- created_at: DateTime
- updated_at: DateTime
```

This schema is used by the Flow Repository to store and retrieve flows.

## Access Control

The Flow Persistence system implements several access control mechanisms:

1. **Authentication**: Ensures the user is logged in
2. **Owner Access**: Owners have full access to their flows
3. **Admin Access**: Admins have full access to all flows
4. **Public Access**: Public flows can be viewed by anyone
5. **Private Access**: Private flows are only accessible to owners and admins

```python
def check_access_permissions(flow, user_id):
    if flow.user_id == user_id:
        return True  # Owner access
    
    if flow.is_public:
        return True  # Public access
    
    user = user_service.get_user(user_id)
    if user.is_superuser:
        return True  # Admin access
    
    return False  # Access denied
```

## Error Handling

The Flow Persistence system handles several types of errors:

1. **Not Found Errors**: When a flow doesn't exist
2. **Permission Errors**: When a user doesn't have access
3. **Validation Errors**: When a flow has structural problems
4. **Database Errors**: When database operations fail

Each error type has appropriate handling and user-friendly messages.

## Related Diagrams

- [Database Schema Diagram](../diagrams/c4/backend/database/database_schema_simple.png): Shows the database structure
- [Flow Validation Sequence](../diagrams/c4/backend/flows/flow_validation_sequence.png): Shows the flow validation process
- [Flow Execution Sequence](../diagrams/sequence/backend/backend_flow_execution_sequence.png): Shows flow execution
- [API Request Lifecycle Sequence](../diagrams/sequence/backend/api_request_lifecycle_sequence.png): Shows API request handling