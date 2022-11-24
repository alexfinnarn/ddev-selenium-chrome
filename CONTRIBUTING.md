# Contributing to the project

...

## Writing Tests

The tests are set up using the BATS testing framework. 

### Running Tests

There is a GitHub Action workflow that runs the tests on every push to the repository. 

It does several things to set up the environment and run the tests:
- Sets up bats-core
- Sets up the ddev testing matrix
- Runs the tests

You can also run the tests locally by running the following command:

```bash
bats tests
```
