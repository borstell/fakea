#' Create a product tag for a custom Fakea product
#'
#' Outputs a Fakea product tag based on custom inputs
#'
#' @param logo Which type of tag to output (1=blank; 2=logo; 3=Swedish pretty logo)
#' @param currency The currency symbol to use for price tag (default="$")
#' @param language The language used for product name and logo (default="sw")
#' @param txt1 The custom product name
#' @param txt2 The custom product category
#' @param txt3 The custom price
#' @param destfile The destination output file
#' @return A custom product tag image
#' @export
make_custom_tag <- function(logo=2, currency="$",language="sw", txt1="FEJKA", txt2="R package", txt3=" v1.0.0", destfile="./fakea_CUSTOM.png") {
  im <- magick::image_read(paste0("https://raw.githubusercontent.com/borstell/fakea/master/fakea_logo_", logo, ".png"))
  if (language!="sw" & logo==2) {
    im <- magick::image_read(paste0("https://raw.githubusercontent.com/borstell/fakea/master/fakea_logo_",language,".png"))
  }
  text1 <- toupper(txt1)
  if (language == "il") {
    text1 <- stringi::stri_reverse(text1)
  }
  text2 <- txt2
  text3 <- paste0(currency, txt3)
  if (currency %in% c("$", "£", "¥", "₪", "version", "v.", "v")) {
    text3 <- paste0(currency, txt3)
  }
  else {
    text3 <- paste0(txt3, currency)
  }
  if (currency %in% c("¥")) {
    text3 <- paste0(currency, txt3)
  }
  if (currency %in% c(".-", ":-", " kr", " kr.")) {
    text3 <- paste0(txt3, currency)
  }
  im <- magick::image_annotate(im, text1, size = 200, font = "sans", color = "black", weight = 700, gravity = "southeast", location = "+60+250")
  im <- magick::image_annotate(im, text2, size = 85, font = "sans", color = "grey", weight = 400, gravity = "southeast", location = "+75+180")
  im <- magick::image_annotate(im, text3, size = 105, font = "sans", color = "black", weight = 700, gravity = "southeast", location = "+75+50")
  magick::image_write(im, path=destfile)
  return(destfile)
}
