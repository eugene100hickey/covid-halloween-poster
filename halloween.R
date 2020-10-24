library(tidyverse)
library(emojifont)
library(showtext)
library(magick)
library(here)



font_add("Gypsy Curse", "/home/eugene/.fonts/Font2/Gypsy Curse.ttf")
font_add("Ghastly Panic", "/home/eugene/.fonts/Font1/Ghastly Panic.ttf")

corona <- image_read(here("images", "covid.jpg")) %>% 
  image_crop("625x900+185+50") %>% 
  image_draw()
rect(xleft = 0, ybottom = 150, xright = 400, ytop = 0, border = NA, col = "#FFEE00")
text(200, 100, "Coronavirus", family = "Gypsy Curse", cex = 8)
text(130, 200, "Covid-19", family = "Ghastly Panic", cex = 6)

# Sat Oct 24 12:01:44 2020 ------------------------------

spider <- image_graph(width = 300, height = 400, res = 50)
ggplot() + 
  geom_emoji("spider", color='black') + 
  theme_void() + 
  theme(panel.background = element_rect(fill = "#FFEE00"))
spider <- image_crop(spider, "299x399+1+1") %>% 
  image_scale(50)
bat <- image_graph(width = 300, height = 400, res = 50)
ggplot() + 
  geom_emoji("bat", color='black') + 
  theme_void() + 
  theme(panel.background = element_rect(fill = "#FFEE00"))
bat <- image_crop(bat, "299x399+1+1") %>% 
  image_scale(50)
skull <- image_graph(width = 300, height = 400, res = 50)
ggplot() + 
  geom_emoji("skull", color='black') + 
  theme_void() + 
  theme(panel.background = element_rect(fill = "#FFFFFF")) 
skull <- image_crop(skull, "299x399+1+1") %>% 
  image_scale(50)

corona %>% image_composite(spider) %>% 
  image_composite(bat, offset = "+200") %>% 
  image_composite(skull, offset = "+150+270") %>% 
  image_composite(skull, offset = "+422+270")

