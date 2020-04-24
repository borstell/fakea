<img src="https://raw.githubusercontent.com/borstell/fakea/master/fakea_package.png" width="1200">

# FAKEA /fejka/
Create fake furniture product names

To avoid terrible attempts at pseudo-Swedish/Scandinavian product names, here's a package that supplies you with some 12,000 fake products – all based on actual Swedish words and place names (as they should).

## Installation
```
devtools::install_github("borstell/fakea")
```


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
