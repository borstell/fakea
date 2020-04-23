library(tidyverse)
library(magick)

get_product <- function(cat) {
  fakea <- read.csv("./fakea_products.csv")
  df <- subset(fakea, Category==cat)
  product <- dplyr::sample_n(df,1)
  return(product)
}

get_type <- function() {
  fakea <- read.csv("./fakea_products.csv")
  item <- sample_n(fakea,1)$Category
  return(item)
}

make_tag <- function(cat, logo=1) {
  im <- magick::image_read("./fakea_logo_empty.png")
  if (logo == 2) {
    im <- magick::image_read("./fakea_logo_bootleg.png")
  }
  if (logo == 3) {
    im <- magick::image_read("./fakea_logo.png")
  }
  product <- get_product(cat)
  outfile <- paste0("./fakea_products/fakea_",product$Product,".png")
  text1 <- toupper(product$Product)
  text2 <- product$Type
  text3 <- paste0("$",product$Price)
  im <- magick::image_annotate(im, text1, size = 200, font = "sans", color = "black", weight = 700, gravity = "southeast", location = "+60+250")
  im <- magick::image_annotate(im, text2, size = 85, font = "sans", color = "grey", weight = 400, gravity = "southeast", location = "+75+180")
  im <- magick::image_annotate(im, text3, size = 105, font = "sans", color = "black", weight = 700, gravity = "southeast", location = "+75+50")
  magick::image_write(im, path=outfile)
  return(outfile)
}

for (n in 1:3) {
  get_type() %>%
    make_tag(logo=n)
}