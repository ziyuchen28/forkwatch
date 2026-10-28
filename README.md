# forkwatch

**A process watch for tracking thread and memory growth.**

`forkwatch` collects process metrics over time and combines them with runtime-specific diagnostics. The goal is to make it easier to investigate resource growth and leaks across different kinds of processes.

The current implementation focuses on **Maven Surefire test JVMs on macOS**, combining native process metrics with `jcmd`, `vmmap`, and JFR diagnostics.
