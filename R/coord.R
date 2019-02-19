#' <Add Title>
#'
#' <Add Description>
#'
#' @param type The type of coordinate system.
#' \itemize{
#'  \item{"rect"}
#'  \item{"polar"}
#'  \item{"theta"}
#'  \item{"helix"}
#'  \item{"map"}
#'  \item{"gauge"}
#'  \item{"clock"}
#' }
#' @param cfg
#' @param rotate
#' @param scale
#' @param reflect
#' @param transpose Logical to swap x and y axes
#'
#' @examples
#' iris %>%
#'g2_R() %>%
#'  g2_chart(theme = "dark") %>%
#'  g2_coord(type = "polar", reflect = c("reflect", "x"), transpose = "transpose", scale = c("scale", 1, -1), rotate = c("rotate", 90)) %>%
#'  g2_geom(
#'    x = Sepal.Width,
#'    y = Sepal.Length,
#'    type = "interval",
#'    color = Species,
#'    adjust = c("stack")
#'  )
#'
#' @references \url{https://www.yuque.com/antv/g2-docs/api-chart#ufv0rv}
#'
#' @import htmlwidgets
#'
#' @export
g2_coord <- function(g2, type = "rect", cfg = NULL, rotate = NULL, scale = NULL, reflect = NULL, transpose = FALSE, name = NULL) {

  # g2$x$coord$type <- type
  # g2$x$coord$rotate <- rotate
  # g2$x$coord$scale <- scale
  # g2$x$coord$reflect <- reflect
  # g2$x$coord$transpose <- transpose

  coord_opts <- list(
    "type" = type,
    "cfg" = cfg,
    "actions" = list(
      if(transpose == TRUE) {
        list("transpose")
      },
      rotate,
      scale,
      reflect
    )
  )

  # Remove all attributes with NULL
  coord_opts$actions <- coord_opts$actions[!sapply(coord_opts$actions, is.null)]
  coord_opts <- coord_opts[!sapply(coord_opts, is.null)]



  # If opts list doesn't exist create it
  # Otherwise append to existing list
  if(!is.null(name) && is.null(g2$x$view[[name]])) {
    g2$x$view[[name]]$options <- list("coord" = coord_opts)
  } else if(!is.null(name) && !is.null(g2$x$view[[name]])) {
    g2$x$view[[name]]$options$coord <- append(g2$x$view[[name]]$options$coord, coord_opts)
  }
  if(is.null(g2$x$options$coord)) {
    g2$x$options$coord <- coord_opts
  } else {
    g2$x$options$coord <- append(g2$x$options$coord, coord_opts)
  }

  return(g2)
}
