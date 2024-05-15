library('palmerpenguins')
skim_without_charts(penguins)
glimpse(penguins)
head(penguins)

penguins %>% 
  rename(island_new=island)

penguins %>% arrange(bill_length_mm)


penguins2 <- penguins %>%  arrange(-bill_length_mm)
view(penguins2)
penguins2 %>%  group_by(island) %>%  drop_na() %>%  summarise(mean_bill_length_mm=mean(bill_length_mm))

penguins2 %>%  group_by(island) %>%  drop_na() %>%  summarise(max_bill_length_mm=max(bill_length_mm))


penguins2 %>%  group_by(species,island) %>%  drop_na() %>%  summarise(max_bl=max(bill_length_mm,mean_bl=mean(bill_depth_mm)))


penguins %>%  filter(species== 'Adelie')

# relation between flipper length and bodymass

ggplot(data=penguins)+
geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g))

# alternative
ggplot(data=penguins,mapping = aes(x=flipper_length_mm,y=body_mass_g))+
geom_point()

ggplot(data=penguins)+
geom_point(mapping=aes(x=bill_length_mm,y=bill_depth_mm))


?geom_bar

# separar los puntos por color depensiendo la especie

ggplot(data=penguins)+
  geom_point(mapping = aes(x=flipper_length_mm,y=body_mass_g,color=species,shape=species, alpha = species))

ggplot(data=penguins)+
  geom_smooth(mapping = aes(x=flipper_length_mm,y=body_mass_g,color=species,shape=species, alpha = species))

ggplot(data=penguins)+
  geom_jitter(mapping = aes(x=flipper_length_mm,y=body_mass_g,color=species,shape=species, alpha = species))

# bar graphs
ggplot(data=penguins)+
  geom_bar(mapping = aes(x=flipper_length_mm,fill=species))

ggplot(data=penguins)+
  geom_bar(mapping = aes(x=flipper_length_mm,color=species))

#facets

ggplot(data=penguins)+
  geom_point(mappin=aes(x=flipper_length_mm,y=body_mass_g,color=species))+
  facet_wrap(~species)

ggplot(data=penguins)+
  geom_point(mappin=aes(x=flipper_length_mm,y=body_mass_g,color=species))+
  facet_grid(sex~species)

#labels

ggplot(data=penguins)+
  geom_point(mapping = aes(x=flipper_length_mm,y=body_mass_g,color=species))+
  labs(title = 'Palmer Penguins: Body Mass vs. Flipper Length',
       subtitle = 'Penguins Species',caption='Data Collected by Dr. Kristen Gorman')

#Annotations

ggplot(data=penguins)+
  geom_point(mapping = aes(x=flipper_length_mm,y=body_mass_g,color=species))+
  labs(title = 'Palmer Penguins: Body Mass vs. Flipper Length',
       subtitle = 'Penguins Species',caption='Data Collected by Dr. Kristen Gorman')+
       annotate('text', x=220,3500,label='the Gentoos are the largest')
p <- ggplot(data=penguins)+
  geom_point(mapping = aes(x=flipper_length_mm,y=body_mass_g,color=species))+
  labs(title = 'Palmer Penguins: Body Mass vs. Flipper Length',
       subtitle = 'Penguins Species',caption='Data Collected by Dr. Kristen Gorman')

p + annotate('text', x=220,3500,label='the Gentoos are the largest')

# ggsave() function to save plot
