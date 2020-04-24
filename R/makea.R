#' Generate an "IKEA name"
#'
#' Inputs a string and outputs the IKEA-fied version (original or adapted rules)
#'
#' @param string The string to be converted
#' @param original Whether to use the original or adapted IKEA name rules (default=FALSE)
#' @param swedeness How much (0 to 4) the input string should "Swedify" its form (default=0)
#' @return A product from the data file
#' @export
makea <- function(string, original=FALSE, swedeness=0) {
  name <- fakea::swedify(string, swedeness=swedeness, invert=T)
  name <- tolower(name)
  rev_name <-stringi::stri_reverse(name)
  if (original == TRUE) {
    d <- hash::hash()
    d["a"] <- c("ä")
    d["o"] <- c("ö")
    d["e"] <- c("ë")
    d["i"] <- c("ï")
    d["u"] <- c("ü")
    first_vowel <- stringr::str_extract(rev_name, "[aeiou]")
    ikea_name <- sub(first_vowel, hash::values(d[first_vowel])[[1]], rev_name)
  }
  else {
    ikea_name <- gsub("a", sample(c("a", "å", "ä"),1), gsub("o", sample(c("o", "ö"),1), sub("a", sample(c("å", "ä"),1), rev_name)))
  }
  ikea_name <- paste0(toupper(substr(ikea_name, 1, 1)), substr(ikea_name, 2, nchar(ikea_name)))
  return(ikea_name)
}
