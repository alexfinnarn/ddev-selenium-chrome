[![tests](https://github.com/drud/ddev-addon-template/actions/workflows/tests.yml/badge.svg)](https://github.com/drud/ddev-addon-template/actions/workflows/tests.yml) ![project is maintained](https://img.shields.io/maintenance/yes/2022.svg)

# DDEV Selenium Chrome Driver

This add-on will create a container with the Chrome webdriver and Selenium running. It is intended to be a general
purpose add-on, but it might shift to being only Drupal-specific in order to run functional JS tests the way DrupalCI
wants them to be run.

## Installation

You can install this add-on...

```bash
ddev get alexfinnarn/ddev-selenium-chrome
```

## Usage

You can use this addon to:
- [Run functional JS tests in your project](#running-drupal-functional-js-tests)

### Running Drupal Functional JS Tests

This add-on was originally created to run Drupal Functional JS tests.
The `Drupal\FunctionalJavascriptTests\WebDriverTestBase` class expects to be able to connect to...making this up but...a
Selenium instance typically running on port `4444`.

Steps:

1. Understand the different Drupal tests to make sure you need to run a functional test. These tests are slower than the
   lower-level tests: link-to-test-docs
2. ...

## Contributions

Contributions are welcome! Please see the [contributing guidelines](CONTRIBUTING.md) for more information.

## More Advanced Stuff

Note that more advanced techniques are discussed
in [DDEV docs](https://ddev.readthedocs.io/en/latest/users/extend/additional-services/#additional-service-configurations-and-add-ons-for-ddev)
.

## Contribution Credits

**Contributed and maintained by [@CONTRIBUTOR](https://github.com/CONTRIBUTOR) based on the
original [ddev-contrib recipe](https://github.com/drud/ddev-contrib/tree/master/docker-compose-services/RECIPE)
by [@CONTRIBUTOR](https://github.com/CONTRIBUTOR)**
