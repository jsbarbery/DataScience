 
#load dataset

hotel_bookings <- read.csv('C:/Users/Luis Villamar/Desktop/John B/R/hotel_bookings.csv')

head(hotel_bookings)

# Encontrar si familias con niños reservan mas temprano

ggplot(data=hotel_bookings)+
  geom_point(mapping=aes(x=lead_time,y=children))

#revisar si familias con niños reservan los fines de semana

ggplot(data=hotel_bookings)+
  geom_point(mapping=aes(x=stays_in_weekend_nights,y=children))

#grafico de barras de distribution channel

ggplot(data=hotel_bookings)+
  geom_bar(mapping=aes(x=distribution_channel))

#discriminar si cada booking tuvo deposito

ggplot(data=hotel_bookings)+
  geom_bar(mapping=aes(x=distribution_channel,fill = market_segment))

#facets depending on deposit tipe

ggplot(data=hotel_bookings)+
  geom_bar(mapping=aes(x=distribution_channel))+
  facet_wrap(~deposit_type)

ggplot(data=hotel_bookings)+
  geom_bar(mapping=aes(x=distribution_channel))+
  facet_wrap(~market_segment)

ggplot(data=hotel_bookings)+
  geom_bar(mapping=aes(x=distribution_channel,color=market_segment))+
  facet_wrap(~deposit_type~market_segment)

# filters - review
data=hotel_bookings %>% 
  filter(distribution_channel<1) %>% 
ggplot()+
  geom_bar(mapping=aes(x=distribution_channel,color=market_segment))+
  facet_wrap(~deposit_type~market_segment)

#option filtering, create new dataset with filtered values
# & to specify which column in hotelbookings
onlineta_city_hotels <- filter(hotel_bookings,hotel=='City Hotel'&hotel_bookings$market_segment=='Online TA')
view(onlineta_city_hotels)

# with piping method
onlineta_cityhotels_v2 <- hotel_bookings %>% 
  filter(hotel=='City Hotel') %>% 
  filter(market_segment=='Online TA')



