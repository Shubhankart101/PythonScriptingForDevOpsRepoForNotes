# Python for DevOps Interview Question Bank

This bank contains 120 questions organized by difficulty, with Python automation, APIs, cloud operations, CI/CD, and reliability scenarios.

## Beginner: 1-40

1. Why is Python useful in DevOps?
2. What is a Python module?
3. What is a package?
4. How do you create a virtual environment?
5. How do you install dependencies from a requirements file?
6. What is the difference between a list and a tuple?
7. What is a dictionary?
8. How do you iterate over a dictionary?
9. What is a set useful for?
10. What is a string slice?
11. What is a function?
12. How do default function arguments work?
13. What is a keyword argument?
14. What is an exception?
15. How do `try` and `except` work?
16. Why should exceptions not be silently ignored?
17. What is a context manager?
18. How do you read a text file safely?
19. How do you write JSON in Python?
20. How do you parse JSON?
21. What is `pathlib` used for?
22. How do you read environment variables?
23. Why should credentials not be hardcoded?
24. How do you invoke a subprocess?
25. What is the difference between `subprocess.run` and `os.system`?
26. How do you capture command output?
27. What is logging?
28. Why use logging instead of print statements?
29. What is a type hint?
30. What does a docstring provide?
31. How do you compare two versions of a string?
32. How do you validate a required argument?
33. What is `argparse`?
34. How do you create a command-line script?
35. What is a unit test?
36. What is pytest?
37. What is mocking?
38. What is a return code?
39. How do you make a script exit nonzero on failure?
40. How do you format Python code consistently?

## Intermediate: 41-80

41. How do you design a reusable automation module?
42. How do you separate configuration from code?
43. How do you load layered configuration?
44. How do dataclasses help automation code?
45. How do you validate input with Pydantic?
46. How do you call a REST API with `requests`?
47. How do you set an HTTP timeout?
48. How do you handle HTTP retryable responses?
49. What is exponential backoff?
50. How do you handle API pagination?
51. How do you handle rate limits?
52. How do you authenticate an API securely?
53. How do you redact secrets from logs?
54. How do you upload a file through an API?
55. How do you handle malformed JSON responses?
56. How do you create a custom exception hierarchy?
57. How do you use structured logging?
58. What is correlation ID propagation?
59. How do you make a script idempotent?
60. How do you detect whether a cloud resource already exists?
61. How do you use Azure SDK clients?
62. How do you use boto3 safely?
63. How do you handle paginated cloud SDK responses?
64. How do you implement a dry-run mode?
65. What does `concurrent.futures` provide?
66. When is threading suitable for automation?
67. When is multiprocessing suitable?
68. How do you limit concurrency?
69. How do you implement a worker queue?
70. How do you handle partial failures in parallel work?
71. How do you write a context-managed temporary directory?
72. How do you stream a large file instead of loading it all?
73. How do you hash and verify an artifact?
74. How do you parse CSV data safely?
75. How do you compare desired and actual state?
76. How do you make a CLI composable in CI?
77. How do you test API failures with mocks?
78. How do you use pytest fixtures?
79. How do you publish coverage in CI?
80. How do you package a Python CLI?

## Advanced: 81-120

81. Design a Python service that orchestrates multi-cloud deployments.
82. How do you design provider-neutral interfaces?
83. How do you isolate Azure and AWS SDK dependencies?
84. How do you implement bounded retries with jitter?
85. How do you distinguish transient and permanent errors?
86. How do you guarantee idempotence across eventually consistent APIs?
87. How do you implement a reconciliation loop?
88. How do you make reconciliation observable?
89. How do you prevent duplicate concurrent runs?
90. How do you implement distributed locking?
91. How do you design safe cancellation and cleanup?
92. How do you handle partial success across 1,000 resources?
93. How do you design a resumable batch job?
94. How do you store checkpoints safely?
95. How do you protect cloud credentials with workload identity?
96. How do you implement OIDC authentication in a pipeline?
97. How do you scan Python dependencies for vulnerabilities?
98. How do you generate and consume an SBOM?
99. How do you prevent command injection in subprocess calls?
100. How do you protect against unsafe deserialization?
101. How do you design a secure plugin system?
102. How do you profile a slow automation job?
103. How do you manage memory for large API responses?
104. How do async I/O and `asyncio` help API automation?
105. How do you cap async concurrency?
106. How do you instrument Python with OpenTelemetry?
107. How do you expose metrics for job duration and failures?
108. How do you design health and readiness endpoints?
109. How do you test cloud integrations without real accounts?
110. How do contract tests improve API automation?
111. How do you build a release pipeline for a Python package?
112. How do you make builds reproducible?
113. How do you pin and update dependencies safely?
114. How do you handle backward-compatible CLI changes?
115. How do you design disaster recovery for automation state?
116. How do you implement audit logging with tamper resistance?
117. How do you enforce timeouts at every integration boundary?
118. How do you operate a Python worker under systemd or Kubernetes?
119. How do you investigate a production memory leak?
120. Design a secure, observable, resumable Python DevOps automation platform.
