#' Install learning materials
#'
#' `use_module()` will install the materials for a given learning module. Then,
#' it will open a new RStudio Project containing the files you'll need for that
#' module.
#'
#' @param module The name of the module
#' @param destdir The path on your computer where you would like the learning
#'   materials installed. If `NULL`, defaults to your Desktop or some other
#'   conspicuous place.
#'
#' @export
use_module <- function(module, destdir = NULL) {
  check_pak()
  check_deps(module)

  usethis::use_course(
    as_repo(module),
    destdir = destdir
  )
}


as_repo <- function(module) paste0("emptyfield-ds/", module)

check_pak <- function() {

}

check_deps <- function(module) {

}
