#' Create a product tag for a random Fakea product
#'
#' Inputs a product category and outputs a Fakea product tag
#'
#' @param cat The product category
#' @param logo Which type of tag to output (1=blank; 2=logo; 3=pretty logo)
#' @param currency The currency symbol to use for price tag (default="$")
#' @param language The language used for product name and logo (default="sw")
#' @param directory The specified directory in which to save your file
#' @return A product tag image
#' @export
make_tag <- function(cat, logo=2, currency="$", language="sw", directory="./") {
  im <- magick::image_read(paste0("https://raw.githubusercontent.com/borstell/fakea/master/fakea_logo_", logo, ".png"))
  if (language!="sw" & logo==2) {
    im <- magick::image_read(paste0("https://raw.githubusercontent.com/borstell/fakea/master/fakea_logo_",language,".png"))
  }
  product <- get_product(cat)
  if (language!="sw") {
    prod <- product[[language]]
  }
  else {
    prod <- product$Product
  }
  outfile <- paste0(directory,"fakea_",prod,".png")
  text1 <- toupper(prod)
  if (language == "il") {
    text1 <- stringi::stri_reverse(text1)
  }
  text2 <- product$Type
  if (currency %in% c("$", "£", "¥", "₪")) {
    text3 <- paste0(currency, product$Price)
  }
  else {
    text3 <- paste0(product$Price, currency)
  }
  if (currency %in% c("¥")) {
    text3 <- paste0(currency, product$Price*100)
  }
  if (currency %in% c(".-", ":-", " kr", " kr.")) {
    text3 <- paste0(product$Price*10, currency)
  }
  im <- magick::image_annotate(im, text1, size = 200, font = "sans", color = "black", weight = 700, gravity = "southeast", location = "+60+250")
  im <- magick::image_annotate(im, text2, size = 85, font = "sans", color = "grey", weight = 400, gravity = "southeast", location = "+75+180")
  im <- magick::image_annotate(im, text3, size = 105, font = "sans", color = "black", weight = 700, gravity = "southeast", location = "+75+50")
  magick::image_write(im, path=outfile)
  return(outfile)
}
