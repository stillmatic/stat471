#' Converts MLB payroll data into tidy format
#'
#' @return tidy dataframe with MLB team, year, wins, payroll, winrate
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
#' head(tidy_ml_data)
tidy_ml_data <- function() {
    salary <- stat471::ml_pay
    winrate <- salary %>%
        dplyr::select(Team.name.2014, X2014.pct:X1998.pct) %>%
        tidyr::gather(Year, Winrate, X2014.pct:X1998.pct)
    winrate$Year <- stringr::str_extract(winrate$Year, "([0-9]{4})")
    payroll <- salary %>%
        dplyr::select(Team.name.2014, p1998:p2014) %>%
        tidyr::gather(Year, Payroll, p1998:p2014)
    payroll$Year <- stringr::str_extract(payroll$Year, "([0-9]{4})")
    wins <- salary %>%
        dplyr::select(Team.name.2014, X2014:X1998) %>%
        tidyr::gather(Year, Wins, X2014:X1998)
    wins$Year <- stringr::str_extract(wins$Year, "([0-9]{4})")

    final <- Reduce(function(...) dplyr::left_join(..., c("Team.name.2014", "Year")), list(wins, payroll, winrate))
    final <- dplyr::rename(final, Team = Team.name.2014)
    final
}
