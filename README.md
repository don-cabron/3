# 3
## Homework 3 | 14.09.2021

## _This script can help you get information about your connections._

## Usage

To run program you should execute script with arguments:

- PID or name of process
- Count of output string

```sh
sudo sh ./script.sh Telegram 1
```

## Examples

| Input | Output|
| ----- | ----- |
| Telegram 1| RIPE Network Coordination Centre (RIPE)| 
| firefox | Amazon Technologies Inc. (AT-88-Z) |

## Arguments

If no arguments are provided script uses '-' and 10 by default.
First argument can be an integer number (process PID) or string (process name).
Second argument must be an integer number.