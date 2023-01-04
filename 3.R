install.packages("tidyverse")
library(tidyverse)

#3.2.4
#1.
ggplot(data = mpg)
#Nic nie widaæ na wykresie

#2.
?mtcars
#11 kolumn i 32 wiersze

#3.
?mpg
#drv to rodzaj uk³adu napêdowego, gdzie f = napêd na przednie ko³a, r = napêd na tylne ko³a, 4 = naped na 4 kola

#4.
ggplot(data = mpg) +  geom_point(mapping = aes(x = hwy, y = cyl))
#ladny wykres

#5.
ggplot(data = mpg) +  geom_point(mapping = aes(x = class, y = drv))
#ten wykres pokazuje jaki ma naped dany typ samochodu
#Class i drv to zmienne kategorialne.
#Nie pokazuje on nam ¿adnych ciekawych zaleznosci te dane mozna sprawdzic w internecie.

#3.3.1
#1.
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
#zle sa postawione nawiasy tutaj.
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), color = "blue")
#powinno byæ tak
#Kolor ustawiono w estetyce a nie jako argument funkcji geom_point dlatego nie jest to niebieski. 
#blue nie jest to zmienna dlatego jest to czerwony kolor.

#2.
?mpg
mpg
#ciagle to:displ,year,cyl,cty,hwy
#kategorialne to:manufacturer,model,trans,drv,fl,class

#3
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = cyl, size = hwy, shape = class))
#Gdy mamy zmienna ci¹g³a wyœwietlana jest skala a gdy kategorialna to wyœwietlane s¹ nazwy kategorii.

#4
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = cty, size = cty))
#Nak³adaj¹ siê na siebie.

#5
?geom_point
#W przypadku kszta³tów, które maj¹ obramowanie (np. 21), mo¿esz pokolorowaæ wnêtrze i
# na zewn¹trz oddzielnie. Estetyki stroke u¿ywamy, aby zmodyfikowaæ szerokoœæ obramowania punktu.

#6
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, colour = displ < 5))
#Estetyka jest stosowana do obliczonego tutaj warunku.

#3.5.1
#1
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ hwy)
#Wtedy mamy panele dla ka¿dej wartoœci zmiennej hwy.

#2
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))

#Zale¿noœæ:
#Puste komórka jest tam gdzie nie ma kropki na tym drugim wykresie.
#Jak nie ma kropki na drugim wykresie to jest pusta komórka na pierwszym.

#3
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)
#Wykres hwy od displ podzielony na 3 panele

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)
#Wykres hwy od displ podzielony na 4 panele
#Kropka zastêpuje nazwe zwiennej.
#zmienna~. pokazuje wiele wierszy dla kazdej wartosci zmiennej.
#.~zmienna pokazuje wiele kolumn dla kazdej wartosci zmiennej.

#4
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy,color=class))
#Tutaj widzimy do jakiej klasy nalezy dany punkt.

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
#Widzimy podzia³ na klasy 

#Korzyœci:
#Dziêki panelom mozemy przejrzec poszczegolne klasy.
#Dzieki estetykom widac podzial calosciowy punktow na klasy.
#Panele s¹ dla mnie bardziej czytelne niz estetyki.
#Gdy nasz zbiór danych jest wielki panele mog¹ byæ nieczytelne lepiej bedzie uzyc estetyki.

#5
?facet_wrap
#nrow to liczba wierszy - w ile wierszy ustawimy panele
#ncol to liczba kolumn - w ile kolumn ustawimy panele
#Opcje kontrolujace uk³ad paneli:shrink,scales.
#scales-czy skale powinny byæ sta³e („sta³e”, wartoœæ domyœlna), wolne („wolne”) lub wolne w jednym wymiarze („wolne_x”, „wolne_y”).
#shrink-Jeœli PRAWDA, zmniejszy skale, aby dopasowaæ wyniki statystyk, a nie surowe dane. Jeœli FALSE, bêdzie zakres surowych danych przed podsumowaniem statystycznym.
?facet_grid()
#Dlatego ,¿e ta funkcja przyjmuje rows i cols. Rows i cols to zestawy zmiennych.

#6
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(class ~ manufacturer)
#Gdy dajemy tak¹ zmienna widac ze kropki sie nakladaja na siebie.Lepiej dac zmienna o bardziej unikalnych wartosciach by temu zapobiec.

#3.6.1
#1
#Liniowy
ggplot(data = mpg) +
geom_line(mapping = aes(x = displ, y = hwy))

#Pude³kowy
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
#Nie spodziewalem sie ze bedzie tu tyle lini.Spodziewa³em siê jednej. Jak widaæ dla ka¿dej wartoœci drv stworzono liniê.

#3
?geom_smooth()
#show.legend - Czy ta warstwa powinna znaleŸæ siê w legendach? NA, domyœlnie, obejmuje mapowanie estetyki. FALSE nigdy nie obejmuje, a TRUE zawsze obejmuje. Mo¿e to byæ równie¿ nazwany wektor logiczny, aby precyzyjnie wybraæ estetykê do wyœwietlenia.
#Gdy show.legend=FALSE to nie zawiera tej warstwy w legendach. 
#Gdy nie bedzie tej lini to NA a wiec bedzie ta wastwa w legendach. 
#U¿yto go by nie pokazywaæ warstwy w legendach.

#4
?geom_smooth()
#Wyœwietla to przedzia³ ufnoœci wokó³ lini na wykresie

#5
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()
#W ggplot mamy konfiguracje 

ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))
#W warstwach mamy konfiguracje
#Nie, bo warstwy tego wykresu otrzymuja konfiguracjê z ggplot.


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
#geom_bar () sprawia, ¿e wysokoœæ s³upka jest proporcjonalna do liczby przypadków w ka¿dej grupie (lub, jeœli podano estetykê wagi, do sumy wag). Jeœli chcesz, aby wysokoœci s³upków reprezentowa³y wartoœci w danych, u¿yj zamiast tego geom_col (). geom_bar () domyœlnie u¿ywa stat_count (): zlicza liczbê obserwacji w ka¿dej pozycji x. geom_col () u¿ywa stat_identity (): pozostawia dane bez zmian.
#U¿ywaj¹ innych funkcji.

#3
#stat_count() - geom_bar()
#stat_summary() - geom_pointrange()
#stat_bin() - geom_freqpoly()
#stat_density() - geom_density()
#stat_bin_2d() - geom_bin2d()
#stat_contour() - geom_contour()
#stat_smooth() - geom_smooth()
#Maja ze sob¹ wspolna liste parametrow.

#4
?stat_smooth()
#Pomaga oku w dostrzeganiu wzorców w obecnoœci nadkreœlenia. geom_smooth () i stat_smooth () s¹ w rzeczywistoœci aliasami: oba u¿ywaj¹ tych samych argumentów. U¿yj stat_smooth (), jeœli chcesz wyœwietliæ wyniki z niestandardow¹ geometri¹.
#Parametry:mapping,data,geom,position,method,formula,se,n,span,fullrange,level,method.args,na.rm,orientation,show.legends,inherit.aes.
#Obliczone zmienne:y,ymin,ymax,se

#5
#Musielismy z niego skorzystac bo wykres bez niego nie ma sensu.
#Gdy u¿ywamy prop nale¿y dodaæ argument group=1
#Prop to grupowa proporcja dlatego nale¿y u¿yæ tego parametru group=1
#Nale¿y dodac parametr group=1 do obu wykresów
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
#Dodaje niewielk¹ iloœæ losowych odchyleñ do lokalizacji ka¿dego punktu i jest u¿ytecznym sposobem radzenia sobie z nadmiernym wykresem spowodowanym dyskretnoœci¹ w mniejszych zbiorach danych.
?geom_count()
#To jest wariant geom_point (), który zlicza liczbê obserwacji w ka¿dej lokalizacji, a nastêpnie mapuje liczbê do obszaru punktu. Jest to przydatne, gdy masz dyskretne dane i nadrukowywanie.
#4
?geom_boxplot()
#Domyœlna pozycja to dodge2
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
#Modyfikuje etykiety osi, legend, i wekresów.

#3
?coord_map()
#Coord_map() Rzutuje czêœæ ziemi, która jest w przybli¿eniu kulista, na p³ask¹ p³aszczyznê 2D przy u¿yciu dowolnego rzutowania zdefiniowanego przez pakiet mapproj. Rzuty mapy na ogó³ nie zachowuj¹ linii prostych, wiêc wymaga to znacznych obliczeñ. 
#coord_quickmap to szybkie przybli¿enie, które zachowuje proste linie. Dzia³a najlepiej na mniejszych obszarach bli¿ej równika.

#4
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() + 
  geom_abline() + 
  coord_fixed()

#Mamy tu zale¿noœæ spalania w mieœcie w milach na gallon a na autostradzie w milach na galon.
#Widaæ ¿e spalanie na autostradzie jest wiêksze od tego w mieœcie w przedstawionych samochodach.
#coord_fixed zapewnia nam Wspó³rzêdne kartezjañskie ze sta³ym „wspó³czynnikiem proporcji”
#Lepiej wyglada ten wykres po dodaniu coord_fixed
?geom_abline()
#Ta funkcja dodaje liniê odniesienia na tym wykresie

