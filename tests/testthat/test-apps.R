context("apps")
# This file is for testing the applications in the apps/ directory.

library(shinytest)

test_that("helloWorldApp() works", {
  # Use compareImages=FALSE because the expected image screenshots were created
  # on a Mac, and they will differ from screenshots taken on the CI platform,
  # which runs on Linux.
  expect_pass(testApp("apps/helloworld/", compareImages = FALSE))
})
