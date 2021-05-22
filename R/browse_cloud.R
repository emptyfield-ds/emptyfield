#' Open learning materials in RStudio Cloud
#'
#' `browse_cloud()` will open an RStudio Cloud version of a given learning
#' module in your browser. The cloud version will have the packages and
#' materials pre-installed.
#'
#' @param module The name of the module
#' @param open Logical. Open the URL in the browser? Default is `TRUE`. If
#'   `FALSE`, `browse_cloud()` just provides the URL for you to open yourself.
#'
#' @export
#' @importFrom utils browseURL
browse_cloud <- function(module, open = interactive()) {
  query <- glue::glue("/repos/emptyfield-ds/{module}")
  rstudio_cloud_url <- gh::gh(query)$homepage
  if (is.null(rstudio_cloud_url)) {
    usethis::ui_stop("No RStudio Cloud URL found for {usethis::ui_value(module)}")
  }
  if (open) {
    usethis::ui_done("Opening URL {usethis::ui_value(rstudio_cloud_url)}")
    utils::browseURL(rstudio_cloud_url)
  } else {
    usethis::ui_todo("Open URL {usethis::ui_value(rstudio_cloud_url)}")
  }

  invisible(rstudio_cloud_url)
}
