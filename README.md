<img src="https://raw.githubusercontent.com/borstell/fakea/master/fakea_package.png" width="1200">

# FAKEA /fejka/
Create fake furniture product names

To avoid terrible attempts at pseudo-Swedish/Scandinavian product names, here's a package that supplies you with some 12,000 fake products -- all based on actual Swedish words and place names (as they should).

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
![](https://raw.githubusercontent.com/borstell/fakea/master/fakea_products/fakea_Llanelli.png)

## English (UK) 
`language="uk"`
![](https://raw.githubusercontent.com/borstell/fakea/master/fakea_products/fakea_Stow-on-the-Wold.png)

## English (US) 
`language="us"`
![](https://raw.githubusercontent.com/borstell/fakea/master/fakea_products/fakea_truck.png)
