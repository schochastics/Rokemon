<!-- README.md is generated from README.Rmd. Please edit that file -->
![](rokemon.png)

Install
=======

``` r
#install.packages("devtools")
devtools::install_github("schochastics/Rokemon")
```

``` r
library(Rokemon)
library(tidyverse)
```

Example
=======

``` r
pokemon %>%
  distinct(type1,.keep_all=TRUE) %>%
  select(attacker = type1,against_bug:against_water) %>%
  gather(defender,effect,against_bug:against_water) %>%
  mutate(defender = str_replace_all(defender,"against_",""))  %>%
  ggplot(aes(y=attacker,x=defender,fill=factor(effect)))+
  geom_tile()+
  geom_text(aes(label=ifelse(effect!=1,effect,"")))+
  scale_fill_manual(values=c("#8B1A1A", "#CD2626", "#EE2C2C", "#FFFFFF", "#00CD00", "#008B00"))+
  theme_rocket(legend.position="none")+
  labs(title="Efficiency Table")
```

<img src="figures/effectiveness-1.png" width="80%" style="display: block; margin: auto;" />

Fonts
=====

Download the following Fonts: \* Pokemon Title [(Link)](https://www.dafont.com/pokemon.font) \* Gameboy Version [(Link)](https://github.com/Superpencil/pokemon-font/releases/tag/v1.8.1)

In order to use these fonts in R you will need the `extrafont` package.

``` r
install.packages("extrafont")
extrafont::font_import() #only run ones
extrafont::loadfonts()
```

Color Palettes
==============

R package including color palettes

``` r
install.packages('palettetown')
```

Addendum
========

Logo generated with [fontmeme](https://fontmeme.com/pokemon-font/)
