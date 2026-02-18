---
name: inception
description: >
  Creates or updates the Architecture Inception Canvas (AIC).
  Use when the user asks to "create an inception canvas", "architecture inception",
  "document architecture goals", "AIC", or mentions inception canvas or arc42 inception.
---

# Architecture Inception Canvas

## Instructions

Create or update the Architecture Inception Canvas (AIC) for this project.
$ARGUMENTS

## Templates

Use [templates/architecture-inception-canvas.md](templates/architecture-inception-canvas.md) as the AIC document structure.

## Workflow

1. Read any existing documents:
    - `docs/vision.md` (if exists)
    - `docs/inception/architecture-inception-canvas.md` (if exists)
2. Use the project context above (if provided) as starting point
3. If context is missing or incomplete, guide the user through the 8 sections organized around 3 key questions:

### GOALS: What should the software do?

- **Business Case**: Why does this initiative exist? Economic rationale?
- **Functional Overview**: What's on the product box? Key capabilities?
- **Quality Goals**: Top 3 quality attributes (performance, security, usability, etc.)?

### SOLUTION: How can we achieve it?

- **Business Context**: External systems, users, communication pathways?
- **Organisational Constraints**: Time, budget, methodology, policies?
- **Technical Constraints**: Mandated technologies, standards, governance?
- **Architectural Hypotheses**: Key assumptions and decisions to validate?

### ASSESSMENT: How do we evaluate the situation?

- **Challenges and Risks**: Known technical challenges? Emerging risks?

4. Create/update `docs/inception/architecture-inception-canvas.md` using the AIC template

## Reference

See: https://canvas.arc42.org/architecture-inception-canvas

## DO NOT

- Include implementation details (focus on architecture-level decisions)
- Skip sections — all 8 sections should be addressed, even if briefly
- Invent constraints or risks the user hasn't mentioned — ask instead
