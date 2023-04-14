# Solidity Exercises

This repository contains code examples from [Smart Contract Programmer](https://www.youtube.com/@smartcontractprogrammer) youtube channel.

The code examples are living in `src` directory. Each source file only covers one topic. Tests for each topic are covered in `test` directory.

## Run Tests

You need to install [foundry-rs](https://github.com/foundry-rs/foundry) to run tests.

```bash
# Run all tests with logs
forge test -vvvv

# Run tests for a single contract: ArrayShift
forge test --match-contract ArrayShift -vvvv
```
