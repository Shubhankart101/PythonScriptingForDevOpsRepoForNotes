# Python for DevOps Interview Question Bank

This bank contains 150 questions organized by difficulty, with Python automation, APIs, cloud operations, CI/CD, and reliability scenarios.

## Worked Answers

### Beginner: count structured records

**Question:** How do you count log levels?

```python
from collections import Counter

def count_levels(records: list[dict]) -> dict[str, int]:
	return dict(Counter(record['level'] for record in records))
```

The function returns data rather than printing it, making it easy to test and compose.

### Intermediate: merge maintenance windows

**Question:** How do you merge overlapping intervals?

```python
def merge_windows(windows: list[tuple[int, int]]) -> list[tuple[int, int]]:
	merged: list[list[int]] = []
	for start, end in sorted(windows):
		if not merged or start > merged[-1][1]:
			merged.append([start, end])
		else:
			merged[-1][1] = max(merged[-1][1], end)
	return [tuple(window) for window in merged]
```

Sorting gives $O(n log n)$ complexity; the merge pass is linear.

### Advanced: health-gated deployment

**Question:** How do you return a rollback result without hiding the original failure?

```python
def deploy(release, deploy_fn, health_fn, rollback_fn):
	deploy_fn(release)
	try:
		if not health_fn(release):
			raise RuntimeError('health check failed')
		return {'release': release, 'status': 'succeeded'}
	except Exception as error:
		rollback_fn(release)
		return {'release': release, 'status': 'rolled-back', 'error': str(error)}
```

The result is structured for CI or observability while rollback remains explicit.

## Beginner: 1-40

1. Why is Python useful in DevOps?
**Answer:** It addresses a recurring DevOps need by making delivery, operations, or infrastructure repeatable, reviewable, and safer to automate.
Script: [Question 1 script](interview-scripts/001-why-is-python-useful-in-devops.py)
2. What is a Python module?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 2 script](interview-scripts/002-what-is-a-python-module.py)
3. What is a package?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 3 script](interview-scripts/003-what-is-a-package.py)
4. How do you create a virtual environment?
**Answer:** Keep environment-specific values outside reusable logic, validate them at the boundary, and provide safe defaults only where appropriate.
Script: [Question 4 script](interview-scripts/004-how-do-you-create-a-virtual-environment.py)
5. How do you install dependencies from a requirements file?
**Answer:** Use structured filesystem APIs, validate paths, quote inputs, handle missing resources deliberately, and avoid unsafe traversal or shell expansion.
Script: [Question 5 script](interview-scripts/005-how-do-you-install-dependencies-from-a-requirements-fil.py)
6. What is the difference between a list and a tuple?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 6 script](interview-scripts/006-what-is-the-difference-between-a-list-and-a-tuple.py)
7. What is a dictionary?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 7 script](interview-scripts/007-what-is-a-dictionary.py)
8. How do you iterate over a dictionary?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 8 script](interview-scripts/008-how-do-you-iterate-over-a-dictionary.py)
9. What is a set useful for?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 9 script](interview-scripts/009-what-is-a-set-useful-for.py)
10. What is a string slice?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 10 script](interview-scripts/010-what-is-a-string-slice.py)
11. What is a function?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
Script: [Question 11 script](interview-scripts/011-what-is-a-function.py)
12. How do default function arguments work?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
Script: [Question 12 script](interview-scripts/012-how-do-default-function-arguments-work.py)
13. What is a keyword argument?
**Answer:** Keep the value in a protected secret store or workload identity, pass it at runtime, redact it from logs, and never commit it to source control.
Script: [Question 13 script](interview-scripts/013-what-is-a-keyword-argument.py)
14. What is an exception?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 14 script](interview-scripts/014-what-is-an-exception.py)
15. How do `try` and `except` work?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 15 script](interview-scripts/015-how-do-try-and-except-work.py)
16. Why should exceptions not be silently ignored?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 16 script](interview-scripts/016-why-should-exceptions-not-be-silently-ignored.py)
17. What is a context manager?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 17 script](interview-scripts/017-what-is-a-context-manager.py)
18. How do you read a text file safely?
**Answer:** Use structured filesystem APIs, validate paths, quote inputs, handle missing resources deliberately, and avoid unsafe traversal or shell expansion.
Script: [Question 18 script](interview-scripts/018-how-do-you-read-a-text-file-safely.py)
19. How do you write JSON in Python?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
Script: [Question 19 script](interview-scripts/019-how-do-you-write-json-in-python.py)
20. How do you parse JSON?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
Script: [Question 20 script](interview-scripts/020-how-do-you-parse-json.py)
21. What is `pathlib` used for?
**Answer:** Use structured filesystem APIs, validate paths, quote inputs, handle missing resources deliberately, and avoid unsafe traversal or shell expansion.
Script: [Question 21 script](interview-scripts/021-what-is-pathlib-used-for.py)
22. How do you read environment variables?
**Answer:** Keep environment-specific values outside reusable logic, validate them at the boundary, and provide safe defaults only where appropriate.
Script: [Question 22 script](interview-scripts/022-how-do-you-read-environment-variables.py)
23. Why should credentials not be hardcoded?
**Answer:** Keep the value in a protected secret store or workload identity, pass it at runtime, redact it from logs, and never commit it to source control.
Script: [Question 23 script](interview-scripts/023-why-should-credentials-not-be-hardcoded.py)
24. How do you invoke a subprocess?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
Script: [Question 24 script](interview-scripts/024-how-do-you-invoke-a-subprocess.py)
25. What is the difference between `subprocess.run` and `os.system`?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
Script: [Question 25 script](interview-scripts/025-what-is-the-difference-between-subprocess-run-and-os-sy.py)
26. How do you capture command output?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
Script: [Question 26 script](interview-scripts/026-how-do-you-capture-command-output.py)
27. What is logging?
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.
Script: [Question 27 script](interview-scripts/027-what-is-logging.py)
28. Why use logging instead of print statements?
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.
Script: [Question 28 script](interview-scripts/028-why-use-logging-instead-of-print-statements.py)
29. What is a type hint?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 29 script](interview-scripts/029-what-is-a-type-hint.py)
30. What does a docstring provide?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 30 script](interview-scripts/030-what-does-a-docstring-provide.py)
31. How do you compare two versions of a string?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 31 script](interview-scripts/031-how-do-you-compare-two-versions-of-a-string.py)
32. How do you validate a required argument?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
Script: [Question 32 script](interview-scripts/032-how-do-you-validate-a-required-argument.py)
33. What is `argparse`?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 33 script](interview-scripts/033-what-is-argparse.py)
34. How do you create a command-line script?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
Script: [Question 34 script](interview-scripts/034-how-do-you-create-a-command-line-script.py)
35. What is a unit test?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
Script: [Question 35 script](interview-scripts/035-what-is-a-unit-test.py)
36. What is pytest?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
Script: [Question 36 script](interview-scripts/036-what-is-pytest.py)
37. What is mocking?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 37 script](interview-scripts/037-what-is-mocking.py)
38. What is a return code?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 38 script](interview-scripts/038-what-is-a-return-code.py)
39. How do you make a script exit nonzero on failure?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
Script: [Question 39 script](interview-scripts/039-how-do-you-make-a-script-exit-nonzero-on-failure.py)
40. How do you format Python code consistently?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 40 script](interview-scripts/040-how-do-you-format-python-code-consistently.py)

## Intermediate: 41-80

41. How do you design a reusable automation module?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 41 script](interview-scripts/041-how-do-you-design-a-reusable-automation-module.py)
42. How do you separate configuration from code?
**Answer:** Keep environment-specific values outside reusable logic, validate them at the boundary, and provide safe defaults only where appropriate.
Script: [Question 42 script](interview-scripts/042-how-do-you-separate-configuration-from-code.py)
43. How do you load layered configuration?
**Answer:** Keep environment-specific values outside reusable logic, validate them at the boundary, and provide safe defaults only where appropriate.
Script: [Question 43 script](interview-scripts/043-how-do-you-load-layered-configuration.py)
44. How do dataclasses help automation code?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 44 script](interview-scripts/044-how-do-dataclasses-help-automation-code.py)
45. How do you validate input with Pydantic?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
Script: [Question 45 script](interview-scripts/045-how-do-you-validate-input-with-pydantic.py)
46. How do you call a REST API with `requests`?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
Script: [Question 46 script](interview-scripts/046-how-do-you-call-a-rest-api-with-requests.py)
47. How do you set an HTTP timeout?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
Script: [Question 47 script](interview-scripts/047-how-do-you-set-an-http-timeout.py)
48. How do you handle HTTP retryable responses?
**Answer:** Retry only transient failures, use bounded exponential backoff with jitter, and return the final error when the retry budget is exhausted.
Script: [Question 48 script](interview-scripts/048-how-do-you-handle-http-retryable-responses.py)
49. What is exponential backoff?
**Answer:** Retry only transient failures, use bounded exponential backoff with jitter, and return the final error when the retry budget is exhausted.
Script: [Question 49 script](interview-scripts/049-what-is-exponential-backoff.py)
50. How do you handle API pagination?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
Script: [Question 50 script](interview-scripts/050-how-do-you-handle-api-pagination.py)
51. How do you handle rate limits?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
Script: [Question 51 script](interview-scripts/051-how-do-you-handle-rate-limits.py)
52. How do you authenticate an API securely?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
Script: [Question 52 script](interview-scripts/052-how-do-you-authenticate-an-api-securely.py)
53. How do you redact secrets from logs?
**Answer:** Keep the value in a protected secret store or workload identity, pass it at runtime, redact it from logs, and never commit it to source control.
Script: [Question 53 script](interview-scripts/053-how-do-you-redact-secrets-from-logs.py)
54. How do you upload a file through an API?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
Script: [Question 54 script](interview-scripts/054-how-do-you-upload-a-file-through-an-api.py)
55. How do you handle malformed JSON responses?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
Script: [Question 55 script](interview-scripts/055-how-do-you-handle-malformed-json-responses.py)
56. How do you create a custom exception hierarchy?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 56 script](interview-scripts/056-how-do-you-create-a-custom-exception-hierarchy.py)
57. How do you use structured logging?
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.
Script: [Question 57 script](interview-scripts/057-how-do-you-use-structured-logging.py)
58. What is correlation ID propagation?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 58 script](interview-scripts/058-what-is-correlation-id-propagation.py)
59. How do you make a script idempotent?
**Answer:** Make the operation converge on the declared state and check the current state before mutating it, so a second run produces no unnecessary change.
Script: [Question 59 script](interview-scripts/059-how-do-you-make-a-script-idempotent.py)
60. How do you detect whether a cloud resource already exists?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
Script: [Question 60 script](interview-scripts/060-how-do-you-detect-whether-a-cloud-resource-already-exis.py)
61. How do you use Azure SDK clients?
**Answer:** Use provider-native identity with least privilege, explicit environment boundaries, tagging, policy controls, and repeatable infrastructure definitions.
Script: [Question 61 script](interview-scripts/061-how-do-you-use-azure-sdk-clients.py)
62. How do you use boto3 safely?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 62 script](interview-scripts/062-how-do-you-use-boto3-safely.py)
63. How do you handle paginated cloud SDK responses?
**Answer:** Use provider-native identity with least privilege, explicit environment boundaries, tagging, policy controls, and repeatable infrastructure definitions.
Script: [Question 63 script](interview-scripts/063-how-do-you-handle-paginated-cloud-sdk-responses.py)
64. How do you implement a dry-run mode?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 64 script](interview-scripts/064-how-do-you-implement-a-dry-run-mode.py)
65. What does `concurrent.futures` provide?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
Script: [Question 65 script](interview-scripts/065-what-does-concurrent-futures-provide.py)
66. When is threading suitable for automation?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 66 script](interview-scripts/066-when-is-threading-suitable-for-automation.py)
67. When is multiprocessing suitable?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 67 script](interview-scripts/067-when-is-multiprocessing-suitable.py)
68. How do you limit concurrency?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
Script: [Question 68 script](interview-scripts/068-how-do-you-limit-concurrency.py)
69. How do you implement a worker queue?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 69 script](interview-scripts/069-how-do-you-implement-a-worker-queue.py)
70. How do you handle partial failures in parallel work?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
Script: [Question 70 script](interview-scripts/070-how-do-you-handle-partial-failures-in-parallel-work.py)
71. How do you write a context-managed temporary directory?
**Answer:** Use structured filesystem APIs, validate paths, quote inputs, handle missing resources deliberately, and avoid unsafe traversal or shell expansion.
Script: [Question 71 script](interview-scripts/071-how-do-you-write-a-context-managed-temporary-directory.py)
72. How do you stream a large file instead of loading it all?
**Answer:** Use structured filesystem APIs, validate paths, quote inputs, handle missing resources deliberately, and avoid unsafe traversal or shell expansion.
Script: [Question 72 script](interview-scripts/072-how-do-you-stream-a-large-file-instead-of-loading-it-al.py)
73. How do you hash and verify an artifact?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 73 script](interview-scripts/073-how-do-you-hash-and-verify-an-artifact.py)
74. How do you parse CSV data safely?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 74 script](interview-scripts/074-how-do-you-parse-csv-data-safely.py)
75. How do you compare desired and actual state?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 75 script](interview-scripts/075-how-do-you-compare-desired-and-actual-state.py)
76. How do you make a CLI composable in CI?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 76 script](interview-scripts/076-how-do-you-make-a-cli-composable-in-ci.py)
77. How do you test API failures with mocks?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
Script: [Question 77 script](interview-scripts/077-how-do-you-test-api-failures-with-mocks.py)
78. How do you use pytest fixtures?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
Script: [Question 78 script](interview-scripts/078-how-do-you-use-pytest-fixtures.py)
79. How do you publish coverage in CI?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 79 script](interview-scripts/079-how-do-you-publish-coverage-in-ci.py)
80. How do you package a Python CLI?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 80 script](interview-scripts/080-how-do-you-package-a-python-cli.py)

## Advanced: 81-120

81. Design a Python service that orchestrates multi-cloud deployments.
**Answer:** Separate validation, build, promotion, and verification; use immutable artifacts, protected production controls, and an observable rollback path.
Script: [Question 81 script](interview-scripts/081-design-a-python-service-that-orchestrates-multi-cloud-d.py)
82. How do you design provider-neutral interfaces?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 82 script](interview-scripts/082-how-do-you-design-provider-neutral-interfaces.py)
83. How do you isolate Azure and AWS SDK dependencies?
**Answer:** Use provider-native identity with least privilege, explicit environment boundaries, tagging, policy controls, and repeatable infrastructure definitions.
Script: [Question 83 script](interview-scripts/083-how-do-you-isolate-azure-and-aws-sdk-dependencies.py)
84. How do you implement bounded retries with jitter?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 84 script](interview-scripts/084-how-do-you-implement-bounded-retries-with-jitter.py)
85. How do you distinguish transient and permanent errors?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 85 script](interview-scripts/085-how-do-you-distinguish-transient-and-permanent-errors.py)
86. How do you guarantee idempotence across eventually consistent APIs?
**Answer:** Make the operation converge on the declared state and check the current state before mutating it, so a second run produces no unnecessary change.
Script: [Question 86 script](interview-scripts/086-how-do-you-guarantee-idempotence-across-eventually-cons.py)
87. How do you implement a reconciliation loop?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 87 script](interview-scripts/087-how-do-you-implement-a-reconciliation-loop.py)
88. How do you make reconciliation observable?
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.
Script: [Question 88 script](interview-scripts/088-how-do-you-make-reconciliation-observable.py)
89. How do you prevent duplicate concurrent runs?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
Script: [Question 89 script](interview-scripts/089-how-do-you-prevent-duplicate-concurrent-runs.py)
90. How do you implement distributed locking?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 90 script](interview-scripts/090-how-do-you-implement-distributed-locking.py)
91. How do you design safe cancellation and cleanup?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 91 script](interview-scripts/091-how-do-you-design-safe-cancellation-and-cleanup.py)
92. How do you handle partial success across 1,000 resources?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
Script: [Question 92 script](interview-scripts/092-how-do-you-handle-partial-success-across-1-000-resource.py)
93. How do you design a resumable batch job?
**Answer:** Separate validation, build, promotion, and verification; use immutable artifacts, protected production controls, and an observable rollback path.
Script: [Question 93 script](interview-scripts/093-how-do-you-design-a-resumable-batch-job.py)
94. How do you store checkpoints safely?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 94 script](interview-scripts/094-how-do-you-store-checkpoints-safely.py)
95. How do you protect cloud credentials with workload identity?
**Answer:** Keep the value in a protected secret store or workload identity, pass it at runtime, redact it from logs, and never commit it to source control.
Script: [Question 95 script](interview-scripts/095-how-do-you-protect-cloud-credentials-with-workload-iden.py)
96. How do you implement OIDC authentication in a pipeline?
**Answer:** Separate validation, build, promotion, and verification; use immutable artifacts, protected production controls, and an observable rollback path.
Script: [Question 96 script](interview-scripts/096-how-do-you-implement-oidc-authentication-in-a-pipeline.py)
97. How do you scan Python dependencies for vulnerabilities?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 97 script](interview-scripts/097-how-do-you-scan-python-dependencies-for-vulnerabilities.py)
98. How do you generate and consume an SBOM?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 98 script](interview-scripts/098-how-do-you-generate-and-consume-an-sbom.py)
99. How do you prevent command injection in subprocess calls?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
Script: [Question 99 script](interview-scripts/099-how-do-you-prevent-command-injection-in-subprocess-call.py)
100. How do you protect against unsafe deserialization?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
Script: [Question 100 script](interview-scripts/100-how-do-you-protect-against-unsafe-deserialization.py)
101. How do you design a secure plugin system?
**Answer:** Apply least privilege, isolate trust boundaries, validate policy in CI or admission, and record auditable changes.
Script: [Question 101 script](interview-scripts/101-how-do-you-design-a-secure-plugin-system.py)
102. How do you profile a slow automation job?
**Answer:** Check a meaningful dependency or application endpoint, fail the operation when the check fails, and use the result to stop or roll back promotion.
Script: [Question 102 script](interview-scripts/102-how-do-you-profile-a-slow-automation-job.py)
103. How do you manage memory for large API responses?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
Script: [Question 103 script](interview-scripts/103-how-do-you-manage-memory-for-large-api-responses.py)
104. How do async I/O and `asyncio` help API automation?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
Script: [Question 104 script](interview-scripts/104-how-do-async-i-o-and-asyncio-help-api-automation.py)
105. How do you cap async concurrency?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
Script: [Question 105 script](interview-scripts/105-how-do-you-cap-async-concurrency.py)
106. How do you instrument Python with OpenTelemetry?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 106 script](interview-scripts/106-how-do-you-instrument-python-with-opentelemetry.py)
107. How do you expose metrics for job duration and failures?
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.
Script: [Question 107 script](interview-scripts/107-how-do-you-expose-metrics-for-job-duration-and-failures.py)
108. How do you design health and readiness endpoints?
**Answer:** Check a meaningful dependency or application endpoint, fail the operation when the check fails, and use the result to stop or roll back promotion.
Script: [Question 108 script](interview-scripts/108-how-do-you-design-health-and-readiness-endpoints.py)
109. How do you test cloud integrations without real accounts?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
Script: [Question 109 script](interview-scripts/109-how-do-you-test-cloud-integrations-without-real-account.py)
110. How do contract tests improve API automation?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
Script: [Question 110 script](interview-scripts/110-how-do-contract-tests-improve-api-automation.py)
111. How do you build a release pipeline for a Python package?
**Answer:** Separate validation, build, promotion, and verification; use immutable artifacts, protected production controls, and an observable rollback path.
Script: [Question 111 script](interview-scripts/111-how-do-you-build-a-release-pipeline-for-a-python-packag.py)
112. How do you make builds reproducible?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 112 script](interview-scripts/112-how-do-you-make-builds-reproducible.py)
113. How do you pin and update dependencies safely?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 113 script](interview-scripts/113-how-do-you-pin-and-update-dependencies-safely.py)
114. How do you handle backward-compatible CLI changes?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 114 script](interview-scripts/114-how-do-you-handle-backward-compatible-cli-changes.py)
115. How do you design disaster recovery for automation state?
**Answer:** Keep the previous known-good version, validate the replacement, and automate a tested rollback or restore path with clear ownership and audit output.
Script: [Question 115 script](interview-scripts/115-how-do-you-design-disaster-recovery-for-automation-stat.py)
116. How do you implement audit logging with tamper resistance?
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.
Script: [Question 116 script](interview-scripts/116-how-do-you-implement-audit-logging-with-tamper-resistan.py)
117. How do you enforce timeouts at every integration boundary?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 117 script](interview-scripts/117-how-do-you-enforce-timeouts-at-every-integration-bounda.py)
118. How do you operate a Python worker under systemd or Kubernetes?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 118 script](interview-scripts/118-how-do-you-operate-a-python-worker-under-systemd-or-kub.py)
119. How do you investigate a production memory leak?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 119 script](interview-scripts/119-how-do-you-investigate-a-production-memory-leak.py)
120. Design a secure, observable, resumable Python DevOps automation platform.
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.
Script: [Question 120 script](interview-scripts/120-design-a-secure-observable-resumable-python-devops-auto.py)

## HackerRank-Style Python Challenges: 121-150

121. Count log levels in a list of records.
**Answer:** Parse the input into structured records, use a map or counter for aggregation, sort only when ranking is required, and test empty, duplicate, and boundary inputs.
Script: [Question 121 script](interview-scripts/121-count-log-levels-in-a-list-of-records.py)
122. Return the first duplicate deployment ID.
**Answer:** Parse the input into structured records, use a map or counter for aggregation, sort only when ranking is required, and test empty, duplicate, and boundary inputs.
Script: [Question 122 script](interview-scripts/122-return-the-first-duplicate-deployment-id.py)
123. Merge overlapping maintenance windows.
**Answer:** Parse the input into structured records, use a map or counter for aggregation, sort only when ranking is required, and test empty, duplicate, and boundary inputs.
Script: [Question 123 script](interview-scripts/123-merge-overlapping-maintenance-windows.py)
124. Group hosts by environment from JSON input.
**Answer:** Parse the input into structured records, use a map or counter for aggregation, sort only when ranking is required, and test empty, duplicate, and boundary inputs.
Script: [Question 124 script](interview-scripts/124-group-hosts-by-environment-from-json-input.py)
125. Return the top three error codes by frequency.
**Answer:** Parse the input into structured records, use a map or counter for aggregation, sort only when ranking is required, and test empty, duplicate, and boundary inputs.
Script: [Question 125 script](interview-scripts/125-return-the-top-three-error-codes-by-frequency.py)
126. Validate a required `--environment` CLI argument.
**Answer:** Parse with the platform's structured data tool, validate required fields and types at the boundary, and return a clear nonzero failure for malformed input.
Script: [Question 126 script](interview-scripts/126-validate-a-required-environment-cli-argument.py)
127. Normalize JSON into stable sorted output.
**Answer:** Parse with the platform's structured data tool, validate required fields and types at the boundary, and return a clear nonzero failure for malformed input.
Script: [Question 127 script](interview-scripts/127-normalize-json-into-stable-sorted-output.py)
128. Reject CSV rows missing required columns.
**Answer:** Parse with the platform's structured data tool, validate required fields and types at the boundary, and return a clear nonzero failure for malformed input.
Script: [Question 128 script](interview-scripts/128-reject-csv-rows-missing-required-columns.py)
129. Implement a retry decorator with exponential backoff.
**Answer:** Retry only transient failures with a bounded exponential backoff, enforce a timeout, and return the original failure after the retry budget is exhausted.
Script: [Question 129 script](interview-scripts/129-implement-a-retry-decorator-with-exponential-backoff.py)
130. Wrap a subprocess call with a timeout.
**Answer:** Retry only transient failures with a bounded exponential backoff, enforce a timeout, and return the original failure after the retry budget is exhausted.
Script: [Question 130 script](interview-scripts/130-wrap-a-subprocess-call-with-a-timeout.py)
131. Follow pagination links in an API client.
**Answer:** Use explicit authentication, timeouts, status handling, pagination, rate-limit handling, and structured response validation; never place credentials in source.
Script: [Question 131 script](interview-scripts/131-follow-pagination-links-in-an-api-client.py)
132. Handle HTTP 429 using `Retry-After`.
**Answer:** Retry only transient failures with a bounded exponential backoff, enforce a timeout, and return the original failure after the retry budget is exhausted.
Script: [Question 132 script](interview-scripts/132-handle-http-429-using-retry-after.py)
133. Calculate a SHA-256 file checksum.
**Answer:** Verify the expected digest before use and reject absolute paths or .. traversal entries before extracting or writing files.
Script: [Question 133 script](interview-scripts/133-calculate-a-sha-256-file-checksum.py)
134. Extract an archive while blocking path traversal.
**Answer:** Verify the expected digest before use and reject absolute paths or .. traversal entries before extracting or writing files.
Script: [Question 134 script](interview-scripts/134-extract-an-archive-while-blocking-path-traversal.py)
135. Compare desired and actual resource dictionaries.
**Answer:** Express the desired state with typed inputs, stable addresses, policy validation, protected state, and a reviewed plan before apply.
Script: [Question 135 script](interview-scripts/135-compare-desired-and-actual-resource-dictionaries.py)
136. Limit active API calls in a concurrent worker.
**Answer:** Use a bounded worker pool, collect each success and exception separately, and fail the operation when the defined error threshold is exceeded.
Script: [Question 136 script](interview-scripts/136-limit-active-api-calls-in-a-concurrent-worker.py)
137. Separate successful results from exceptions.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Python.
Script: [Question 137 script](interview-scripts/137-separate-successful-results-from-exceptions.py)
138. Build a resumable batch processor with checkpoints.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Python.
Script: [Question 138 script](interview-scripts/138-build-a-resumable-batch-processor-with-checkpoints.py)
139. Reject shell metacharacters in a subprocess wrapper.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Python.
Script: [Question 139 script](interview-scripts/139-reject-shell-metacharacters-in-a-subprocess-wrapper.py)
140. Load configuration with environment overrides.
**Answer:** Parse with the platform's structured data tool, validate required fields and types at the boundary, and return a clear nonzero failure for malformed input.
Script: [Question 140 script](interview-scripts/140-load-configuration-with-environment-overrides.py)
141. Model a deployment request with Pydantic.
**Answer:** Deploy an immutable version, run a health or smoke check, promote only on success, and invoke a tested rollback while preserving the failure in logs.
Script: [Question 141 script](interview-scripts/141-model-a-deployment-request-with-pydantic.py)
142. Test timeout, retry, and malformed-response paths with pytest.
**Answer:** Retry only transient failures with a bounded exponential backoff, enforce a timeout, and return the original failure after the retry budget is exhausted.
Script: [Question 142 script](interview-scripts/142-test-timeout-retry-and-malformed-response-paths-with-py.py)
143. Mock Azure SDK resource creation and test idempotence.
**Answer:** Use explicit authentication, timeouts, status handling, pagination, rate-limit handling, and structured response validation; never place credentials in source.
Script: [Question 143 script](interview-scripts/143-mock-azure-sdk-resource-creation-and-test-idempotence.py)
144. Mock boto3 and test missing-resource handling.
**Answer:** Test the happy path, invalid input, timeout, retry exhaustion, and partial failure with mocks for external systems and an assertion on the final result.
Script: [Question 144 script](interview-scripts/144-mock-boto3-and-test-missing-resource-handling.py)
145. Emit structured JSON logs with a correlation ID.
**Answer:** Parse with the platform's structured data tool, validate required fields and types at the boundary, and return a clear nonzero failure for malformed input.
Script: [Question 145 script](interview-scripts/145-emit-structured-json-logs-with-a-correlation-id.py)
146. Convert exceptions into stable exit codes.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Python.
Script: [Question 146 script](interview-scripts/146-convert-exceptions-into-stable-exit-codes.py)
147. Cap async client concurrency with a semaphore.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Python.
Script: [Question 147 script](interview-scripts/147-cap-async-client-concurrency-with-a-semaphore.py)
148. Report dependency status from a health endpoint.
**Answer:** Deploy an immutable version, run a health or smoke check, promote only on success, and invoke a tested rollback while preserving the failure in logs.
Script: [Question 148 script](interview-scripts/148-report-dependency-status-from-a-health-endpoint.py)
149. Emit duration and failure metrics.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Python.
Script: [Question 149 script](interview-scripts/149-emit-duration-and-failure-metrics.py)
150. Build a tested, safe, resumable, observable deployment CLI.
**Answer:** Test the happy path, invalid input, timeout, retry exhaustion, and partial failure with mocks for external systems and an assertion on the final result.
Script: [Question 150 script](interview-scripts/150-build-a-tested-safe-resumable-observable-deployment-cli.py)

## Executable Answers

- [Beginner answers](interview-answers/beginner.py): counting records and validating CLI input.
- [Intermediate answers](interview-answers/intermediate.py): retry and interval merging.
- [Advanced answers](interview-answers/advanced.py): health-gated deployment and rollback.
