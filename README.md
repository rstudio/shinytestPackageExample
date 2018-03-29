[![Travis build status](https://travis-ci.org/rstudio/shinytestPackageExample.svg?branch=master)](https://travis-ci.org/rstudio/shinytestPackageExample)

Shinytest example package
=========================

This is an example R package which uses [shinytest](https://github.com/rstudio/shinytest) to test an application which is created by a function, instead of being in an app.R or ui.R/server.R. For more information, see https://rstudio.github.io/shinytest/package.html.

In this package, there is a function named [`helloWorldApp()`](https://github.com/rstudio/shinytestPackageExample/blob/master/R/helloworld.R), which returns a Shiny app object.

To use shinytest to test the application, the key is to add an app.R file that simply calls the function, and then use shinytest on that app.R. You can see the example application [here](https://github.com/rstudio/shinytestPackageExample/blob/master/tests/testthat/apps/helloworld/app.R).

The other steps you need to do are:

* Add a test script which runs `testApp()` on the application. This package has [tests/testthat/test-apps.R](https://github.com/rstudio/shinytestPackageExample/blob/master/tests/testthat/test-apps.R) to run the tests.
* In the DESCRIPTION file, add `shinytest` to the `Suggests:` field.

We also suggest that you do the following:

* If you will submit the package to CRAN, configure the application tests to **not** run on the CRAN build servers. If you are using testthat, use `skip_on_cran()` in the test block, as in the example.
* You can also use Travis for continuous integration. Note that until shinytest is available on CRAN, you will also need to edit the DESCRIPTION file and add a `Remotes` field with a `rstudio/shinytest` entry.
* If you will be testing the package on multiple different platforms, then when calling `testApp()`, use `compareImages = FALSE`. This is because the the screenshots on will likely have small differences across different platforms, and result in spurious test failures.
