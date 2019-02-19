#' <Add Title>
#'
#' <Add Description>
#' @param g2
#' @param name Text name of the view
#'
#' @examples
#' iris %>%
#' g2_R() %>%
#'  g2_chart(theme = "dark") %>%
#'  g2_view(name = "test") %>%
#'  g2_coord(type = "polar", name = "test") %>%
#'  g2_geom(
#'    name = "test",
#'    x = Sepal.Width,
#'    y = Sepal.Length,
#'    type = "interval",
#'    color = Species,
#'    adjust = c("stack"),
#'    opacity = Sepal.Length
#'  ) %>%
#'  g2_view(name = "test2") %>%
#'  g2_coord(type = "helix", name = "test2") %>%
#'  g2_geom(
#'    name = "test2",
#'    x = Sepal.Width,
#'    y = Sepal.Length,
#'    type = "point",
#'    color = Species,
#'    adjust = c("jitter"),
#'    opacity = Sepal.Length,
#'  )
#'
#' @import htmlwidgets
#'
#' @export
g2_view <- function(g2, name) {

  g2$x$view[[name]] <- list()



  return(g2)
}
