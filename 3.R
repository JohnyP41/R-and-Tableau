install.packages("tidyverse")
library(tidyverse)

#3.2.4
#1.
ggplot(data = mpg)
#Nic nie wida? na wykresie

#2.
?mtcars
#11 kolumn i 32 wiersze

#3.
?mpg
#drv to rodzaj uk?adu nap?dowego, gdzie f = nap?d na przednie ko?a, r = nap?d na tylne ko?a, 4 = naped na 4 kola

#4.
ggplot(data = mpg) +  geom_point(mapping = aes(x = hwy, y = cyl))
#ladny wykres

#5.
ggplot(data = mpg) +  geom_point(mapping = aes(x = class, y = drv))
#ten wykres pokazuje jaki ma naped dany typ samochodu
#Class i drv to zmienne kategorialne.
#Nie pokazuje on nam ?adnych ciekawych zaleznosci te dane mozna sprawdzic w internecie.

#3.3.1
#1.
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
#zle sa postawione nawiasy tutaj.
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), color = "blue")
#powinno by? tak
#Kolor ustawiono w estetyce a nie jako argument funkcji geom_point dlatego nie jest to niebieski. 
#blue nie jest to zmienna dlatego jest to czerwony kolor.

#2.
?mpg
mpg
#ciagle to:displ,year,cyl,cty,hwy
#kategorialne to:manufacturer,model,trans,drv,fl,class

#3
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = cyl, size = hwy, shape = class))
#Gdy mamy zmienna ci?g?a wy?wietlana jest skala a gdy kategorialna to wy?wietlane s? nazwy kategorii.

#4
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = cty, size = cty))
#Nak?adaj? si? na siebie.

#5
?geom_point
#W przypadku kszta?t?w, kt?re maj? obramowanie (np. 21), mo?esz pokolorowa? wn?trze i
# na zewn?trz oddzielnie. Estetyki stroke u?ywamy, aby zmodyfikowa? szeroko?? obramowania punktu.

#6
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, colour = displ < 5))
#Estetyka jest stosowana do obliczonego tutaj warunku.

#3.5.1
#1
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ hwy)
#Wtedy mamy panele dla ka?dej warto?ci zmiennej hwy.

#2
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))

#Zale?no??:
#Puste kom?rka jest tam gdzie nie ma kropki na tym drugim wykresie.
#Jak nie ma kropki na drugim wykresie to jest pusta kom?rka na pierwszym.

#3
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)
#Wykres hwy od displ podzielony na 3 panele

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)
#Wykres hwy od displ podzielony na 4 panele
#Kropka zast?puje nazwe zwiennej.
#zmienna~. pokazuje wiele wierszy dla kazdej wartosci zmiennej.
#.~zmienna pokazuje wiele kolumn dla kazdej wartosci zmiennej.

#4
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy,color=class))
#Tutaj widzimy do jakiej klasy nalezy dany punkt.

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
#Widzimy podzia? na klasy 

#Korzy?ci:
#Dzi?ki panelom mozemy przejrzec poszczegolne klasy.
#Dzieki estetykom widac podzial calosciowy punktow na klasy.
#Panele s? dla mnie bardziej czytelne niz estetyki.
#Gdy nasz zbi?r danych jest wielki panele mog? by? nieczytelne lepiej bedzie uzyc estetyki.

#5
?facet_wrap
#nrow to liczba wierszy - w ile wierszy ustawimy panele
#ncol to liczba kolumn - w ile kolumn ustawimy panele
#Opcje kontrolujace uk?ad paneli:shrink,scales.
#scales-czy skale powinny by? sta?e (?sta?e?, warto?? domy?lna), wolne (?wolne?) lub wolne w jednym wymiarze (?wolne_x?, ?wolne_y?).
#shrink-Je?li PRAWDA, zmniejszy skale, aby dopasowa? wyniki statystyk, a nie surowe dane. Je?li FALSE, b?dzie zakres surowych danych przed podsumowaniem statystycznym.
?facet_grid()
#Dlatego ,?e ta funkcja przyjmuje rows i cols. Rows i cols to zestawy zmiennych.

#6
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(class ~ manufacturer)
#Gdy dajemy tak? zmienna widac ze kropki sie nakladaja na siebie.Lepiej dac zmienna o bardziej unikalnych wartosciach by temu zapobiec.

#3.6.1
#1
#Liniowy
ggplot(data = mpg) +
geom_line(mapping = aes(x = displ, y = hwy))

#Pude?kowy
ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = displ, y = hwy))

#Histogram
ggplot(data = mpg,mapping = aes(y = hwy)) +
  geom_histogram()

#Warstwowy
ggplot(data = mpg,mapping = aes(x = displ, y = hwy)) +
  geom_area()


#2
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)
#Nie spodziewalem sie ze bedzie tu tyle lini.Spodziewa?em si? jednej. Jak wida? dla ka?dej warto?ci drv stworzono lini?.

#3
?geom_smooth()
#show.legend - Czy ta warstwa powinna znale?? si? w legendach? NA, domy?lnie, obejmuje mapowanie estetyki. FALSE nigdy nie obejmuje, a TRUE zawsze obejmuje. Mo?e to by? r?wnie? nazwany wektor logiczny, aby precyzyjnie wybra? estetyk? do wy?wietlenia.
#Gdy show.legend=FALSE to nie zawiera tej warstwy w legendach. 
#Gdy nie bedzie tej lini to NA a wiec bedzie ta wastwa w legendach. 
#U?yto go by nie pokazywa? warstwy w legendach.

#4
?geom_smooth()
#Wy?wietla to przedzia? ufno?ci wok?? lini na wykresie

#5
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()
#W ggplot mamy konfiguracje 

ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))
#W warstwach mamy konfiguracje
#Nie, bo warstwy tego wykresu otrzymuja konfiguracj? z ggplot.


#6
install.packages("cowplot")
library(cowplot)

w1=ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy),se=FALSE)

w2=ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv),se=FALSE)+
  geom_point(mapping = aes(x = displ, y = hwy))

w3=ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy,color=drv))+
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    se=FALSE
  )

w4=ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = drv)) + 
  geom_smooth(se=FALSE)

w5=ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy,color=drv))+
  geom_smooth(
    mapping = aes(x = displ, y = hwy, linetype = drv),
    se=FALSE
  )

w6=ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = drv)) + 
  geom_point(shape=21 ,color="white",stroke=1)

plot_grid(w1, w2, w3, w4, w5, w6, nrow = 3,ncol=2)

#3.7.1
#1
#stat_summary() odpowiada funkcja geom_pointrange()
max=max(diamonds$depth)
min=min(diamonds$depth)
ggplot(data = diamonds,aes(x=cut,y=depth)) +
geom_pointrange(aes(ymin = min, ymax = max))

#2
?geom_col()
#geom_bar () sprawia, ?e wysoko?? s?upka jest proporcjonalna do liczby przypadk?w w ka?dej grupie (lub, je?li podano estetyk? wagi, do sumy wag). Je?li chcesz, aby wysoko?ci s?upk?w reprezentowa?y warto?ci w danych, u?yj zamiast tego geom_col (). geom_bar () domy?lnie u?ywa stat_count (): zlicza liczb? obserwacji w ka?dej pozycji x. geom_col () u?ywa stat_identity (): pozostawia dane bez zmian.
#U?ywaj? innych funkcji.

#3
#stat_count() - geom_bar()
#stat_summary() - geom_pointrange()
#stat_bin() - geom_freqpoly()
#stat_density() - geom_density()
#stat_bin_2d() - geom_bin2d()
#stat_contour() - geom_contour()
#stat_smooth() - geom_smooth()
#Maja ze sob? wspolna liste parametrow.

#4
?stat_smooth()
#Pomaga oku w dostrzeganiu wzorc?w w obecno?ci nadkre?lenia. geom_smooth () i stat_smooth () s? w rzeczywisto?ci aliasami: oba u?ywaj? tych samych argument?w. U?yj stat_smooth (), je?li chcesz wy?wietli? wyniki z niestandardow? geometri?.
#Parametry:mapping,data,geom,position,method,formula,se,n,span,fullrange,level,method.args,na.rm,orientation,show.legends,inherit.aes.
#Obliczone zmienne:y,ymin,ymax,se

#5
#Musielismy z niego skorzystac bo wykres bez niego nie ma sensu.
#Gdy u?ywamy prop nale?y doda? argument group=1
#Prop to grupowa proporcja dlatego nale?y u?y? tego parametru group=1
#Nale?y dodac parametr group=1 do obu wykres?w
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop..,group=1))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = color, y = ..prop..,group=1))

#3.8.1
#1
#Ten wykres nie zawiera wszystkich obserwacji
ggplot(data = mpg, mapping = aes(x = cty, y = hwy,position = "jitter")) + 
  geom_point()

#2
?geom_jitter()
#Parametry width,height

#3
?geom_jitter()
#Dodaje niewielk? ilo?? losowych odchyle? do lokalizacji ka?dego punktu i jest u?ytecznym sposobem radzenia sobie z nadmiernym wykresem spowodowanym dyskretno?ci? w mniejszych zbiorach danych.
?geom_count()
#To jest wariant geom_point (), kt?ry zlicza liczb? obserwacji w ka?dej lokalizacji, a nast?pnie mapuje liczb? do obszaru punktu. Jest to przydatne, gdy masz dyskretne dane i nadrukowywanie.
#4
?geom_boxplot()
#Domy?lna pozycja to dodge2
ggplot(data = mpg, mapping = aes(x = class, y = hwy),position="dodge2") + 
  geom_boxplot()
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot()

#3.9.1
#1
bar <- ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = 0, fill = cut), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

bar + coord_flip()
bar + coord_polar(theta = "y")

#2
?labs()
#Modyfikuje etykiety osi, legend, i wekres?w.

#3
?coord_map()
#Coord_map() Rzutuje cz??? ziemi, kt?ra jest w przybli?eniu kulista, na p?ask? p?aszczyzn? 2D przy u?yciu dowolnego rzutowania zdefiniowanego przez pakiet mapproj. Rzuty mapy na og?? nie zachowuj? linii prostych, wi?c wymaga to znacznych oblicze?. 
#coord_quickmap to szybkie przybli?enie, kt?re zachowuje proste linie. Dzia?a najlepiej na mniejszych obszarach bli?ej r?wnika.

#4
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() + 
  geom_abline() + 
  coord_fixed()

#Mamy tu zale?no?? spalania w mie?cie w milach na gallon a na autostradzie w milach na galon.
#Wida? ?e spalanie na autostradzie jest wi?ksze od tego w mie?cie w przedstawionych samochodach.
#coord_fixed zapewnia nam Wsp??rz?dne kartezja?skie ze sta?ym ?wsp??czynnikiem proporcji?
#Lepiej wyglada ten wykres po dodaniu coord_fixed
?geom_abline()
#Ta funkcja dodaje lini? odniesienia na tym wykresie

