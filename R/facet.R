#' <Add Title>
#'
#' <Add Description>
#' @param type
#' \itemize{
#'  \item{"rect"}
#'  \item{"list"}
#'  \item{"circle"}
#'  \item{"tree"}
#'  \item{"mirror"}
#'  \item{"matrix"}
#' }
#'
#' @import htmlwidgets
#'
#' @export
g2_facet <- function(g2, fields, type = "rect") {

  facet_opts <- list(
    "type" = type,
    "fields" = fields
  )

  if(is.null(g2$x$options$facet)) {
    g2$x$options$facet <- facet_opts
  } else {
    g2$x$options$facet <- append(g2$x$options$facet, facet_opts)
  }

  return(g2)
}
