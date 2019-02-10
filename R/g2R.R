#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
g2_R <- function(data, width = NULL, height = NULL, elementId = NULL) {

  data = data %>%
    toJSON(dataframe = "rows", pretty = TRUE)

  # forward options using x
  x = list(
    data = data,
    options = NULL
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'g2R',
    x,
    width = width,
    height = height,
    package = 'g2R',
    elementId = elementId
  )
}

#' Shiny bindings for g2R
#'
#' Output and render functions for using g2R within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a g2R
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name g2R-shiny
#'
#' @export
g2ROutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'g2R', width, height, package = 'g2R')
}

#' @rdname g2R-shiny
#' @export
renderG2R <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, g2ROutput, env, quoted = TRUE)
}



