<img src="https://raw.githubusercontent.com/borstell/fakea/master/fakea_package.png" width="1200">

# FAKEA /fejka/
Create fake furniture product names

To avoid terrible attempts at pseudo-Swedish/Scandinavian product names, here's a package that supplies you with some 12,000 fake products – all based on actual Swedish words and place names (as they should).

## Installation
```
devtools::install_github("borstell/fakea")
```

# The "IKEA name" function
I've seen the _Your IKEA name is your name backwards with an umlaut on the first vowel_. I don't think this is super accurate as the only Swedish "umlauts" are _ä_ and _ö_ (and _å_ if you count [the more uniquely Swedish letter](https://en.wikipedia.org/wiki/Å)), and _ë_, _ï_ and _ü_ are only used marginally, exclusively in loanwords. The function `makea()` will use the original idea if `original=TRUE`, but in the default `original=FALSE` it will substitute instances of _a_ and _o_ to _å_ or _ä_ and _ö_, respectively. If the additional argument `swedeness` is set to `1` or `2` (default is `0`), a few minor corrections for di- and trigraphs in Swedish orthography are made.

```
> makea("Orbacka")
[1] "Äkcabro"
> makea("Orbacka", original=T, swedeness = 1)
[1] "Äckabro"
> makea("Orbacka", original=F, swedeness = 1)
[1] "Åckabro"
> makea("Orbacka", original=T, swedeness = 2)
[1] "Äckabro"
> makea("Chewbacca", original = F, swedeness = 2)
[1] "Åckåbvutj"
> makea("Schokoladechance", original=F, swedeness = 1)
[1] "Eknåchedålokosch"
> makea("Schokoladechance", original=F, swedeness = 2)
[1] "Eknåtjedalokosj"
```

Using `makea(original=TRUE)` (note the un-Swedish characters _ü_ and _ë_):
![Original](https://raw.githubusercontent.com/borstell/fakea/master/ikea_name_original.png)

Using `makea(original=FALSE)`:
![Adapted](https://raw.githubusercontent.com/borstell/fakea/master/ikea_name.png)

## `swedify`
With the function `swedify()`, you can make any input string look more Swedish, for example by adapting some orthographic patterns to Swedish (if argument `swedeness > 0`) or by going _bänänås_ by adding random ümlåuts to the string (if argument `swedeness > 9000`).

```
> swedify("Chewbacca",swedeness=1, capitalize=T)
[1] "Chewbacka"
> swedify("Skywalker",swedeness=1, capitalize=T)
[1] "Skywalker"
> swedify("Chewbacca",swedeness=2, capitalize=T)
[1] "Tjuvbacka"
> swedify("Skywalker",swedeness=2, capitalize=T)
[1] "Skyvalkare"
> swedify("Chewbacca",swedeness=9001, capitalize=T)
[1] "Tjuvbåckä"
> swedify("Skywalker",swedeness=9001, capitalize=T)
[1] "Skyvålkare"
```

# Creating labels
Create automatic or custom labels in the style of the original. The `logo` argument is either `0` (blank label) or `1` or `2` (logotype label).

## Automatic (from pre-generated data set):
```
make_tag(logo=2, currency="$", language="sw", directory="path/to/outfile/directory")
```

## Custom (from manual input)

make_custom_tag(logo=2, currency = "$", language = "sw", txt1 = "PRODUCT NAME", txt2 = "Product category", txt3 = "price", destfile = "path/to/outfile")

## Product label (plain)

```
get_cat() %>%
  make_tag(logo=2, currency = "$")
```
![](https://raw.githubusercontent.com/borstell/fakea/master/fakea_products/fakea_ojämn.png)


## Product label (with logo)

```
get_cat() %>%
  make_tag(logo=2, currency = "£")
```
![](https://raw.githubusercontent.com/borstell/fakea/master/fakea_products/fakea_mångfald.png)


# Simulate other languages/countries
With an added language variable, you can simulate products from another country/language. Currently available:

## Welsh 
`language="cy"`
![](https://raw.githubusercontent.com/borstell/fakea/master/fakea_products/fakea_Llanelli.png)

## Finnish 
`language="fi"`
![](https://raw.githubusercontent.com/borstell/fakea/master/fakea_products/fakea_ennätys.png)

## Dutch (NL) 
`language="nl"`
![](https://raw.githubusercontent.com/borstell/fakea/master/fakea_products/fakea_systeem.png)

## Hebrew (IL) 
`language="il"`
![](https://raw.githubusercontent.com/borstell/fakea/master/fakea_products/fakea_שדרות.png)

## English (TT) 
`language="tt"`
![](https://raw.githubusercontent.com/borstell/fakea/master/fakea_products/fakea_Speyside.png)

## English (UK) 
`language="uk"`
![](https://raw.githubusercontent.com/borstell/fakea/master/fakea_products/fakea_Stow-on-the-Wold.png)

## English (US) 
`language="us"`
![](https://raw.githubusercontent.com/borstell/fakea/master/fakea_products/fakea_truck.png)
