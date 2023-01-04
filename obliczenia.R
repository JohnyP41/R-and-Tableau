# ---- sekcja-1 ----

library(ggplot2)
library(dplyr)

ggplot(data=diamonds,aes(x=carat,y=cut)) + 
  geom_col()

ggplot(data=diamonds,aes(x=carat,y=color)) + 
  geom_col()

ggplot(data=diamonds,aes(x=carat,y=clarity)) + 
  geom_col()

# ---- sekcja-2 ----
bigger <- diamonds %>% 
  filter(carat >= 3.01)

knitr::kable(
  bigger[1:20, ], 
  caption = "Tabela 20 najwiekszych diamentow"
)

