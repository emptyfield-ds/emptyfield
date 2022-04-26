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
#' @importFrom utils install.packages packageVersion
use_module <- function(module, destdir = NULL) {
  check_pak()
  check_deps(module)

  usethis::use_course(
    as_repo(module),
    destdir = destdir
  )
}

as_repo <- function(module) glue::glue("emptyfield-ds/{module}")

check_pak <- function() {
  if (!rlang::is_installed("pak") && packageVersion("pak") >= "0.1.2.9001") {
    install_it <- usethis::ui_yeah(
      "{usethis::ui_code('pak 0.1.2.9001')} or greater is required to \\
       install packages for this module. Install it now?"
    )
    if (!install_it) usethis::ui_stop("pak 0.1.2.9001 or greater is required.")

    install.packages("pak", repos = "https://r-lib.github.io/p/pak/dev/")
  }

  invisible(NULL)
}

check_deps <- function(module) {
  url <- glue::glue("https://raw.githubusercontent.com/emptyfield-ds/{module}/HEAD/.deps")
  pkgs <- tryCatch(
    suppressWarnings(readLines(url, encoding = "UTF-8", warn = FALSE)),
    error = function(.e) NULL
  )

  if (is.null(pkgs)) {
    return(invisible())
  }

  rlang::check_installed(pkgs, "for this module.")
}

