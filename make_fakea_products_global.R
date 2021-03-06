library(tidyverse)
library(magick)
library(stringi)
library(hash)

get_product <- function(cat) {
  fakea <- read.csv("./fakea_products_global.csv")
  df <- subset(fakea, Category==cat)
  product <- dplyr::sample_n(df,1)
  return(product)
}

get_type <- function() {
  fakea <- read.csv("./fakea_products_global.csv")
  item <- sample_n(fakea,1)$Category
  #print(item)
  return(item)
}

make_tag <- function(cat, logo=2, currency="$", language="sw") {
  if (logo == 1) {
    im <- magick::image_read("./fakea_logo_empty.png")
  }
  if (logo == 2) {
    if (language!="sw") {
      im <- magick::image_read(paste0("./fakea_logo_",language,".png"))
    }
    else {
      im <- magick::image_read("./fakea_logo_bootleg.png")
    }
  }
  if (logo == 3) {
    im <- magick::image_read("./fakea_logo.png")
  }
  product <- get_product(cat)
  if (language!="sw"){
    prod <- product[[language]]
  }
  else {
    prod <- product$Product
  }
  outfile <- paste0("./fakea_products/fakea_",prod,".png")
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

# for (l in c("sw", "cy", "fi", "il", "nl", "tt", "uk", "us")) {
#   if (l == "il") {
#     c <- "₪"
#   }
#   if (l == "uk" | l == "cy") {
#     c <- "£"
#   }
#   if (l == "sw" ) {
#     c <- ":-"
#   }
#   if (l == "us" | l == "tt") {
#     c <- "$"
#   }
#   if (l == "fi" | l == "nl") {
#     c <- "€"
#   }
#   for (cat in c("bed", "sofa")){
#       make_tag(logo=2, cat=cat, language=l, currency = c)
#   }
# }

make_logo <- function(logo=2, currency="$",language="sw", txt1="FEJKA", txt2="R package", txt3=0, destfile="./fakea_package.png") {
  if (logo == 1) {
    im <- magick::image_read("./fakea_logo_empty.png")
  }
  if (logo == 2) {
    if (language!="sw") {
      im <- magick::image_read(paste0("./fakea_logo_",language,".png"))
    }
    else {
      im <- magick::image_read("./fakea_logo_bootleg.png")
    }
  }
  if (logo == 3) {
    im <- magick::image_read("./fakea_logo.png")
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

get_ikea_name <- function(name, original=FALSE, swedify=FALSE) {
  name <- tolower(name)
  if (swedify == TRUE) {
    name <- gsub("sch", "X", name)
    name <- gsub("ch", "Y", name)
    name <- gsub("ck", "Z", name)
    name <- gsub("cc", "Z", name)
    name <- gsub("c", "k", gsub("z", "s", name))
    name <- gsub("X", "hcs", name)
    name <- gsub("Y", "hc", name)
    name <- gsub("Z", "kc", name)
  }
  rev_name <-stringi::stri_reverse(name)
  if (original == TRUE) {
    d <- hash()
    d["a"] <- c("ä")
    d["o"] <- c("ö")
    d["e"] <- c("ë")
    d["i"] <- c("ï")
    d["u"] <- c("ü")
    first_vowel <- str_extract(rev_name, "[aeiou]")
    ikea_name <- sub(first_vowel, values(d[first_vowel])[[1]], rev_name)
  }
  else {
    ikea_name <- gsub("a", sample(c("a", "å", "ä"),1), gsub("o", sample(c("o", "ö"),1), sub("a", sample(c("å", "ä"),1), rev_name)))
  }
  ikea_name <- paste0(toupper(substr(ikea_name, 1, 1)), substr(ikea_name, 2, nchar(ikea_name)))
  return(ikea_name)
}

# get_ikea_name("Orbacka")
# get_ikea_name("Orbacka", original=T, swedify = F)
# get_ikea_name("Orbacka", original=F, swedify = T)
# get_ikea_name("Orbacka", original=T, swedify = T)
# get_ikea_name("Schokoladechance", original=F, swedify = T)


# make_logo(txt1 = get_ikea_name("Umlauts"), txt2 = get_ikea_name("Your Ikeaname"), destfile = "./ikea_name.png")
# make_logo(txt1 = get_ikea_name("Umlauts", original=T), txt2 = get_ikea_name("Your Ikeaname", original=T), destfile = "./ikea_name_original.png")

# make_logo(currency = "v", txt3 = "1.0.0")
