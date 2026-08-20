# PowerShell Automation for DevOps Projects

PowerShell-only reference notes for the automation tasks commonly associated with Python DevOps tooling: APIs, cloud operations, CI/CD, monitoring, compliance, and reporting.

## Learning path

| Level | Focus | Start here |
| --- | --- | --- |
| Beginner | Objects, JSON, files, functions, and errors | [beginner/01-objects-and-json](beginner/01-objects-and-json) |
| Intermediate | REST APIs, modules, pipeline metadata, and parallel jobs | [intermediate/01-rest-and-retry](intermediate/01-rest-and-retry) |
| Advanced | Production modules, Azure automation, observability, and quality gates | [advanced/01-production-toolkit](advanced/01-production-toolkit) |

## Project use cases

- [API automation](projects/api-automation)
- [Cloud provisioning](projects/cloud-provisioning)
- [CI/CD orchestration](projects/cicd-orchestration)
- [Monitoring and reporting](projects/monitoring-reporting)
- [Compliance and remediation](projects/compliance-remediation)

The daily use-case index is refreshed at **7:00 AM IST** by [update-use-cases.yml](.github/workflows/update-use-cases.yml).

Read the current daily rotation in [projects/DAILY_USE_CASES.md](projects/DAILY_USE_CASES.md).

Prepare with [PowerShell project interview questions](interview-prep/README.md) covering Microsoft customer delivery and MAANG-scale automation design.

## Safety rules

- Use `Set-StrictMode -Version Latest` and `$ErrorActionPreference = 'Stop'`.
- Use `-WhatIf` for resource changes.
- Never hardcode credentials, tokens, or connection strings.
- Prefer managed identity, environment variables, and protected pipeline secrets.
- Validate scripts with the PowerShell parser, PSScriptAnalyzer, and Pester.