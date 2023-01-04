library(tidyverse)
#5.2.1
#1.
ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth(se = FALSE) +
  labs(
    title = "Wydajnoœæ zu¿ycia paliwa maleje wraz z objêtoœci¹ skokow¹",
    subtitle = "Dwa samochody sportowe s¹ wyj¹tkiem, ze wzglêdu na ich niewielk¹ masê",
    caption = "Dane pochodz¹ ze strony fueleconomy.gov",
    x = "Pojemnoœæ skokowa silnika [l]",
    y= "Spalanie na autostradzie [mila/gallon]",
    colour = "Rodzaj samochodu"
  )


#5.3.1
#1.
label <- tibble(
  x=c(-Inf,-Inf,Inf,Inf),
  y=c(-Inf, Inf,-Inf,Inf),
  label=c("x","x","x","x"),
  hjust=c(0,0,1,1),
  vjust=c(0,1.0,0,1)
)

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_text(data=label,aes(x=c(-Inf,-Inf,Inf,Inf),y=c(-Inf, Inf,-Inf,Inf),hjust=c(0,0,1,1),
                                    vjust=c(0,1.0,0,1),label=c("x","x","x","x")))

#2.
?annotate()
p <- ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point()
p + annotate("text", x = 4, y = 25, label = "Some text")
#tak nie trzeba tworzyæ danych typu tibble.

#3.
#Gdy taka prosta etykiete to mamy ja na kazdym panelu.
label <- tibble(
  label = "x"
)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ drv, nrow = 2)+
  geom_text(data = label, aes(x = 10,  y = 10, label = label))



#rozne etykiety na kazdym panelu
label <- tibble(
  label = c("x","xx","xxx"),
  drv = c("4", "f","r")
)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ drv, nrow = 2)+
  geom_text(data = label, aes(x = 10,  y = 10, label = label))

#etykieta do pojedynczego panelu
label <- tibble(
  label = c("x"),
  drv = c("4")
)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ drv, nrow = 2)+
  geom_text(data = label, aes(x = 10,  y = 10, label = label))

#4.
?geom_label()
#argumenty te to:label.padding,label.r,label.size

#5.
?arrow()
#Argumenty: angle,length,ends,type
#Angle-K¹t grotu strza³ki w stopniach (mniejsze liczby daj¹ wê¿sze, bardziej szczegó³owe strza³ki).
#ends-Jeden z „ostatni”, „pierwszy” lub „oba”, wskazuj¹cy, które koñce linii maj¹ narysowaæ groty strza³ek. 
#length - Jednostka okreœlaj¹ca d³ugoœæ grotu strza³y (od czubka do podstawy).
#type -ustawia typ danej strzalki Jeden z „otwarty” lub „zamkniêty” wskazuj¹cy, czy grot strza³ki powinien byæ zamkniêtym trójk¹tem.

strzalka=arrow(angle = 10, length = unit(0.5, "inches"),
               ends = "last", type = "open")

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_segment(x=0,y=0,arrow=strzalka,xend=5,yend=40)

strzalka=arrow(angle = 80, length = unit(0.1, "inches"),
               ends = "both", type = "closed")

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_segment(x=0,y=0,arrow=strzalka,xend=5,yend=40)

strzalka=arrow(angle = 20, length = unit(10, "inches"),
               ends = "last", type = "closed")

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_segment(x=0,y=0,arrow=strzalka,xend=5,yend=40)

#5.4.4
#1.
df <- tibble(
  x = rnorm(10000),
  y = rnorm(10000)
)
ggplot(df, aes(x, y)) +
  geom_hex() +
  scale_colour_gradient(low = "white", high = "red") +
  coord_fixed()
#geom_hex() uzywa estetyki fill a scale_colour_gradient() uzywa estetyki color i dlatego skala nie zostaje przyslonieta.

#2.
?scale_x_log10()
#Pierwszy argument w kazdej skali to name. a w labs pierwszym argumentem jest lista nowych par nazwa-wartoœæ. Nazwa powinna byæ estetyk¹.
#W skalach mozna ustawic nazwe osi tak jak za pomoca funkcji labs(). Za pomoca labs mozemy zmieniac wiecej etykiet niz za pomoca skal.
#scale_y_continuous(name="xd",labels=y,breaks = x)
#labs(x="xd",y="p")
?labs()

#3.
x<-seq(by=1,(34),(44))
y<-c("Eisenhower (34)", "Kennedy (35)", "Johnson (36)" ,"Nixon (37)" ,"Ford (38)", "Carter (39)","Reagan (40)","Bush (41)","Clinton (42)","Bush (43)","Obama (44)")
presidential %>%
mutate(id = 33 + row_number()) %>%
ggplot(aes(start, id, colour = party)) +
geom_point() +
geom_segment(aes(xend = end, yend = id)) +
scale_colour_manual(values = c(Republican = "red", Democratic = "blue"))+
labs(x = "",
     y = ""
)+
scale_y_continuous(labels=y,breaks = x)+
scale_x_date(date_breaks = "4 years",date_labels = "'%y")


#4.
ggplot(diamonds, aes(carat, price)) +
  geom_point(aes(colour = cut), alpha = 1/20)+
  theme(legend.position = "bottom") +
  guides(colour = guide_legend(nrow = 1, override.aes = list(alpha=1)))

