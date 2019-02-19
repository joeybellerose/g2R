#' Geom
#'
#' \code{g2_geom} adds geometries to chart
#'
#' @param x,y Column names for determining position
#' @param type Text name of geometry desired
#' @param color Column name/text for desired color
#' @param adjust Text to change geometry placement.
#' \itemize{
#'  \item{"dodge"}
#'  \item{"jitter"}
#'  \item{"stack"}
#'  \item{"symmetric"}
#' }
#' @param shape Column name/text to determing shape type.  Varies by geom type
#' @param size Column name/number to change size
#' @param opacity Column name/number between 0-1
#' @param tootip
#' @param label
#' @param style
#' @param select
#' @param active
#'
#' @examples
#' iris %>%
#'  g2_R() %>%
#'  g2_chart(theme = "dark") %>%
#'  g2_coord(type = "theta") %>%
#'  g2_geom(
#'    x = Sepal.Width,
#'    y = Sepal.Length,
#'    type = "interval",
#'    color = Species,
#'    adjust = c("stack"),
#'    opacity = Sepal.Length
#'  )
#'
#' @import htmlwidgets
#'
#' @export
g2_geom <- function(g2, x, y, type, color = NULL, adjust = NULL, shape = NULL, size = NULL, opacity = NULL, tooltip = NULL, label = NULL, style = NULL, select = NULL, active = NULL, name = NULL) {

  # Clean up information from parameters to allow for use of symbols from the user side
  x <- deparse(substitute(x))

  y <- deparse(substitute(y))

  if(typeof(substitute(color)) == "symbol") {
      color <- deparse(substitute(color))
  } else {
    color
  }

  if(typeof(substitute(shape)) == "symbol") {
    shape <- deparse(substitute(shape))
  } else {
    shape
  }

  if(typeof(substitute(size)) == "symbol") {
    size <- deparse(substitute(size))
  } else {
    size
  }

  if(typeof(substitute(opacity)) == "symbol") {
    opacity <- deparse(substitute(opacity))
  } else {
    opacity
  }

  if(typeof(substitute(label)) == "symbol") {
    label <- deparse(substitute(label))
  } else {
    label
  }

  if(typeof(substitute(tooltip)) == "symbol") {
    tooltip <- deparse(substitute(tooltip))
  } else {
    tooltip
  }


  geom_opts <- list(
    "type" =  type,
    "adjust" = adjust,
    "position" = paste(x, "*", y, sep = ""),
    "color" = color,
    "shape" = shape,
    "size" = size,
    "opacity" = opacity,
    "label" = label,
    "tooltip" = tooltip,
    "style" = style,
    "select" = select,
    "active" = active
  )

  # Remove all attributes with NULL
  geom_opts <- geom_opts[!sapply(geom_opts, is.null)]

  # If opts list doesn't exist create it
  # Otherwise append to existing list
  # TODO: Add if scenario for when name != NULL and g2$x$view[[name]]$options already exists
  if(!is.null(name) && is.null(g2$x$view[[name]])) {
    g2$x$view[[name]]$options <- list("geoms" = list(geom_opts))
  } else if(!is.null(name) && !is.null(g2$x$view[[name]])) {
    g2$x$view[[name]]$options$geoms <- append(g2$x$view[[name]]$options$geoms, list(geom_opts))
  } else if(is.null(g2$x$options$geoms)) {
    g2$x$options$geoms <- list(geom_opts)
  } else {
    g2$x$options$geoms <- append(g2$x$options$geoms, list(geom_opts))
  }

  return(g2)
}


geom_list <- function() {

  geom_list = list(
    area = list(
      'area',
      'smooth',
      'line',
      'dotLine',
      'smoothLine',
      'dotSmoothLine'
    ),
    edge = list(
      'line',
      'vhv',
      'smooth',
      'arc'
    ),
    heatmap = list(),
    interval = list(
      'rect',
      'hollowRect',
      'line',
      'tick',
      'stroke',
      'funnel',
      'pyramid'
    ),
    line = list(
      'line',
      'smooth',
      'dot',
      'dash',
      'dotSmooth',
      'spline'
    ),
    path = list(),
    point = list(
      'circle',
      'square',
      'bowtie',
      'diamond',
      'hexagon',
      'triangle',
      'triangle-down',
      'hollowCircle',
      'hollowSquare',
      'hollowBowtie',
      'hollowDiamond',
      'hollowHexagon',
      'hollowTriangle',
      'hollowTriangle-down',
      'cross',
      'tick',
      'plus',
      'hyphen',
      'line'
    ),

    polygon = list(
      'polygon',
      'hollow',
      'stroke'
    ),
    schema = list(
      'box',
      'candle'
    ),
    venn = list(),
    violin = list()
  )

  return(geom_list)

}



