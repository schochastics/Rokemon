#' Classic Gamyboy inspired ggplot theme
#'
#' Theme based on the first generation of the Gameboy.
#'
#' @export
#' @examples
#' \dontrun{
#' library(ggplot2)
#'
#' ggplot(pokemon,aes(attack,defense))+
#'  geom_point(shape = 15,col = c("#006400"),size=2)+
#'  theme_gameboy()+
#'  labs(title = "Classic Gameboy Theme")
#'}
theme_gameboy <- function() {
  title_font <- "pokemon-font"

  gb <- ggplot2::theme(panel.grid = ggplot2::element_blank(),
          # panel.grid.major = ggplot2::element_line(colour="#008B00"),
          panel.background = ggplot2::element_rect(fill="#79BC00"),
          panel.border = ggplot2::element_rect(fill=NA,colour="#8F8B8F",size=4),
          plot.background = ggplot2::element_rect(fill="#C1BDB7"),
          text = ggplot2::element_text(family = "pokemon-font"),
          plot.title = ggplot2::element_text(family = title_font,colour="#561E94"),
          plot.subtitle = ggplot2::element_text(family = title_font,colour="#561E94"),
          axis.ticks = ggplot2::element_line(colour="#8F8B8F"),
          legend.background = ggplot2::element_rect(fill="#C1BDB7"),
          legend.position = "bottom",
          legend.text = ggplot2::element_text(colour="#561E94"),
          legend.key = ggplot2::element_rect(fill="#C1BDB7",colour="black"),
          plot.caption = ggplot2::element_text(colour = "#A20055"))
  return(gb)
}
#-------------------------------------------------------------------------------
#' Gamyboy Advanced inspired ggplot theme
#'
#' Theme based on the Gameboy Advanced.
#'
#' @export
#' @examples
#' \dontrun{
#' library(ggplot2)
#'
#' ggplot(pokemon,aes(attack,defense))+
#'  geom_point(shape = 15,col = c("#006400"),size=2)+
#'  theme_gameboy()+
#'  labs(title = "Classic Gameboy Theme")
#'}
theme_gba <- function() {
  title_font <- "pokemon-font"

  gb <- ggplot2::theme(panel.grid = ggplot2::element_blank(),
               panel.background = ggplot2::element_rect(fill="#00BFFF"),
               panel.border = ggplot2::element_rect(fill=NA,colour="black",size=4),
               plot.background = ggplot2::element_rect(fill="#68228B"),
               text = ggplot2::element_text(family = "pokemon-font"),
               plot.title = ggplot2::element_text(family = title_font,colour="black"),
               plot.subtitle = ggplot2::element_text(family = title_font,colour="black"),
               axis.ticks = ggplot2::element_line(colour="black"),
               axis.text = ggplot2::element_text(colour="#8F8B8F"),
               axis.title = ggplot2::element_text(colour="#8F8B8F"),
               legend.background = ggplot2::element_rect(fill="#68228B"),
               legend.position = "bottom",
               legend.text = ggplot2::element_text(colour="#8F8B8F"),
               legend.key = ggplot2::element_rect(fill="#68228B",colour="black"),
               plot.caption = ggplot2::element_text(colour = "#8F8B8F"))
  return(gb)
}

#-------------------------------------------------------------------------------
#' Health bar theme
#'
#' Theme used in gghealth.
#'
#'
#' @export
theme_status <- function(){
    hp <- ggplot2::theme(legend.position="none",
            axis.line = ggplot2::element_line(size = 1,lineend = "square"),
            axis.text.y = ggplot2::element_text(family = "pokemon-font",colour = "#ecdb6d"),
            axis.text.x = ggplot2::element_text(family = "pokemon-font",colour = "#ecdb6d"),
            axis.title = ggplot2::element_text(family = "pokemon-font",colour = "#ecdb6d"),
            plot.title = ggplot2::element_text(family = "pokemon-font",colour = "#ecdb6d"),
            plot.subtitle = ggplot2::element_text(family = "pokemon-font",colour = "#ecdb6d"),
            plot.caption = ggplot2::element_text(family = "pokemon-font",colour = "#ecdb6d"),
            axis.ticks.x = ggplot2::element_line(colour = "#ecdb6d"),
            axis.ticks.y = ggplot2::element_line(colour = "#ecdb6d"),
            plot.background = ggplot2::element_rect(fill = "black"),
            panel.background = ggplot2::element_rect(fill = "white"),
            panel.grid = ggplot2::element_blank(),
            strip.background = ggplot2::element_rect(fill="#ecdb6d"),
            strip.text = ggplot2::element_text(family = "pokemon-font",colour = "black"))
    return(hp)
}

#-------------------------------------------------------------------------------
#' Theme Rocket
#'
#' ggplot theme of Team Rocket. Meowth that's right!
#'
#' @param ... additional parameters to ggplot2::theme()
#'
#' @export
#' @examples
#' \dontrun{
#' #create a Pokemon type effectiveness chart
#' library(tidyverse)
#'
#' pokemon %>%
#'   distinct(type1,.keep_all=TRUE) %>%
#'   select(defender = type1,against_bug:against_water) %>%
#'   gather(attacker,effect,against_bug:against_water) %>%
#'   mutate(attacker = str_replace_all(attacker,"against_",""))  %>%
#'   ggplot(aes(y=attacker,x=defender,fill=factor(effect)))+
#'   geom_tile()+
#'   geom_text(aes(label=ifelse(effect!=1,effect,"")))+
#'   scale_fill_manual(values=c("#8B1A1A", "#CD2626", "#EE2C2C", "#FFFFFF", "#00CD00", "#008B00"))+
#'   theme_rocket(legend.position="none")+
#'   labs(title="Effectiveness Table")
#' }
theme_rocket <- function(...){
  rocket <- ggplot2::theme(panel.background = ggplot2::element_rect(fill="#FFFFFF",colour=NA),
        plot.background =  ggplot2::element_rect(fill="#0F0F0F",colour=NA),
        panel.grid.minor = ggplot2::element_blank(),
        panel.grid.major = ggplot2::element_line(colour="#DEBD39",linetype = 8),
        axis.title.x = ggplot2::element_text(colour = "#EE30A7"),
        axis.text.x = ggplot2::element_text(colour = "#EE30A7"),
        axis.line.x = ggplot2::element_line(colour = "#EE30A7",size=1.5,lineend = "square"),
        axis.ticks.x = ggplot2::element_line(colour = "#EE30A7"),
        axis.title.y = ggplot2::element_text(colour = "#8968CD"),
        axis.text.y = ggplot2::element_text(colour = "#8968CD"),
        axis.line.y = ggplot2::element_line(colour = "#8968CD",size=1.5,lineend = "square"),
        axis.ticks.y = ggplot2::element_line(colour = "#8968CD"),
        plot.title = ggplot2::element_text(colour="#DEBD39"),
        plot.subtitle = ggplot2::element_text(colour="#DEBD39"),
        plot.caption = ggplot2::element_text(colour="#DEBD39"),
        strip.background = ggplot2::element_rect(fill="#0F0F0F",colour=NA),
        strip.text = ggplot2::element_text(colour="#DEBD39"),
        legend.background = ggplot2::element_rect(fill="#0F0F0F"),
        legend.text = ggplot2::element_text(colour="#DEBD39"),
        legend.title = ggplot2::element_text(colour="#DEBD39",face = "bold"),
        legend.key = ggplot2::element_rect(fill="#0F0F0F",colour="#DEBD39"),...)

  return(rocket)
}
#-------------------------------------------------------------------------------
#' Pokemon Go Team Logos
#'
#' Enhance your plots with a background picture of your favorite Pokemon Go team.
#'
#'@param team string. either 'mystic', 'valor' or 'instinct'
#'@param opacity opacity of team logo.
#'
#'@references The logos were not designed by me. All credit goes to
#'\href{https://dribbble.com/shots/2831980-Pok-mon-GO-Team-Logos-Vector-Download}{this guy}.
#'
#' @export
#' @examples
#' \dontrun{
#' library(tidyverse)
#'
#' pokemon %>%
#'  dplyr::filter(type1=="water") %>%
#'  ggplot(aes(defense,attack))+
#'  annotate_pogo(team = "mystic")+
#'  geom_point()+
#'  theme_mystic()+
#'  labs(title="Team Mystic",subtitle="Water Pokemon")
#' }
annotate_pogo <- function(team="mystic",opacity=0.5){
  if(!team%in%c("mystic","valor","instinct")){
    stop("team must be one of 'mystic', 'valor','instinct'")
  }
  bg_dir <- system.file("backgrounds",package="Rokemon")
  img <- png::readPNG(paste0(bg_dir,"/team-",team,".png"))
  img[,,4] <- opacity*img[,,4]
  g <- grid::rasterGrob(img, interpolate=TRUE)

  pogo <- ggplot2::annotation_custom(g, xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf)

  return(pogo)
}
#-------------------------------------------------------------------------------
#' Theme Mystic
#'
#' ggplot theme that simply adds a blue background to the plot.
#'
#' @export
theme_mystic <- function(){
  mystic <- ggplot2::theme(panel.background = ggplot2::element_rect(fill="white"),
                           plot.background = ggplot2::element_rect(fill="#4B38F7"),
                           panel.grid = ggplot2::element_blank(),
                           plot.title = ggplot2::element_text(colour="white"),
                           plot.subtitle = ggplot2::element_text(colour="white"),
                           plot.caption = ggplot2::element_text(colour="white"),
                           strip.background = ggplot2::element_rect(fill="#483D8B"),
                           strip.text = ggplot2::element_text(colour="white"),
                           axis.text = ggplot2::element_text(colour="white"),
                           axis.ticks = ggplot2::element_line(colour="white"),
                           axis.title = ggplot2::element_text(colour="white")
  )
  return(mystic)
}

#-------------------------------------------------------------------------------
#' Theme Valor
#'
#' ggplot theme that simply adds a red background to the plot.
#'
#' @export
theme_valor <- function(){
  valor <- ggplot2::theme(panel.background = ggplot2::element_rect(fill="white"),
                          plot.background = ggplot2::element_rect(fill="#FC0000"),
                          panel.grid = ggplot2::element_blank(),
                          strip.background = ggplot2::element_rect(fill="#CD0000")
  )
  return(valor)
}

#-------------------------------------------------------------------------------
#' Theme Instinct
#'
#' ggplot theme that simply adds a yellow background to the plot.
#'
#' @export
theme_instinct <- function(){
  instinct <- ggplot2::theme(panel.background = ggplot2::element_rect(fill="white"),
                             plot.background = ggplot2::element_rect(fill="#F7E300"),
                             panel.grid = ggplot2::element_blank(),
                             strip.background = ggplot2::element_rect(fill="#FFD700")
  )
  return(instinct)
}
