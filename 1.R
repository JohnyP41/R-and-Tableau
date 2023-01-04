install.packages("tidyverse")
library(tidyverse)
install.packages("weathermetrics")
library(weathermetrics)

#2.3.1
#1
airquality
airquality %>% select(Ozone:Temp) %>% filter(Ozone > 80)
#mo¿na u¿yæ u¿yæ krótszej notacji

#2
airquality %>% mutate(TempC = fahrenheit.to.celsius(Temp)) %>% dplyr::rename(TempF=Temp)
#2.4.1
#1.
as_tibble(airquality)
#2.
tibble(litery= letters[6:11],miesiace = month.name[1:6])
