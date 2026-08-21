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
2. What is a Python module?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
3. What is a package?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
4. How do you create a virtual environment?
**Answer:** Keep environment-specific values outside reusable logic, validate them at the boundary, and provide safe defaults only where appropriate.
5. How do you install dependencies from a requirements file?
**Answer:** Use structured filesystem APIs, validate paths, quote inputs, handle missing resources deliberately, and avoid unsafe traversal or shell expansion.
6. What is the difference between a list and a tuple?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
7. What is a dictionary?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
8. How do you iterate over a dictionary?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
9. What is a set useful for?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
10. What is a string slice?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
11. What is a function?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
12. How do default function arguments work?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
13. What is a keyword argument?
**Answer:** Keep the value in a protected secret store or workload identity, pass it at runtime, redact it from logs, and never commit it to source control.
14. What is an exception?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
15. How do `try` and `except` work?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
16. Why should exceptions not be silently ignored?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
17. What is a context manager?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
18. How do you read a text file safely?
**Answer:** Use structured filesystem APIs, validate paths, quote inputs, handle missing resources deliberately, and avoid unsafe traversal or shell expansion.
19. How do you write JSON in Python?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
20. How do you parse JSON?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
21. What is `pathlib` used for?
**Answer:** Use structured filesystem APIs, validate paths, quote inputs, handle missing resources deliberately, and avoid unsafe traversal or shell expansion.
22. How do you read environment variables?
**Answer:** Keep environment-specific values outside reusable logic, validate them at the boundary, and provide safe defaults only where appropriate.
23. Why should credentials not be hardcoded?
**Answer:** Keep the value in a protected secret store or workload identity, pass it at runtime, redact it from logs, and never commit it to source control.
24. How do you invoke a subprocess?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
25. What is the difference between `subprocess.run` and `os.system`?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
26. How do you capture command output?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
27. What is logging?
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.
28. Why use logging instead of print statements?
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.
29. What is a type hint?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
30. What does a docstring provide?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
31. How do you compare two versions of a string?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
32. How do you validate a required argument?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
33. What is `argparse`?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
34. How do you create a command-line script?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
35. What is a unit test?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
36. What is pytest?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
37. What is mocking?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
38. What is a return code?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
39. How do you make a script exit nonzero on failure?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
40. How do you format Python code consistently?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.

## Intermediate: 41-80

41. How do you design a reusable automation module?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
42. How do you separate configuration from code?
**Answer:** Keep environment-specific values outside reusable logic, validate them at the boundary, and provide safe defaults only where appropriate.
43. How do you load layered configuration?
**Answer:** Keep environment-specific values outside reusable logic, validate them at the boundary, and provide safe defaults only where appropriate.
44. How do dataclasses help automation code?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
45. How do you validate input with Pydantic?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
46. How do you call a REST API with `requests`?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
47. How do you set an HTTP timeout?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
48. How do you handle HTTP retryable responses?
**Answer:** Retry only transient failures, use bounded exponential backoff with jitter, and return the final error when the retry budget is exhausted.
49. What is exponential backoff?
**Answer:** Retry only transient failures, use bounded exponential backoff with jitter, and return the final error when the retry budget is exhausted.
50. How do you handle API pagination?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
51. How do you handle rate limits?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
52. How do you authenticate an API securely?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
53. How do you redact secrets from logs?
**Answer:** Keep the value in a protected secret store or workload identity, pass it at runtime, redact it from logs, and never commit it to source control.
54. How do you upload a file through an API?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
55. How do you handle malformed JSON responses?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
56. How do you create a custom exception hierarchy?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
57. How do you use structured logging?
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.
58. What is correlation ID propagation?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
59. How do you make a script idempotent?
**Answer:** Make the operation converge on the declared state and check the current state before mutating it, so a second run produces no unnecessary change.
60. How do you detect whether a cloud resource already exists?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
61. How do you use Azure SDK clients?
**Answer:** Use provider-native identity with least privilege, explicit environment boundaries, tagging, policy controls, and repeatable infrastructure definitions.
62. How do you use boto3 safely?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
63. How do you handle paginated cloud SDK responses?
**Answer:** Use provider-native identity with least privilege, explicit environment boundaries, tagging, policy controls, and repeatable infrastructure definitions.
64. How do you implement a dry-run mode?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
65. What does `concurrent.futures` provide?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
66. When is threading suitable for automation?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
67. When is multiprocessing suitable?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
68. How do you limit concurrency?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
69. How do you implement a worker queue?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
70. How do you handle partial failures in parallel work?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
71. How do you write a context-managed temporary directory?
**Answer:** Use structured filesystem APIs, validate paths, quote inputs, handle missing resources deliberately, and avoid unsafe traversal or shell expansion.
72. How do you stream a large file instead of loading it all?
**Answer:** Use structured filesystem APIs, validate paths, quote inputs, handle missing resources deliberately, and avoid unsafe traversal or shell expansion.
73. How do you hash and verify an artifact?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
74. How do you parse CSV data safely?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
75. How do you compare desired and actual state?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
76. How do you make a CLI composable in CI?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
77. How do you test API failures with mocks?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
78. How do you use pytest fixtures?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
79. How do you publish coverage in CI?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
80. How do you package a Python CLI?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.

## Advanced: 81-120

81. Design a Python service that orchestrates multi-cloud deployments.
**Answer:** Separate validation, build, promotion, and verification; use immutable artifacts, protected production controls, and an observable rollback path.
82. How do you design provider-neutral interfaces?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
83. How do you isolate Azure and AWS SDK dependencies?
**Answer:** Use provider-native identity with least privilege, explicit environment boundaries, tagging, policy controls, and repeatable infrastructure definitions.
84. How do you implement bounded retries with jitter?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
85. How do you distinguish transient and permanent errors?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
86. How do you guarantee idempotence across eventually consistent APIs?
**Answer:** Make the operation converge on the declared state and check the current state before mutating it, so a second run produces no unnecessary change.
87. How do you implement a reconciliation loop?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
88. How do you make reconciliation observable?
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.
89. How do you prevent duplicate concurrent runs?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
90. How do you implement distributed locking?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
91. How do you design safe cancellation and cleanup?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
92. How do you handle partial success across 1,000 resources?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
93. How do you design a resumable batch job?
**Answer:** Separate validation, build, promotion, and verification; use immutable artifacts, protected production controls, and an observable rollback path.
94. How do you store checkpoints safely?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
95. How do you protect cloud credentials with workload identity?
**Answer:** Keep the value in a protected secret store or workload identity, pass it at runtime, redact it from logs, and never commit it to source control.
96. How do you implement OIDC authentication in a pipeline?
**Answer:** Separate validation, build, promotion, and verification; use immutable artifacts, protected production controls, and an observable rollback path.
97. How do you scan Python dependencies for vulnerabilities?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
98. How do you generate and consume an SBOM?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
99. How do you prevent command injection in subprocess calls?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
100. How do you protect against unsafe deserialization?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
101. How do you design a secure plugin system?
**Answer:** Apply least privilege, isolate trust boundaries, validate policy in CI or admission, and record auditable changes.
102. How do you profile a slow automation job?
**Answer:** Check a meaningful dependency or application endpoint, fail the operation when the check fails, and use the result to stop or roll back promotion.
103. How do you manage memory for large API responses?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
104. How do async I/O and `asyncio` help API automation?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
105. How do you cap async concurrency?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
106. How do you instrument Python with OpenTelemetry?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
107. How do you expose metrics for job duration and failures?
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.
108. How do you design health and readiness endpoints?
**Answer:** Check a meaningful dependency or application endpoint, fail the operation when the check fails, and use the result to stop or roll back promotion.
109. How do you test cloud integrations without real accounts?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
110. How do contract tests improve API automation?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
111. How do you build a release pipeline for a Python package?
**Answer:** Separate validation, build, promotion, and verification; use immutable artifacts, protected production controls, and an observable rollback path.
112. How do you make builds reproducible?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
113. How do you pin and update dependencies safely?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
114. How do you handle backward-compatible CLI changes?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
115. How do you design disaster recovery for automation state?
**Answer:** Keep the previous known-good version, validate the replacement, and automate a tested rollback or restore path with clear ownership and audit output.
116. How do you implement audit logging with tamper resistance?
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.
117. How do you enforce timeouts at every integration boundary?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
118. How do you operate a Python worker under systemd or Kubernetes?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
119. How do you investigate a production memory leak?
**Answer:** A strong answer should define the concept, show a small Python implementation, explain failure behavior, and describe how it would be tested in CI.
120. Design a secure, observable, resumable Python DevOps automation platform.
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.

## HackerRank-Style Python Challenges: 121-150

121. Count log levels in a list of records.
**Answer:** Parse the input into structured records, use a map or counter for aggregation, sort only when ranking is required, and test empty, duplicate, and boundary inputs.
122. Return the first duplicate deployment ID.
**Answer:** Parse the input into structured records, use a map or counter for aggregation, sort only when ranking is required, and test empty, duplicate, and boundary inputs.
123. Merge overlapping maintenance windows.
**Answer:** Parse the input into structured records, use a map or counter for aggregation, sort only when ranking is required, and test empty, duplicate, and boundary inputs.
124. Group hosts by environment from JSON input.
**Answer:** Parse the input into structured records, use a map or counter for aggregation, sort only when ranking is required, and test empty, duplicate, and boundary inputs.
125. Return the top three error codes by frequency.
**Answer:** Parse the input into structured records, use a map or counter for aggregation, sort only when ranking is required, and test empty, duplicate, and boundary inputs.
126. Validate a required `--environment` CLI argument.
**Answer:** Parse with the platform's structured data tool, validate required fields and types at the boundary, and return a clear nonzero failure for malformed input.
127. Normalize JSON into stable sorted output.
**Answer:** Parse with the platform's structured data tool, validate required fields and types at the boundary, and return a clear nonzero failure for malformed input.
128. Reject CSV rows missing required columns.
**Answer:** Parse with the platform's structured data tool, validate required fields and types at the boundary, and return a clear nonzero failure for malformed input.
129. Implement a retry decorator with exponential backoff.
**Answer:** Retry only transient failures with a bounded exponential backoff, enforce a timeout, and return the original failure after the retry budget is exhausted.
130. Wrap a subprocess call with a timeout.
**Answer:** Retry only transient failures with a bounded exponential backoff, enforce a timeout, and return the original failure after the retry budget is exhausted.
131. Follow pagination links in an API client.
**Answer:** Use explicit authentication, timeouts, status handling, pagination, rate-limit handling, and structured response validation; never place credentials in source.
132. Handle HTTP 429 using `Retry-After`.
**Answer:** Retry only transient failures with a bounded exponential backoff, enforce a timeout, and return the original failure after the retry budget is exhausted.
133. Calculate a SHA-256 file checksum.
**Answer:** Verify the expected digest before use and reject absolute paths or .. traversal entries before extracting or writing files.
134. Extract an archive while blocking path traversal.
**Answer:** Verify the expected digest before use and reject absolute paths or .. traversal entries before extracting or writing files.
135. Compare desired and actual resource dictionaries.
**Answer:** Express the desired state with typed inputs, stable addresses, policy validation, protected state, and a reviewed plan before apply.
136. Limit active API calls in a concurrent worker.
**Answer:** Use a bounded worker pool, collect each success and exception separately, and fail the operation when the defined error threshold is exceeded.
137. Separate successful results from exceptions.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Python.
138. Build a resumable batch processor with checkpoints.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Python.
139. Reject shell metacharacters in a subprocess wrapper.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Python.
140. Load configuration with environment overrides.
**Answer:** Parse with the platform's structured data tool, validate required fields and types at the boundary, and return a clear nonzero failure for malformed input.
141. Model a deployment request with Pydantic.
**Answer:** Deploy an immutable version, run a health or smoke check, promote only on success, and invoke a tested rollback while preserving the failure in logs.
142. Test timeout, retry, and malformed-response paths with pytest.
**Answer:** Retry only transient failures with a bounded exponential backoff, enforce a timeout, and return the original failure after the retry budget is exhausted.
143. Mock Azure SDK resource creation and test idempotence.
**Answer:** Use explicit authentication, timeouts, status handling, pagination, rate-limit handling, and structured response validation; never place credentials in source.
144. Mock boto3 and test missing-resource handling.
**Answer:** Test the happy path, invalid input, timeout, retry exhaustion, and partial failure with mocks for external systems and an assertion on the final result.
145. Emit structured JSON logs with a correlation ID.
**Answer:** Parse with the platform's structured data tool, validate required fields and types at the boundary, and return a clear nonzero failure for malformed input.
146. Convert exceptions into stable exit codes.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Python.
147. Cap async client concurrency with a semaphore.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Python.
148. Report dependency status from a health endpoint.
**Answer:** Deploy an immutable version, run a health or smoke check, promote only on success, and invoke a tested rollback while preserving the failure in logs.
149. Emit duration and failure metrics.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for Python.
150. Build a tested, safe, resumable, observable deployment CLI.
**Answer:** Test the happy path, invalid input, timeout, retry exhaustion, and partial failure with mocks for external systems and an assertion on the final result.

## Executable Answers

- [Beginner answers](interview-answers/beginner.py): counting records and validating CLI input.
- [Intermediate answers](interview-answers/intermediate.py): retry and interval merging.
- [Advanced answers](interview-answers/advanced.py): health-gated deployment and rollback.
