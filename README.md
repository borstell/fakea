<img src="https://raw.githubusercontent.com/borstell/fakea/master/fakea_package.png" width="1200">

# FAKEA /fejka/
Create fake furniture product names

To avoid terrible attempts at pseudo-Swedish/Scandinavian product names, here's a package that supplies you with some 12,000 fake products – all based on actual Swedish words and place names (as they should).

## Product label (plain)

```
get_type() %>%
  make_tag(logo=2, currency = "$")
```
![](https://raw.githubusercontent.com/borstell/fakea/master/fakea_products/fakea_ojämn.png)


## Product label (with logo)

```
get_type() %>%
  make_tag(logo=2, currency = "£")
```
![](https://raw.githubusercontent.com/borstell/fakea/master/fakea_products/fakea_mångfald.png)

# The "IKEA name" function
I've seen the _Your IKEA name is your name backwards with an umlaut on the first vowel_. I don't think this is super accurate as the only Swedish "umlauts" are _ä_ and _ö_ (and _å_ if you count [the more uniquely Swedish letter](https://en.wikipedia.org/wiki/Å)), and _ë_, _ï_ and _ü_ are only used marginally, exclusively in loanwords. The function `get_ikea_name()` will use the original idea if `original=TRUE`, but in the default `original=FALSE` it will substitute instances of _a_ and _o_ to _å_ or _ä_ and _ö_, respectively. If the additional argument `swedify` is set to `TRUE` (default is `FALSE`), a few minor corrections for di- and trigraphs in Swedish orthography are made.

```
> get_ikea_name("Orbacka")
[1] "Åkcäbro"
> get_ikea_name("Orbacka", original=T, swedify = F)
[1] "Äkcabro"
> get_ikea_name("Orbacka", original=F, swedify = T)
[1] "Äckabro"
> get_ikea_name("Orbacka", original=T, swedify = T)
[1] "Äckabro"
> get_ikea_name("Schokoladechance", original=F, swedify = T)
[1] "Eknächedälökösch"
```

Using `get_ikea_name(original=TRUE)` (note the un-Swedish characters _ü_ and _ë_):
![Original](https://raw.githubusercontent.com/borstell/fakea/master/ikea_name_original.png)

Using `get_ikea_name(original=FALSE)`:
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
