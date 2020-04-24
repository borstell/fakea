#' Swedify an input string
#'
#' Inputs a string and outputs a "Swedified" version
#'
#' @param string The string to be converted
#' @param swedeness How much (0 to 2) the input string should "Swedify" its form (default=0)
#' @param invert Whether to invert specific di- and trigraphs
#' @param capitalize Capitalize first letter of output string
#' @return A product from the data file
#' @export
swedify <- function(string, swedeness=0, invert=FALSE, capitalize=FALSE) {
  string <- tolower(string)
  if (swedeness > 0) {
    if (swedeness > 1) {
      string <- gsub("sch", "sj", string)
      string <- gsub("ch", "tj", string)
      string <- gsub("cc", "ck", string)
      string <- gsub("ew", "uv", string)
      string <- gsub("er$", "are", string)
      string <- gsub("sj", "X",string)
      string <- gsub("tj", "Y", string)
      string <- gsub("ck", "Z", string)
      string <- gsub("cc", "Z", string)
      string <- gsub("c", "k", gsub("z", "s", gsub("w", "v", string)))
      if (invert == TRUE) {
        string <- gsub("X", "js", string)
        string <- gsub("Y", "jt", string)
        string <- gsub("Z", "kc", string)
      }
      else {
        string <- gsub("X", "sj", string)
        string <- gsub("Y", "tj", string)
        string <- gsub("Z", "ck", string)
      }
    }
    else {
      string <- gsub("sch", "A", string)
      string <- gsub("ch", "B", string)
      string <- gsub("sj", "X",string)
      string <- gsub("tj", "Y", string)
      string <- gsub("ck", "Z", string)
      string <- gsub("cc", "Z", string)
      string <- gsub("c", "k", gsub("z", "s", string))
      if (invert == TRUE) {
        string <- gsub("A", "hcs", string)
        string <- gsub("B", "hc", string)
        string <- gsub("X", "js", string)
        string <- gsub("Y", "jt", string)
        string <- gsub("Z", "kc", string)
      }
      else {
        string <- gsub("A", "sch", string)
        string <- gsub("B", "ch", string)
        string <- gsub("X", "sj", string)
        string <- gsub("Y", "tj", string)
        string <- gsub("Z", "ck", string)
      }
    }
  }
  if (capitalize == TRUE) {
    string <- paste0(toupper(substr(string, 1, 1)), substr(string, 2, nchar(string)))
  }
  return(string)
}
