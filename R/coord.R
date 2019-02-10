#' <Add Title>
#'
#' <Add Description>
#'
#' @param coord The type of coordinate system.  Options are c("rect", "polar", "theta", "helix")
#'
#' @references \url{https://www.yuque.com/antv/g2-docs/api-chart#ufv0rv}
#'
#' @import htmlwidgets
#'
#' @export
g2_coord <- function(g2, type = "rect", cfg = NULL, rotate = NULL, scale = NULL, reflect = NULL, transpose = NULL) {

  # g2$x$coord$type <- type
  # g2$x$coord$rotate <- rotate
  # g2$x$coord$scale <- scale
  # g2$x$coord$reflect <- reflect
  # g2$x$coord$transpose <- transpose

  coord_opts <- list(
    "type" = type,
    "cfg" = cfg,
    "actions" = list(
      transpose, # TODO: Fix this
      rotate,
      scale,
      reflect
    )
  )


c("type" = "one")

  # Remove all attributes with NULL
  coord_opts$actions <- coord_opts$actions[!sapply(coord_opts$actions, is.null)]
  coord_opts <- coord_opts[!sapply(coord_opts, is.null)]



  # If opts list doesn't exist create it
  # Otherwise append to existing list
  if(is.null(g2$x$options$coord)) {
    g2$x$options$coord <- coord_opts
  } else {
    g2$x$options$coord <- append(g2$x$options$coord, coord_opts)
  }

  print(g2$x$options %>% toJSON(pretty = TRUE))
  # g2$x$coord <- coord_opts

  return(g2)
}
