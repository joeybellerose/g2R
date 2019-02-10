#' Charting Functions
#'
#' <Add Description>
#'
#' @references \url{https://www.yuque.com/antv/g2-docs/api-chart}
#'
#'
#'
#' @import htmlwidgets
#'
#' @export
g2_chart <- function(g2, forcefit = "true", width = 500, height = 500, animate = TRUE, theme = "default", renderer = "canvas") {

  g2$x$chart$forcefit <- forcefit
  g2$x$chart$width <- width
  g2$x$chart$height <- height
  g2$x$chart$animate <- animate
  g2$x$chart$theme <- theme
  g2$x$chart$renderer <- renderer

  return(g2)
}
