#' A Hello World Shiny app
#'
#' @import shiny
#' @importFrom graphics plot
#' @importFrom utils head
#' @export
helloWorldApp <- function() {
  utils::data(cars)
  shinyApp(
    ui = fluidPage(
      sliderInput("n", "n", 1, nrow(cars), 10),
      plotOutput("plot")
    ),
    server = function(input, output) {
      output$plot <- renderPlot({
        plot(head(cars, input$n), xlim = range(cars[[1]]), ylim = range(cars[[2]]))
      })
    }
  )
}


# This is needed to make R CMD check happy
globalVariables("cars")
