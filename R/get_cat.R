#' Get product category from data file
#'
#' Picks a random product category from the data file
#'
#' @return A product category from the data file
#' @export
get_cat <- function() {
  fakea <- utils::read.csv(url("https://raw.githubusercontent.com/borstell/fakea/master/fakea_products_global.csv"))
  item <- dplyr::sample_n(fakea,1)$Category
  return(item)
}
