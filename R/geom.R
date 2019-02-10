#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
g2_geom <- function(
  g2,
  x,
  y,
  type,
  color = NULL,
  adjust = NULL,
  shape = NULL,
  size = NULL,
  opacity = NULL,
  tooltip = NULL,
  label = NULL,
  style = NULL,
  select = NULL,
  active = NULL
  ) {

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
  if(is.null(g2$x$options$geoms)) {
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



