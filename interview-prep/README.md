# PowerShell project interview preparation

This repository uses PowerShell to explore automation scenarios commonly associated with Python DevOps scripting. These are interview-style prompts, not claims about any company's exact interview loop.

## Microsoft-oriented questions

1. How would you use PowerShell to automate a customer deployment while preserving auditability and rollback?
2. How would you model API responses as objects and validate them before changing Azure resources?
3. How would you design a secure Azure and CI/CD automation workflow using identity instead of embedded secrets?
4. How would you package shared automation so multiple teams can consume it without breaking changes?
5. How would you collect monitoring evidence and communicate an incident to technical and non-technical stakeholders?
6. How would you use `-WhatIf`, approvals, policy, and change records for production remediation?
7. How would you make a script portable across Windows, Linux, GitHub Actions, and Azure DevOps?
8. How would you measure whether automation improved customer delivery outcomes?

## MAANG-oriented questions

1. Design a resilient API automation layer with concurrency limits, retries, idempotency, and backpressure.
2. How would you compare object-based PowerShell automation with a Python service for a high-volume platform?
3. How would you test, version, deploy, and observe hundreds of automation workflows?
4. How would you prevent duplicate execution when a pipeline retries after a network timeout?
5. How would you design a health-reporting system that handles partial failures and stale data?
6. How would you build compliance remediation that is safe, explainable, and reversible?
7. How would you model dependencies between cloud resources and workflow stages?
8. What are the cost, latency, availability, security, and operational trade-offs in your design?

## Project mapping

- **API automation:** response validation, pagination, retries, rate limits, and authentication.
- **Cloud provisioning:** Azure CLI, `-WhatIf`, identity, exit codes, and resource state.
- **CI/CD orchestration:** release metadata, pipeline contracts, artifacts, and approvals.
- **Monitoring and reporting:** diagnostics, telemetry, incident evidence, and trends.
- **Compliance and remediation:** baselines, drift, audit trails, and governance.

## Strong answer checklist

Start with requirements and scale. Then explain data flow, interfaces, security, failure handling, observability, testing, deployment, and operational ownership. Tie the design back to customer impact.
