#' Gamyboy inspired ggplot theme
#'
#' Theme based on the first generation gameboy.
#'
#' @param title_style string. Either \code{"8Bit"} for *Bit Font or \code{"poke"} for Pokemon title Font.
#' @export

theme_gameboy <- function() {
  title_font <- "pokemon-font"

  gb <- ggplot2::theme(panel.grid = element_blank(),
          # panel.grid.major = element_line(colour="#008B00"),
          panel.background = element_rect(fill="#79BC00"),
          panel.border = element_rect(fill=NA,colour="#8F8B8F",size=4),
          plot.background = element_rect(fill="#C1BDB7"),
          text = element_text(family = "pokemon-font"),
          plot.title = element_text(family = title_font,colour="#561E94"),
          plot.subtitle = element_text(family = title_font,colour="#561E94"),
          axis.ticks = element_line(colour="#8F8B8F"),
          legend.background = element_rect(fill="#C1BDB7"),
          legend.position = "bottom",
          legend.text = element_text(colour="#561E94"),
          legend.key = element_rect(fill="#C1BDB7",colour="black"),
          plot.caption = element_text(colour = "#A20055"))
  return(gb)
}

#-------------------------------------------------------------------------------
#' Health Bar theme
#'
#' Theme used in gghealth.
#'
#' @export
theme_status <- function(){
    hp <- ggplot2::theme(legend.position="none",
            axis.line = element_line(size = 1,lineend = "square"),
            axis.text.y = element_text(family = "pokemon-font",colour = "#ecdb6d"),
            axis.text.x = element_text(family = "pokemon-font",colour = "#ecdb6d"),
            plot.title = element_text(family = "pokemon-font",colour = "#ecdb6d"),
            plot.subtitle = element_text(family = "pokemon-font",colour = "#ecdb6d"),
            plot.caption = element_text(family = "pokemon-font",colour = "#ecdb6d"),
            axis.ticks.x = element_line(colour = "#ecdb6d"),
            axis.ticks.y = element_line(colour = "#ecdb6d"),
            plot.background = element_rect(fill = "black"),
            panel.background = element_rect(fill = "white"),
            panel.grid = element_blank(),
            strip.background = element_rect(fill="#ecdb6d"),
            strip.text = element_text(family = "pokemon-font",colour = "black"))
    return(hp)
}

#-------------------------------------------------------------------------------
#' Theme Rocket
#'
#' Blasting off
#'
#' @export
theme_rocket <- function(){
  rocket <- ggplot2::theme(panel.background = element_rect(fill="#FFFFFF",colour=NA),
        plot.background =  element_rect(fill="#0F0F0F",colour=NA),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_line(colour="#DEBD39",linetype = 8),
        axis.title.x = element_text(colour = "#EE30A7"),
        axis.text.x = element_text(colour = "#EE30A7"),
        axis.line.x = element_line(colour = "#EE30A7",size=1.5,lineend = "square"),
        axis.ticks.x = element_line(colour = "#EE30A7"),
        axis.title.y = element_text(colour = "#8968CD"),
        axis.text.y = element_text(colour = "#8968CD"),
        axis.line.y = element_line(colour = "#8968CD",size=1.5,lineend = "square"),
        axis.ticks.y = element_line(colour = "#8968CD"),
        plot.title = element_text(colour="#DEBD39"),
        plot.subtitle = element_text(colour="#DEBD39"),
        plot.caption = element_text(colour="#DEBD39"),
        strip.background = element_rect(fill="#0F0F0F",colour=NA),
        strip.text = element_text(colour="#DEBD39"),
        legend.background = element_rect(fill="#0F0F0F"),
        legend.text = element_text(colour="#DEBD39"),
        legend.key = element_rect(fill="#0F0F0F",colour="#DEBD39"))

  return(rocket)
}
#-------------------------------------------------------------------------------
#' Pogo Team Logo as background
#'
#'
#'
#' @export
annotate_pogo <- function(team="mystic",opacity=0.5){
  if(!team%in%c("mystic","valor","instinct")){
    error("team must be one of 'mystic', 'valor','instinct'")
  }
  bg_dir <- system.file("backgrounds",package="Rokemon")
  img <- png::readPNG(paste0(bg_dir,"/team-",team,".png"))
  img[,,4] <- opacity*img[,,4]
  g <- grid::rasterGrob(img, interpolate=TRUE,gp = grid::gpar(alpha=0.2))

  pogo <- annotation_custom(g, xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf)

  return(pogo)
}
#-------------------------------------------------------------------------------
#' Theme Mystic
#'
#' Blasting off
#'
#' @export
theme_mystic <- function(){
  mystic <- theme(panel.background = element_rect(fill="white"),
                 plot.background = element_rect(fill="#4B38F7"),
                 panel.grid = element_blank(),
                 strip.background = element_rect(fill="#483D8B"),
                 strip.text = element_text(colour="white"),
                 axis.text = element_text(colour="white"),
                 axis.ticks = element_line(colour="white"),
                 axis.title = element_text(colour="white")
  )
  return(mystic)
}

#-------------------------------------------------------------------------------
#' Theme Valor
#'
#' Blasting off
#'
#' @export
theme_valor <- function(){
  valor <- theme(panel.background = element_rect(fill="white"),
                    plot.background = element_rect(fill="#FC0000"),
                    panel.grid = element_blank(),
                    strip.background = element_rect(fill="#CD0000")
  )
  return(valor)
}

#-------------------------------------------------------------------------------
#' Theme Instinct
#'
#' Blasting off
#'
#' @export
theme_instinct <- function(){
  instinct <- theme(panel.background = element_rect(fill="white"),
                    plot.background = element_rect(fill="#F7E300"),
                    panel.grid = element_blank(),
                    strip.background = element_rect(fill="#FFD700")
  )
  return(instinct)
}
