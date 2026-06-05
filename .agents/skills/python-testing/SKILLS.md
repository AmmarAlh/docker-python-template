---
name: python-testing
description: Use for pytest tests, fixtures, mocking, and improving testability in Python projects.
---

# Python Testing

Use for testing and testability tasks.

Rules:
- Use pytest
- Test behavior, not implementation details
- Cover success, edge, and failure cases
- Prefer fixtures for reusable setup
- Mock only external boundaries
- Keep tests deterministic and readable

If code is hard to test:
- separate logic from I/O
- inject dependencies
- reduce shared state