# forkwatch

A process monitor for tracking thread and memory growth, collecting OS-level thread and memory metrics.

Currently supports **Maven Surefire JVMs on macOS**, alongside JVM heap information and JFR thread-creation stacks.

## Build

```bash
(windows not supported yet)
make build
```

## Usage

```bash
./build/jvm_profiler \
    --interval-ms 1000 \
    --jvm-summary-secs 15 \
    --vmmap-summary-secs 30
```

Then run Maven tests in another terminal.

Forkwatch automatically discovers Surefire JVMs and monitors their thread counts, RSS, heap usage, and memory mappings. It also captures JFR thread-start events to help identify thread leaks.

Press `Ctrl+C` to stop, or let it exit automatically after the test JVMs finish.

## Output

Results are written to `tmp/`:

```text
tmp/jvm_prof-YYYYMMDD-HHMMSS/
    pid12345.csv
    pid12345/
        jfr_threadstart.txt
```

The CSV contains timestamped process metrics; the JFR output contains thread-creation stack traces.

## Status

macOS JVM monitoring is implemented. Linux and other process types are planned.
