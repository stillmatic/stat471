

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

#' Load a dataset
#'
#' Simple wrapper around utills::data - students often will name their
#' own datasets 'data' which can create collision problems.
#'
#' @param x dataset to load
#'
#' @return dataset
#' @export
#'
#' @examples
#' load_data(sleep)
load_data <- function(x) {
    utils::data(x)
}
