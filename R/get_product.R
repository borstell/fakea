#' Get product from data file
#'
#' Picks a random product item from the data file based on the category input
#'
#' @param cat The product category
#' @return A product from the data file
#' @export
get_product <- function(cat) {
  data <- utils::read.csv(url("https://raw.githubusercontent.com/borstell/fakea/master/fakea_products_global.csv"))
  df <- subset(data, data$Category==cat)
  product <- dplyr::sample_n(df,1)
  return(product)
}
