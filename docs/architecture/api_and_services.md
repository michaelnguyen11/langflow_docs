# Langflow API and Services

## API Overview

Langflow provides a comprehensive REST API that powers the frontend and enables integration with external applications. The API follows RESTful principles and uses JSON for data exchange. The API implementation is primarily located in the `/src/backend/base/langflow/api` directory.

## API Implementation Mapping

| API Component | Location | Description | Purpose |
|---------------|----------|-------------|---------|
| API Router | `/src/backend/base/langflow/api/router.py` | Main API router | Routes requests to appropriate API version |
| V1 Router | `/src/backend/base/langflow/api/v1/router.py` | V1 API router | Routes V1 API requests to handlers |
| V2 Router | `/src/backend/base/langflow/api/v2/router.py` | V2 API router | Routes V2 API requests to handlers |
| Middlewares | `/src/backend/base/langflow/middleware.py` | Request middleware | Processes requests before handlers |
| Base API | `/src/backend/base/langflow/api/v1/base.py` | Base API functionality | Common API utilities and dependencies |
| Exception Handlers | `/src/backend/base/langflow/api/error_handling.py` | Error handlers | Global API error handling |

## API Endpoints

The API is organized into several categories:

### Endpoint Implementation Mapping

| Endpoint | HTTP Method | Implementation | Purpose |
|----------|-------------|----------------|---------|
| **Flow Management** |
| `/api/v1/flows` | GET | `/src/backend/base/langflow/api/v1/flows.py:list_flows` | List all flows |
| `/api/v1/flows` | POST | `/src/backend/base/langflow/api/v1/flows.py:create_flow` | Create a new flow |
| `/api/v1/flows/{flow_id}` | GET | `/src/backend/base/langflow/api/v1/flows.py:get_flow` | Get a specific flow |
| `/api/v1/flows/{flow_id}` | PUT | `/src/backend/base/langflow/api/v1/flows.py:update_flow` | Update a flow |
| `/api/v1/flows/{flow_id}` | DELETE | `/src/backend/base/langflow/api/v1/flows.py:delete_flow` | Delete a flow |
| `/api/v1/flows/{flow_id}/duplicate` | POST | `/src/backend/base/langflow/api/v1/flows.py:duplicate_flow` | Duplicate a flow |
| **Flow Execution** |
| `/api/v1/flows/{flow_id}/execute` | POST | `/src/backend/base/langflow/api/v1/flows.py:execute_flow` | Execute a flow |
| `/api/v1/flows/{flow_id}/predict` | POST | `/src/backend/base/langflow/api/v1/flows.py:predict_flow` | Run prediction with a flow |
| `/api/v1/chat/{flow_id}` | POST | `/src/backend/base/langflow/api/v1/chat.py:chat_stream` | Interactive chat with a flow |
| `/api/v1/flows/status/{flow_id}` | GET | `/src/backend/base/langflow/api/v1/flows.py:get_flow_status` | Get flow execution status |
| **Component Information** |
| `/api/v1/components` | GET | `/src/backend/base/langflow/api/v1/endpoints.py:get_all_types` | List all component types |
| `/api/v1/components/{component_type}` | GET | `/src/backend/base/langflow/api/v1/endpoints.py:get_type_by_name` | Get component details |
| **User Management** |
| `/api/v1/login` | POST | `/src/backend/base/langflow/api/v1/login.py:login` | User login |
| `/api/v1/logout` | POST | `/src/backend/base/langflow/api/v1/login.py:logout` | User logout |
| `/api/v1/users` | POST | `/src/backend/base/langflow/api/v1/users.py:create_user` | Create a new user |
| `/api/v1/users/me` | GET | `/src/backend/base/langflow/api/v1/users.py:get_me` | Get current user info |
| `/api/v1/users/me` | PUT | `/src/backend/base/langflow/api/v1/users.py:update_me` | Update user info |
| **File Management** |
| `/api/v1/files/upload` | POST | `/src/backend/base/langflow/api/v1/files.py:upload_file` | Upload a file |
| `/api/v1/files/{file_id}` | GET | `/src/backend/base/langflow/api/v1/files.py:download_file` | Download a file |
| `/api/v1/files/{file_id}` | DELETE | `/src/backend/base/langflow/api/v1/files.py:delete_file` | Delete a file |
| **Utilities** |
| `/health` | GET | `/src/backend/base/langflow/api/health_check_router.py:health_check` | Health check |
| `/api/v1/version` | GET | `/src/backend/base/langflow/api/v1/version.py:get_version` | Get API version info |
| `/api/v1/logs` | GET | `/src/backend/base/langflow/api/log_router.py:get_logs` | Get application logs |

### Request Handler Implementation Structure

Most API endpoints follow a consistent implementation pattern:

```python
# Example implementation pattern
@router.get("/endpoint/{id}", response_model=ResponseModel)
async def endpoint_handler(
    id: str,
    service: Service = Depends(deps.get_service),
    current_user: User = Depends(deps.get_current_user)
):
    # Validate permissions
    if not current_user.can_access(id):
        raise HTTPException(status_code=403, detail="Permission denied")
    
    # Process request
    try:
        result = await service.operation(id, user_id=current_user.id)
        return result
    except Exception as e:
        # Handle specific exceptions
        raise HTTPException(status_code=500, detail=str(e))
```

## Authentication Implementation

The API uses JSON Web Token (JWT) authentication:

| Authentication Feature | Implementation | Description |
|------------------------|----------------|-------------|
| Token Generation | `/src/backend/base/langflow/services/auth/utils.py:create_token` | Creates access and refresh tokens |
| Token Validation | `/src/backend/base/langflow/services/auth/utils.py:verify_token` | Validates token signature and expiration |
| Authentication Middleware | `/src/backend/base/langflow/api/v1/base.py:get_current_user` | Validates token in request header |
| Login Handler | `/src/backend/base/langflow/api/v1/login.py:login` | Authenticates user and issues tokens |
| Refresh Token | `/src/backend/base/langflow/api/v1/login.py:refresh_token` | Issues new access token using refresh token |
| Password Hashing | `/src/backend/base/langflow/services/auth/utils.py:get_password_hash` | Securely hashes passwords |
| Password Verification | `/src/backend/base/langflow/services/auth/utils.py:verify_password` | Verifies password against hash |

### Authentication Flow

1. User submits credentials to `/api/v1/login`
2. Auth service verifies credentials and generates tokens
3. Access token is included in `Authorization: Bearer {token}` header for subsequent requests
4. Middleware validates token and attaches user to request context
5. Protected endpoints check user permissions before processing

## Request/Response Format

API requests and responses use JSON format:

### Request Example

```json
POST /api/v1/flows
{
  "name": "My Flow",
  "description": "A sample flow",
  "data": {
    "nodes": [...],
    "edges": [...]
  }
}
```

### Response Example

```json
{
  "id": "flow-123",
  "name": "My Flow",
  "description": "A sample flow",
  "data": {
    "nodes": [...],
    "edges": [...]
  },
  "created_at": "2023-06-01T12:00:00Z",
  "updated_at": "2023-06-01T12:00:00Z"
}
```

## Error Handling Implementation

API errors follow a consistent format:

```json
{
  "detail": "Error message",
  "error_code": "ERROR_CODE",
  "status_code": 400
}
```

| Error Type | Implementation | Description |
|------------|----------------|-------------|
| Global Exception Handler | `/src/backend/base/langflow/api/error_handling.py` | Catches and formats unhandled exceptions |
| Custom Exceptions | `/src/backend/base/langflow/exceptions.py` | Domain-specific exception types |
| Validation Errors | `/src/backend/base/langflow/api/v1/base.py` | Input validation errors using Pydantic |
| Authorization Errors | `/src/backend/base/langflow/api/v1/base.py:get_current_user` | Authentication and permission errors |
| Not Found Errors | `/src/backend/base/langflow/services/base.py` | Resource not found errors |

Common error codes include:

- `VALIDATION_ERROR`: Invalid input data
- `NOT_FOUND`: Resource not found
- `UNAUTHORIZED`: Authentication required
- `FORBIDDEN`: Permission denied
- `INTERNAL_ERROR`: Server error

## Rate Limiting Implementation

The API implements rate limiting to prevent abuse:

| Rate Limiting Feature | Implementation | Description |
|----------------------|----------------|-------------|
| Rate Limiting Middleware | `/src/backend/base/langflow/middleware.py:RateLimitMiddleware` | Tracks and limits request rates |
| Rate Configuration | `/src/backend/base/langflow/services/settings/base.py` | Configures rate limits per endpoint |
| Response Headers | `/src/backend/base/langflow/middleware.py:RateLimitMiddleware.add_headers` | Adds rate limit headers to responses |
| Custom Limits | `/src/backend/base/langflow/services/settings/base.py` | Configures different limits for different endpoints |

## Services Architecture

Langflow employs a service-oriented architecture where core functionality is encapsulated in services:

### Services Implementation Mapping

| Service | Location | Base Class | Description |
|---------|----------|------------|-------------|
| **Settings Service** | `/src/backend/base/langflow/services/settings` | `SettingsService` | Manages application configuration |
| **Database Service** | `/src/backend/base/langflow/services/database` | `DatabaseService` | Handles database operations |
| **Auth Service** | `/src/backend/base/langflow/services/auth` | `AuthService` | Manages authentication and authorization |
| **Queue Service** | `/src/backend/base/langflow/services/job_queue` | `JobQueueService` | Manages background task processing |
| **Telemetry Service** | `/src/backend/base/langflow/services/telemetry` | `TelemetryService` | Tracks usage and metrics |
| **File Service** | `/src/backend/base/langflow/services/storage` | `StorageService` | Manages file operations |
| **Flow Service** | `/src/backend/base/langflow/services/flow` | `FlowService` | Manages flow operations |
| **Cache Service** | `/src/backend/base/langflow/services/cache` | `CacheService` | Provides caching functionality |
| **Chat Service** | `/src/backend/base/langflow/services/chat` | `ChatService` | Manages chat interactions |
| **Session Service** | `/src/backend/base/langflow/services/session` | `SessionService` | Manages user sessions |

### Settings Service

- Manages application configuration
- Handles environment variables
- Controls feature flags
- Sets system defaults

**Key Implementations:**
- `/src/backend/base/langflow/services/settings/base.py:Settings` - Core settings class
- `/src/backend/base/langflow/services/settings/service.py:SettingsService` - Settings service implementation
- `/src/backend/base/langflow/services/settings/constants.py` - Default configuration values

### Database Service

- Manages database connections
- Implements data access layer
- Handles migrations
- Provides transaction support

**Key Implementations:**
- `/src/backend/base/langflow/services/database/service.py:DatabaseService` - Core database service
- `/src/backend/base/langflow/services/database/utils.py` - Database utilities
- `/src/backend/base/langflow/schema` - ORM models for database entities
- `/src/backend/base/langflow/services/database/repository` - Repository pattern implementations

### Auth Service

- Manages user authentication
- Handles JWT creation and validation
- Implements role-based access control
- Integrates with external auth providers

**Key Implementations:**
- `/src/backend/base/langflow/services/auth/service.py:AuthService` - Core auth service
- `/src/backend/base/langflow/services/auth/utils.py` - Authentication utilities
- `/src/backend/base/langflow/services/auth/models.py` - Authentication data models

### Queue Service

- Manages background tasks
- Handles long-running operations
- Implements job scheduling
- Provides status tracking

**Key Implementations:**
- `/src/backend/base/langflow/services/job_queue/service.py:JobQueueService` - Core queue service
- `/src/backend/base/langflow/services/job_queue/abstract.py` - Abstract queue interface
- `/src/backend/base/langflow/services/job_queue/memory.py` - In-memory queue implementation

### Telemetry Service

- Collects usage statistics
- Tracks performance metrics
- Handles error reporting
- Supports observability

**Key Implementations:**
- `/src/backend/base/langflow/services/telemetry/service.py:TelemetryService` - Core telemetry service
- `/src/backend/base/langflow/services/telemetry/models.py` - Telemetry data models

### File Service

- Manages file uploads and downloads
- Handles temporary storage
- Provides access control for files
- Supports different storage backends

**Key Implementations:**
- `/src/backend/base/langflow/services/storage/service.py:StorageService` - Core storage service
- `/src/backend/base/langflow/services/storage/file.py` - File handling implementation
- `/src/backend/base/langflow/services/storage/models.py` - File storage models

## Service Dependencies and Injection

Services follow a dependency injection pattern:

### Dependency Injection Implementation

| Feature | Implementation | Description |
|---------|----------------|-------------|
| Service Container | `/src/backend/base/langflow/services/container.py` | Container for service instances |
| Service Factory | `/src/backend/base/langflow/services/factory.py` | Creates service instances |
| Dependency Providers | `/src/backend/base/langflow/services/deps.py` | FastAPI dependency providers |
| Service Initialization | `/src/backend/base/langflow/main.py:lifespan` | Initializes services at startup |

```python
# Example dependency injection pattern
@router.get("/endpoint")
async def endpoint_handler(
    db_service: DatabaseService = Depends(deps.get_db_service),
    auth_service: AuthService = Depends(deps.get_auth_service)
):
    # Use injected services
    result = await db_service.fetch_data()
    return result
```

### Service Dependency Graph

```
                ┌─────────────┐
                │SettingsService│
                └───────┬─────┘
                        │
                        ▼
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│TelemetryService│◄───┤DatabaseService├───►│StorageService│
└─────────────┘     └──────┬──────┘     └─────────────┘
                           │
                 ┌─────────┴─────────┐
                 ▼                   ▼
         ┌─────────────┐     ┌─────────────┐
         │ AuthService │     │ FlowService │
         └─────────────┘     └──────┬──────┘
                                    │
                                    ▼
                            ┌─────────────┐
                            │ ChatService │
                            └─────────────┘
```

## Background Tasks Implementation

Long-running operations are handled as background tasks:

| Feature | Implementation | Description |
|---------|----------------|-------------|
| Task Queue | `/src/backend/base/langflow/services/job_queue/service.py` | Queue for background tasks |
| Task Execution | `/src/backend/base/langflow/worker.py` | Worker process for tasks |
| Task Status | `/src/backend/base/langflow/services/job_queue/models.py` | Status tracking for tasks |
| Task Results | `/src/backend/base/langflow/services/job_queue/result.py` | Result storage for tasks |

Task processing flow:
1. Task is queued via `JobQueueService.enqueue(task)`
2. Worker process picks up task from queue
3. Task is executed in background
4. Results are stored for later retrieval
5. Status is updated throughout the process

## Service Configuration Implementation

Services are configured through several mechanisms:

| Configuration Source | Implementation | Description |
|----------------------|----------------|-------------|
| Environment Variables | `/src/backend/base/langflow/services/settings/base.py` | Settings from environment |
| Configuration Files | `/src/backend/base/langflow/services/settings/file.py` | Settings from config files |
| Database Settings | `/src/backend/base/langflow/services/settings/database.py` | Settings stored in database |
| Command-line Arguments | `/src/backend/base/langflow/main.py` | Settings from command line |

## API Documentation Implementation

The API is documented using OpenAPI (Swagger):

| Feature | Implementation | Description |
|---------|----------------|-------------|
| OpenAPI Schema | `/src/backend/base/langflow/main.py:create_app` | Generates OpenAPI schema |
| Swagger UI | FastAPI built-in | Interactive API documentation |
| ReDoc | FastAPI built-in | Alternative API documentation |
| Documentation Customization | `/src/backend/base/langflow/main.py:create_app` | Customizes documentation appearance |

## API Versioning Implementation

The API uses URL versioning:

| Version | Implementation | Description |
|---------|----------------|-------------|
| V1 API | `/src/backend/base/langflow/api/v1` | Current primary API version |
| V2 API | `/src/backend/base/langflow/api/v2` | Newer API version (if implemented) |
| Router | `/src/backend/base/langflow/api/router.py` | Routes to appropriate version |

## Example Service Implementation

Here's an example of a typical service implementation pattern:

```python
# Service class pattern
class SampleService(BaseService):
    """Sample service implementation."""
    
    def __init__(self, settings: Settings, db_service: DatabaseService):
        super().__init__()
        self.settings = settings
        self.db_service = db_service
        self.logger = logging.getLogger(__name__)
    
    async def initialize(self):
        """Initialize the service."""
        self.logger.info("Initializing sample service")
        # Setup code
    
    async def operation(self, param: str) -> Result:
        """Perform an operation."""
        self.logger.debug(f"Performing operation with param: {param}")
        # Operation implementation
        return result
    
    async def cleanup(self):
        """Clean up resources."""
        self.logger.info("Cleaning up sample service")
        # Cleanup code
```

## Conclusion

The API and Services layer forms the foundation of Langflow's backend architecture. The clean separation of concerns between API endpoints and service implementations allows for modularity, testability, and maintainability. Understanding the relationships between these components is essential for extending or customizing Langflow's functionality.