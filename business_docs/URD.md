# Overview

The Generative AI platform (based on Langflow) will be used by internal bank employees across various departments to build and interact with AI agents. This User Requirements Document captures the needs of end-users and stakeholders from a functional perspective. It focuses on what users require the system to do, how they will use it, and the constraints under which it operates, all in user-centric language. The platform aims to cater to different user groups within the bank:

- Regular Employees (Business Users): who will use the visual interface to create and run AI workflows to assist in their daily tasks.
- Developers/Technical Users: who may extend the platform by adding custom integrations or use the platform’s APIs to embed AI flows into other tools.
- Administrators: who manage user access, oversee compliance, and keep the system running smoothly.
- Compliance Officers/Auditors: who will review usage and ensure the platform is used in accordance with policies.

This URD outlines the requirements from these users’ perspectives. The overall goal is to ensure the platform is user-friendly, secure, and tailored to banking workflows, enabling widespread adoption and trust in the AI assistants it powers.

# Business Requirements

1. Increase Efficiency in Daily Tasks: Users require that the platform helps them complete their work faster. For example, a relationship manager wants to quickly summarize lengthy policy documents, and a customer support agent wants instant answers from an internal knowledge base. The business need is to reduce manual effort by leveraging AI, within a tool that is readily accessible in their workflow.

2. Self-Service AI Solution Creation: The platform must empower business users to create their own AI solutions without having to involve the software development team for each request. This addresses the business need of agility – departments can innovate and automate processes on their own, leading to a more responsive organization.

3. Ensure Security and Compliance: Given the highly regulated banking environment, the platform must enable AI usage without violating compliance. The business requires that any AI agent created will not expose confidential data or operate outside approved boundaries. This means compliance and audit teams need insight and control. The platform must satisfy the bank’s regulatory obligations (e.g., audit logs for FINRA/SEC, data protection for GLBA) while still being useful.

4. Integration with Banking Systems: The usefulness of AI agents is tied to the data they can access. Business users need the platform to integrate with internal banking systems (like knowledge bases, CRM, transaction databases) so that AI outputs are relevant and up-to-date. This requirement stems from the need to make AI agents context-aware with the bank’s proprietary data (e.g., an AI assistant for compliance should access the repository of compliance rulings or past reports).

5. Reliable and Controlled Deployment: Users (and management) require that the AI agents produced are reliable tools, not black boxes. They should produce consistent results and any critical use should be vetted. The business will not accept a solution that unpredictably fails or provides incorrect info without an ability to refine it. Therefore, the platform needs features like testing modes, version control, and possibly an approval workflow for certain sensitive flows.

6. Measurable Outcomes: The business also requires the platform to provide feedback on usage and impact. For example, team leads might want to see how often the AI agents are used and how much time they save. This ties into a requirement for usage analytics or reports – demonstrating the ROI of the platform is a business requirement for continued support and funding.

# Functional Requirements

1. Easy Flow Design Interface:
The user (bank employee) shall be presented with a visual canvas to design AI workflows. It should have a palette of components (LLMs, data sources, logic controls) that can be dragged onto the canvas. Users can connect these nodes to define the flow of information (e.g., connecting a “Database Query” component to an “LLM Prompt” component). They should be able to configure each component by clicking it (for example, entering the prompt text for an LLM or the query for a database). This interface should be intuitive for non-programmers, using clear labels and possibly templates (starter flows) to guide new users.

2. Component Library and Descriptions:
The platform shall provide a library of pre-built components (nodes) that users can use in their flows. For each component, the system will show a description and usage hints. For instance, if a user pulls in a “Summarize Text (LLM)” component, the UI might explain “Uses a large language model to summarize input text. Connect an input source and configure the prompt.” Components might include: various LLM models, memory (to store conversation context), tools like calculators or search, and connectors to internal systems (APIs, databases). Users require that these are available so they don’t have to build logic from scratch.

3. User Authentication & Profile:
Users shall log in using their corporate credentials. Upon first login, a user profile is created, tied to their department and role. The system should recognize their role to tailor the experience (e.g., an Admin gets an admin dashboard; a regular user doesn’t). The profile will also keep track of their own saved flows, execution history, and preferences. For example, a user can see a list of “My AI Agents” that they’ve built.

4. Creating a New AI Agent (User Story):
When a bank employee wants to create a new AI agent:
    - They log in and choose “Create New Flow/Agent.”
    - The system asks for some basic info like agent name and optional description.
    - The user is taken to an empty canvas where they can add components. They might first add an “Input” component (to define how they will input queries to this agent, e.g., a text input). Then they might add an “LLM” component and connect it to the input. They configure the LLM by selecting a model (perhaps from an approved list of models) and writing a prompt template. They could add a “Database Query” component if the agent needs data – connecting it in sequence such that the query runs, then the result is passed into the prompt for the LLM.
    - The user can test the agent right there in the design interface (maybe via a “Play” or “Test” button). The platform executes the flow with test inputs and shows the output in a chat box or output panel. For instance, they type “Summarize the latest policy updates” in test mode, and the agent runs and returns a summary, which they see.
    - The user can iteratively refine the flow: adjust prompts, add new components (maybe add a “Formatting” component to format the answer, or a “Memory” to store context across runs, etc.). This continues until they are satisfied.
    - Finally, the user saves the flow. They should be able to mark it “private” (only they can run it) or share it within their department. The platform might prompt for a review if certain sensitive components are used (for example, if they included an external API call).

5. Running AI Agents (User Story):
For a bank employee using an AI agent (either one they created or one shared to them):
    - They select the agent from a list/dashboard. The interface likely shows a simple chat-like interface or input form depending on the design of that flow.
    - They input their query or data (e.g., upload a document if the flow starts with a file input, or type a question).
    - They hit “Run” and the system executes the flow, showing progress or a loading indicator.
    - The result is displayed. If it’s a chat-type agent, the result may appear as a message from the AI. If it’s a one-time task (like generating a report), it might show a link to download the report or the text output directly.
    - The user should have an option to provide feedback or rate the answer, or report an issue if the output looks wrong (for future improvement).
    - They may also see a history of their past queries for that agent (especially if memory is enabled or for their reference).

6. Saving and Versioning Flows:
Users require the ability to save their work and come back to it. The platform shall allow saving a flow at any time. Each save could create a new version (so they can revert if a change breaks something). An advanced user might want to label versions (e.g., “v1.0 – initial working version”). There should be an option to duplicate a flow as well (to use an existing one as a starting template for a new agent).

7. Sharing and Collaboration:
A user (say in the compliance department) might want to share a useful agent with teammates. The platform shall allow a flow owner to share access with specific colleagues or to a group/department. Sharing could have levels: e.g., “Can view/run” vs “Can edit”. So a manager could build an agent and allow her team to use it but not modify it. Collaboration: eventually, having multiple editors on a flow simultaneously could be useful (though real-time collaborative editing may not be in initial scope, at minimum sequential collaboration is needed – one user edits, then another can edit later).

8. Administrative Functions:
Admin users shall have a special interface for system management. This includes:
    - User Management: view list of users, their roles, departments. Admin can deactivate/activate users or change roles (except perhaps when integrated with SSO, some of this might be read-only from the identity provider).
    - Flow Oversight: see all flows created in the system, with ability to filter by department or owner. Admin can open any flow (in view mode) to inspect its components, in case a review is needed. They should also have the power to disable or delete a flow if it’s against policy.
    - System Configuration: manage global settings like which LLM APIs are available. For example, Admin may plug in API keys for OpenAI or an internal model endpoint URL. They might toggle features (like disabling any component that accesses the internet if policy changes, or setting rate limits on API usage).
    - Monitoring Dashboard: as mentioned, admins get a dashboard of usage statistics (# of executions, any errors, performance metrics, etc.). They can set alerts – e.g., if an unusually high number of requests happen (which might indicate misuse), or if an external API cost exceeds a threshold.

9. Compliance/Audit Functions:
A compliance officer (with appropriate access) shall be able to audit the system’s usage:

- They can search logs for specific keywords or events (e.g., find all flows that used a “CustomerData” component in last month, or retrieve all prompts that contained certain sensitive keywords).
- They can generate an audit report listing who accessed what data through the AI platform. For example, “User X ran the ‘Policy Summarizer’ agent on 2025-05-01 which accessed document Y and produced output Z.”
- The platform should facilitate read-only access for auditors to review configurations and outputs. Possibly an “Audit Mode” where the compliance user can impersonate view of a flow run without being able to modify anything.
- If the platform has an approval workflow for flows (optional feature), the compliance officer could be part of that – e.g., receiving a notification when a flow with certain high-risk components is created, to review and approve it before it’s widely used.

10. External API Integration for Developers:
For developer users, the system shall provide an API (REST endpoints) to trigger flows and manage them externally. For instance, a developer might want to integrate an AI flow into an internal web portal. They should be able to get an API endpoint (and token) to invoke a specific flow with inputs and receive outputs in JSON. The platform will thus expose endpoints like /api/v1/flows/{flow_id}/run that accept input data. Additionally, documentation or code snippets (Python, JavaScript examples) should be available to guide developers. This allows the platform’s AI capabilities to be embedded into other internal applications easily.

11. Performance and Feedback to User:
When a user runs a flow, if it’s taking time (maybe the LLM call is slow or it’s processing a large document), the UI should give feedback – a loading spinner, or even intermediate status messages if possible (“Embedding document… calling LLM… composing answer…”). This is to ensure the user knows the system is working and not frozen. If any step fails, a clear error message should be shown (with enough detail to act on, but not overly technical). For example, “Error: The database query returned no results” or “The language model is currently unavailable, please try again later.”

12. Help and Documentation in UI:
Users should have easy access to help. The platform might include a help sidebar or tooltips. For example, if a user is unsure how to use a “Vector Store” component, they could hover a help icon that explains it in plain language. There could also be a few sample flows provided in the system that users can open and learn from (like a tutorial: “Hello World of Langflow – ask a question to an AI”).

13. Data Handling and Export:
If a flow produces a significant result (like a report or a chart), the user should be able to export that. Possibly as a file download or copyable text. Similarly, users might want to export a flow definition (Langflow supports exporting flows as JSON). The platform should allow advanced users to export their flow JSON (which could be stored in version control or shared externally if needed) and import flows (if someone else provides a JSON). This is more of a technical user feature but can be handy for backing up or sharing flows beyond the system.

14. Session Management:
The platform should handle user sessions securely. If a user is idle or closes their browser, their work should be saved (auto-save drafts of flows periodically). Sessions should expire after a certain time for security (the user would need to log in again), but with a warning to not lose unsaved work. Also, if multiple sessions are opened, ensure consistency (perhaps lock a flow being edited by one user).

15. Notification of Changes:
If the platform or certain flows are updated (say an admin updates the version of an LLM in use, or deprecates a component), users should be notified in-app. For instance, an announcement banner: “The system will undergo maintenance tonight” or “A new component ‘Sentiment Analysis’ is now available.” This keeps users informed of changes that might affect their experience.

# Non-Functional Requirements

- Security (Authentication & Authorization): The system must ensure only authenticated users can access it. It will use corporate SSO, meaning users login with their existing credentials and possibly a second factor (if company policy). Every API call from the frontend will carry the user’s identity (token) so the backend can enforce permissions on each action. For example, even if a user tries to manipulate an API call to access someone else’s flow, the backend will validate their token and return an authorization error. The principle of least privilege applies – by default users can only access their stuff, and only admins can access everything.

- Data Security: Any data that flows through the platform (prompts, model outputs, data from internal DBs) should not leak to unauthorized parties. The system will run in a secured network. Data at rest (flows definitions in the database, uploaded files in storage) must be encrypted. Data in transit must use TLS. Moreover, if external LLMs are used, the system should provide ways to scrub or anonymize sensitive data in prompts if possible, or clearly warn users and require approval for sending such data out. The bank’s data classification policies will be adhered to (e.g., “Confidential” data might be barred from being used in prompts to external APIs without special clearance).

- Privacy and Logging: User interactions with the system will be logged for audit, but those logs themselves should be protected. Only authorized roles can view them. The platform will likely contain personal data (like employee IDs, possibly some customer info if employees put it in prompts), so it must enforce privacy controls. For example, an admin can see that “User X ran Flow Y at time Z” but may not see the exact content of the query if that content is sensitive and they’re not allowed – unless they are a compliance officer doing an investigation in which case access might be granted. Essentially, log sensitive details in a secure manner (perhaps encrypted logs that only certain roles can decrypt).

- Reliability: Users expect the system to be available during working hours without interruption. The system should handle minor outages gracefully. If one component (like the vector database service) is temporarily down, the system should show an error for that functionality but not crash entirely. Also, the system should prevent data loss – if a server crashes while a user is editing, the last autosaved version should be available on restart. Regular backups of important data (flow definitions, user-generated content) must be done in the background.

- Performance & Scalability: From the user’s point of view, the platform should feel snappy. The UI should load within a couple of seconds when they navigate to it. Component actions like dragging or editing nodes should have no noticeable lag. When executing flows, simple flows (<5 nodes) might return almost instantly (depending on LLM speed), while complex ones might take longer – but the system should handle even complex flows (say a chain of 10 calls or a big document analysis) within a reasonable time (perhaps under 30 seconds) and certainly not time out or fail unexpectedly. If many users use it concurrently, the system should scale so that one user’s heavy flow doesn’t slow down another’s (this might involve queueing or distributing load).

- Usability & Accessibility: The platform’s design should follow good UX principles. Use bank’s standard web UI style for familiarity (colors, fonts). Ensure that error messages and instructions are in plain language, not technical jargon (for non-technical staff). Provide confirmations for destructive actions (“Are you sure you want to delete this flow?”). Accessibility matters: for any users who might use screen readers or have other needs, ensure the web interface is navigable (proper labels on buttons, keyboard navigation for canvas if possible, etc.).

- Compatibility: The web application should be compatible with the browsers and devices used in the bank. Likely that means latest versions of Chrome/Edge, and maybe Safari/Firefox if used by some. It should not require any unsafe plugins. Also, if there are any mobile or tablet use cases (perhaps not primary, but maybe viewing results on a tablet in a meeting), the interface should at least be responsive/readable on those screens, even if designing flows is best done on a large screen.

- Maintainability & Supportability: From a user perspective, this means the system shouldn’t have frequent downtimes for upgrades. Updates should be infrequent and scheduled in advance. If a user encounters a problem, support should be able to help quickly – so behind the scenes, maintainers will need diagnostic tools (like logs, health checks). Ideally, the platform will have a way to report an issue or contact support from within it (like a “Report Issue” button that sends context to the support team).

- Regulatory Compliance Features: The system design should facilitate compliance. For example, if an audit requires data deletion (the right to be forgotten for a customer’s data), the platform should be able to purge that customer’s data from logs or vector stores if it was ingested. If regulators ask “how does this AI produce answers?”, the bank should be able to explain (which means having documentation of the flows and perhaps the model sources). The platform should be built in alignment with guidance from bodies like the Federal Reserve/OCC on AI usage – which emphasize things like human oversight, explainability (we might capture the chain-of-thought or intermediate steps the agent took, for transparency to the user).

- Extensibility: Although a backend concern, from a user perspective it means new features can appear without a total system overhaul. If next year the bank wants a new type of AI model integrated (say image analysis for fraud IDs), the platform should be able to add that as a new component and users can then start using it. So it should be modular.

- Localization: Today the user base is presumably English-speaking (in the US), so the UI in English is fine. But if there are bilingual needs or plans to roll out globally, the system should be built with potential for localization (not hardcoding text, etc.). This might be a low priority requirement but worth noting for future-proofing.

# User Stories

## Story 1

- Bank Employee (Analyst) Creates an AI Agent – “As a bank operations analyst, I want to create an AI agent that automatically summarizes our daily transaction reports, so that I can quickly get insights without reading the entire report.”

- Details: This user will use the visual flow designer to create a flow that takes a transaction report (possibly from an internal system), then feeds it to an LLM for summarization. The value is that each morning, instead of spending an hour reading the report, they get an instant summary and can drill down on anomalies. They care that this agent is easy to set up and accurate in summarization.

## Story 2

- Customer Support Rep Uses a Pre-Built Agent – “As a customer support representative, I want to use an AI assistant that can instantly answer my questions about our bank’s policies and products, so that I can give quick and accurate information to customers on calls.”

- Details: Here the user might not build the flow themselves; an expert team or admin might provide a “Policies Q&A bot” flow. The rep logs into the platform or a simplified UI for the bot, asks a question (e.g., “What’s the maximum daily mobile deposit?"), and the agent (which might have a vector store of policy documents) returns the answer. The user’s need is quick info retrieval. This story emphasizes the need for a searchable knowledge base integration and a simple question-answer interface for the end user.

## Story 3

- Compliance Officer Audits the AI Usage – “As a compliance officer, I want to review the logs of AI agent interactions to ensure no confidential customer data is being improperly used or leaked, so that I can certify the platform’s compliance with regulations.”

- Details: This involves the compliance user accessing the audit logs or reports. They might run queries like “show me all prompts that contain account numbers” or just spot-check some flows. They could also ensure that certain keywords (like SSNs or customer names) are not appearing in places they shouldn’t. Their requirement leads to features around log filtering, possibly an interface to replay a conversation if needed. This story ensures the platform has transparency for oversight.

## Story 4

- IT Administrator Manages Users and Components – “As the platform administrator, I want to onboard new users (or new departments) and control what components are available, so that the platform usage stays secure and organized.”

- Details: The admin might create a new department workspace when a new group wants to join, assign some users to that department, and perhaps import a set of custom components (e.g., a connector to a new internal API) for that department’s use. They might also revoke access if someone leaves the company. The admin ensures that, for instance, only the compliance department has access to a special “Regulatory DB Lookup” tool node. This story underscores the user management and configurability from the admin side.

## Story 5

- Developer Integrates a Flow into an Application – “As a developer in the bank’s IT team, I want to call the AI flow for generating investment summaries from our internal web app, so that end-users of that app can get AI-generated summaries without leaving the app interface.”

- Details: This story covers the external integration scenario. The developer will take a flow that perhaps a financial research team built on the platform and use the provided API to call it from another system (maybe an intranet portal where employees view investment research). They will use the API keys and endpoints provided by the platform, likely writing a script or using the requests library as guided. The requirement here ensures that the platform’s API is robust, secure (the developer might need to register an application or get a token with proper scope), and that performance is sufficient to embed in real-time applications.

## Story 6

- Iterating and Improving an AI Agent – “As a product manager in the bank’s digital team, I want to continually refine the AI chatbot we built for internal IT support, so that it improves over time with our feedback and new knowledge.”

- Details: This user uses the platform not just for one-and-done creation but as an iterative tool. They look at conversation logs, see where the chatbot gave unsatisfactory answers, and then adjust the flow (maybe add new example prompts or incorporate a new data source). They might run A/B tests using different versions of the flow (if platform supports multi-version). This requires features like version control, copying flows, or even an experimentation sandbox. It highlights the need for the platform to support continuous improvement rather than static flows.

# Appendix

## Glossary

- LLM (Large Language Model): An AI model (like OpenAI’s GPT series) that can understand and generate human-like text. In this platform, LLMs are used as components that provide the “brains” for tasks like summarization, Q&A, etc.
- Flow/Agent: In Langflow context, a “flow” is a sequence of connected components forming an AI-driven application. Sometimes referred to as an “agent” if it involves an autonomous process using the flows (especially if it has the ability to decide actions, e.g., use tools).
- Langflow: An open-source UI/framework for building AI workflows on top of LangChain. It provides the interface and runtime that our platform is using as its foundation. We are customizing and deploying this for our internal use.
- Component: A building block in the flow designer (could be an input, an LLM, a tool like a database lookup, or output). Components have parameters that can be configured. Langflow comes with many built-in components (wrappers for LangChain’s primitives like Chains, Tools, Memory, etc.).
- Vector Store: A database specialized for similarity search (stores embeddings of text). Used when we need to give the AI agent knowledge of a set of documents – the text is converted to vectors and stored, and at query time the relevant pieces are fetched. E.g., Pinecone or FAISS could be vector stores.
- RBAC: Role-Based Access Control. A method to restrict system access to authorized users based on roles. In our platform, RBAC ensures only certain roles can perform admin actions or see certain data.
- AWS: Amazon Web Services – the cloud platform where this system runs. AWS services referenced include S3 (storage), RDS (managed PostgreSQL database), EKS or ECS (for containers), API Gateway (for exposing APIs securely), etc.
- GLBA: Gramm-Leach-Bliley Act, a U.S. regulation requiring financial institutions to explain how they share and protect their customers’ private information. Relevant because our platform must ensure any customer data is protected.
- Flow JSON: Langflow allows exporting a designed flow as a JSON file, which contains all the components and their configuration. This can be used to import the flow elsewhere or for version control.

## References

- Langflow Documentation and GitHub – provided insights into the capabilities of the base system (e.g., visual builder, API endpoints, security features) which our platform builds upon
- Internal Bank Policy Documents – used to derive compliance and security requirements (not publicly cited, but for context).
- AWS Well-Architected Framework – guidance followed for ensuring security, reliability, and performance in the AWS deployment (implied in non-functional requirements).
- Banking Regulations (GLBA, SOX, etc.) – to ensure features like audit logging, data encryption meet these standards (implied throughout the requirements).
