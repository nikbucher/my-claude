---
name: my-requirements
description: >
  Gathers, organizes, and documents software requirements into structured
  catalogs with functional requirements (user stories), non-functional
  requirements (measurable quality attributes), and constraints. Use when
  the user asks to "write requirements", "create a PRD", "gather requirements",
  "document feature specs", "write user stories", "define NFRs", "list
  constraints", or mentions requirements catalog, requirements analysis,
  product requirements document, or feature specification.
---

# Requirements

## Instructions

Create or update the requirements catalog at `docs/requirements.md` based on `docs/vision.md`.
The document contains functional requirements, non-functional requirements and constraints.

## DO NOT

- Mix requirement types in a single section
- Skip the user story format for functional requirements
- Use duplicate IDs across requirement types
- Leave the Status field empty

## Requirement Types

### Functional Requirements (FR)

Define what the system should do. Always use the user story format:

**Format:** As a [role], I want [goal] so that [benefit].

```markdown
### FR-001: Create Task

**Priority**: High | **Status**: Open

As a project manager, I want to create tasks so that I can track work items.

**Acceptance Criteria:**

- Task is persisted with title, description, and creation timestamp
- Missing title produces a validation error
- Created task appears in the task list immediately


### FR-002: Assign Task

**Priority**: High | **Status**: Open

As a project manager, I want to assign tasks to team members so that work is distributed.

**Acceptance Criteria:**

- Task can be assigned to any active team member
- Assigned member receives a notification
- Task list shows the assignee


### FR-003: Filter Tasks

**Priority**: Medium | **Status**: Open

As a team member, I want to filter tasks by status so that I can focus on relevant items.

**Acceptance Criteria:**

- Filter options include all valid status values
- Filtering is instant (client-side)
- Active filters are visible and clearable
```

### Non-Functional Requirements (NFR)

Define quality attributes. Must be measurable.

```markdown
### NFR-001: Response Time

**Priority**: High | **Category**: Performance | **Status**: Open

All page loads must complete within 2 seconds.

**Acceptance Criteria:**

- 95th percentile response time < 2s with 100 concurrent users
- No request exceeds 5s timeout

### NFR-002: Availability

**Priority**: High | **Category**: Availability | **Status**: Open

System must maintain 99.9% uptime during business hours.

**Acceptance Criteria:**

- Uptime measured over rolling 30-day window
- Planned maintenance windows excluded from calculation

### NFR-003: Concurrent Users

**Priority**: Medium | **Category**: Scalability | **Status**: Open

System must support 100 concurrent users without degradation.

**Acceptance Criteria:**

- Response times stay within NFR-001 thresholds at 100 concurrent users
- No errors under sustained load for 1 hour

### NFR-004: Data Encryption

**Priority**: High | **Category**: Security | **Status**: Open

All data in transit must use TLS 1.3 encryption.

**Acceptance Criteria:**

- TLS 1.3 enforced on all endpoints
- TLS 1.2 and below rejected
```

### Constraints (C)

Define limitations and boundaries imposed on the solution.

| ID    | Title             | Constraint                                                       | Category  | Priority | Status |
|-------|-------------------|------------------------------------------------------------------|-----------|----------|--------|
| C-001 | Runtime Platform  | Backend must run on Java 21 LTS.                                 | Technical | High     | Open   |
| C-002 | Database Platform | System must use PostgreSQL 16.                                   | Technical | High     | Open   |
| C-003 | Browser Support   | UI must support Chrome, Firefox, and Safari (latest 2 versions). | Technical | High     | Open   |
| C-004 | Budget Limit      | Total development cost must not exceed $50,000.                  | Business  | High     | Open   |
| C-005 | Deadline          | System must be production-ready by Q2 2025.                      | Schedule  | High     | Open   |

## Reference

See [REFERENCE.md](REFERENCE.md) for ID prefixes, priority levels, status values, NFR categories, and constraint categories.

## Requirement Quality Checks

Every requirement must pass these checks before finalizing:

| Check       | Rule                                 | Bad Example                          | Good Example                  |
|-------------|--------------------------------------|--------------------------------------|-------------------------------|
| Measurable  | NFRs must have a number or threshold | "System should be fast"              | "Pages load within 2 seconds" |
| Singular    | One requirement per H3 section       | "System must log in and export data" | Split into FR-001 and FR-002  |
| Unambiguous | No subjective terms                  | "User-friendly interface"            | "WCAG 2.1 AA compliant"       |
| Testable    | Can write a pass/fail test           | "System is reliable"                 | "99.9% uptime over 30 days"   |
| Unique IDs  | No duplicate IDs across all sections | Two FR-001 entries                   | Each ID used exactly once     |

## Error Recovery

- **Incomplete source document**: List what is missing (roles, NFR categories, constraints) and ask the user to clarify
  before proceeding
- **Ambiguous requirement from user**: Rewrite it as a measurable requirement and ask the user to confirm the threshold
- **Conflicting requirements**: Flag the conflict explicitly (e.g., "FR-003 requires real-time sync but C-002 limits to batch processing") and ask the user to resolve
- **Missing stakeholder roles**: Default to generic roles (User, Admin, System) and note them for user review

## Workflow

1. Read the vision document or project brief
2. Use TodoWrite to create tasks for each requirement type
3. Write the document header
4. For functional requirements:
    - Identify user roles
    - Define user stories with clear goals and benefits
    - Add testable acceptance criteria
    - Assign priorities based on business value
5. For non-functional requirements:
    - Define measurable quality attributes
    - Categorize by NFR type
    - Ensure requirements are testable
6. For constraints:
    - Document technical and business limitations
    - Categorize by constraint type
7. Validate: run every requirement against the quality checks table above
    - No duplicate IDs across all sections
    - All Status fields filled
    - All user stories follow "As a [role], I want [goal] so that [benefit]"
    - All NFRs contain a measurable threshold
8. Mark todos complete
