#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
g2_interact <- function(g2, action = NULL, type = NULL) {

  g2$x$interact$action <- action
  g2$x$interact$type <- type

  return(g2)
}
