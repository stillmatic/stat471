#' Prints available datasets
#'
#' @return outputs which datasets are loaded locally
#' @export
#'
#' @examples
#' list_data()
list_data <- function() {
    datasets_471 <- c(
        "Framingham",
        "Cars_04",
        "Crime",
        "Hitters",
        "HIV",
        "MLPay",
        "Sirius",
        "Tips"
    )
    paste(datasets_471)
}

#' Updates this package
#'
#' Installs package from source
#'
#' TODO: automate checks against Github version, autoupdate on load
#'
#' @return updates package
#' @export
#'
#' @examples
#' \dontrun{update_471}
update_471 <- function() {
    devtools::install_github("stillmatic/stat471")
}
