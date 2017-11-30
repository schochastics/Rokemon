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

#' HP bar chart
#'
#'A barchart in the style of a HP bar.
#'
#'@param data data.frame.
#'@param names column name of names to use in the plot.
#'@param values column name of values to plot.
#'@param sort.names order names according to value (TRUE, default) or not (FALSE).
#'@param init.size size of the healthbar. See details.
#'@param cuts numeric vector of length 3. See details.
#'
#'@details \code{init.size} controls the height of the bar. The more names are used, the smaller
#'the value should be. The values in \code{cuts} should be decreasing in the interval (0,1).
#'
#'@export
#'@examples
#'\dontrun{
#'gghealth(pokemon[1:10,],"name","base_total",init.size = 5)+
#'  labs(x="",y="Stats Total")
#'}
gghealth <- function(data,names,values,sort.names=TRUE,
                     init.size=3,cuts = c(0.8,0.4,0.2)){

  fracs <- (data[[values]]-min(data[[values]]))/(max(data[[values]])-min(data[[values]]))
  max_val <- max(data[[values]])
  init.size <- max(init.size,3)

  if(sort.names){
    ordered <- order(data[[values]])
  } else{
    ordered <- 1:nrow(data)
  }

  data[[names]] <- factor(data[[names]],levels = data[[names]][ordered])
  hp_col <- 0
  hp_col[fracs<cuts[3]] <- 4
  hp_col[fracs>=cuts[3]] <- 3
  hp_col[fracs>=cuts[2]] <- 2
  hp_col[fracs>=cuts[1]] <- 1

  data[["hp_col"]] <- factor(hp_col,levels=1:4)

  p <- ggplot2::ggplot(data,ggplot2::aes_string(x = names))+
    ggplot2::geom_segment(ggplot2::aes_string(xend = names),yend = max_val,y = 0,
                     size = init.size,lineend = "round")+
    ggplot2::geom_segment(ggplot2::aes_string(xend = names),yend = max_val,y = 0,
                     size = init.size-1,lineend = "round",colour = "white")+
    ggplot2::geom_segment(ggplot2::aes_string(xend = names,yend = values, colour = "hp_col"),
                     y = 0,size = init.size-1,lineend = "butt")+
    ggplot2::scale_colour_manual(values = c(`1`="#66CD00",`2`="#609869",`3`="#FB9400",`4`="#FF4400"))+
    ggplot2::coord_flip()+
        theme_status()
  p
}


