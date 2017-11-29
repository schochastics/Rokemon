# GeomHealthbar <- ggproto("GeomHealthbar",Geom,
#                          required_aes = c('x','y'),
#                          default_aes = aes(size = 10),
#                          draw_key = draw_key_abline,
#                          draw_panel = function(data, panel_scales,coord){
#                            coords <- coord$transform(data, panel_scales)
#                            grid::segmentsGrob(x0 = coords$x,x1 = coords$x,
#                                               y0 = 0,y1 = 1,
#                                               default.units = "native",
#                                               gp = grid::gpar(colour="yellow",size = coords$size,lineend="round"))#+
#                            # grid::segmentsGrob(x0 = coord$x,x1 = coord$x,
#                            #                    y0 = 0,y1 = 1,default.units = "npc",
#                            #                    gp = grid::gpar(colour="white",size = 2,lineend="round"))+
#                            # grid::segmentsGrob(x0 = coord$x,x1 = coord$x,
#                            #                    y0 = 0,y1 = coord$y,default.units = "npc",
#                            #                    gp = grid::gpar(colour="green",size = 1,lineend="square"))
#                          }
# )
#
# geom_healthbar <-  function(mapping = NULL, data = NULL, stat = "identity",
#                             position = "identity", show.legend = NA,
#                             inherit.aes = TRUE, ...) {
#   layer(
#     geom = GeomHealthbar, mapping = mapping, data = data, stat = stat,
#     position = position, show.legend = show.legend, inherit.aes = inherit.aes,
#     params = list(...)
#   )
# }
#
# pokemon %>% .[1:50,] %>%
#   mutate(defense=defense/max(defense)) %>%
#   ggplot(aes(x=reorder(name,defense)))+geom_healthbar(aes(y=defense))+coord_flip()

gghealth <- function(data,names,values,init.size=3,cuts = c(0.5,0.25)){
  data[[values]] <- data[[values]]/max(data[[values]])
  init.size <- max(init.size,3)
  hp_col <- factor(ifelse(data[[values]]>cuts[1],1,
                          ifelse(data[[values]]>cuts[2],2,3)))
  data[["hp_col"]] <- hp_col

  p <- ggplot2::ggplot(data,ggplot2::aes_string(x = names))+
    ggplot2::geom_segment(ggplot2::aes_string(xend = names),yend = 1,y = 0,
                     size = init.size,lineend = "round")+
    ggplot2::geom_segment(ggplot2::aes_string(xend = names),yend = 1,y = 0,
                     size = init.size-1,lineend = "round",colour = "white")+
    ggplot2::geom_segment(ggplot2::aes_string(xend = names,yend = values, colour = "hp_col"),
                     y = 0,size = init.size-1,lineend = "butt")+
    ggplot2::scale_colour_manual(values = c("#609869","#FB9400","#FF4400"))+
    ggplot2::coord_flip()+
        theme_status()
  p
}


