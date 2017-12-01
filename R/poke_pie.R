#' Poke Pie Charts
#'
#'Create Pie Charts of the color distribution of Pokemon sprites.
#'
#'@param path_to_sprites path to sprite files. See Details
#'@param poke name or pokedex number of Pokemon
#'
#'@details Sprites are not provided and have to be download prior of usage. It is important
#'that the sprites are numbered from 1.png to 801.png. \url{https://github.com/PokeAPI/sprites}
#' contains all sprites in the right format and has been used for testing.
#'
#'@export
poke_pie <- function(path_to_sprites="",poke){
  if(is.character(poke)){
    poke <- tolower(poke)
    poke <- gsub(" ","",poke)
    poke <- gsub("\\.","",poke)
    poke <- gsub("-","",poke)

    if(poke=="nidoran"){
      warning("no gender specified for Nidoran. Using female as default\n")
      poke <- "nidoranf"
    }

    if (!(poke %in% pokenames)) {
      warning(paste(poke, "does not seem to be a Pokemon or is spelled wrongly\n. Using Pikachu instead.\n"))
      poke <- "pikachu"
    }
    poke <- which(pokenames==poke)
  }

  sprite <- png::readPNG(paste0(path_to_sprites,poke,".png"))
  dimension <- dim(sprite)
  img_rgb <- data.frame(
    x = rep(1:dimension[2], each = dimension[1]),
    y = rep(dimension[1]:1, dimension[2]),
    R = as.vector(sprite[,,1]),
    G = as.vector(sprite[,,2]),
    B = as.vector(sprite[,,3])
  )
  img_tbl <- dplyr::count(dplyr::group_by_(img_rgb,"R","G","B"))
  img_tbl <- img_tbl[img_tbl$R!=0 | img_tbl$G!=0 | img_tbl$B!=0,]
  img_tbl <- dplyr::ungroup(img_tbl[img_tbl$R!=1 | img_tbl$G!=1 | img_tbl$B!=1,])
  img_tbl <- dplyr::arrange_(img_tbl,"n")
  img_tbl$col <- grDevices::rgb(img_tbl$R,img_tbl$G,img_tbl$B)

  n <- nrow(img_tbl)
  img_tbl$t <- 1:n

  img <- grid::rasterGrob(sprite, interpolate=TRUE)

  p <- ggplot2::ggplot(img_tbl,ggplot2::aes(x="",y=n,fill=factor(t)))+
    ggplot2::geom_col()+
    ggplot2::coord_polar("y",start=0)+
    ggplot2::scale_fill_manual(values=img_tbl$col)+ggplot2::theme_minimal()+
    ggplot2::theme(legend.position = "none",
          panel.grid=ggplot2::element_blank(),
          axis.text=ggplot2::element_blank(),
          axis.title=ggplot2::element_blank())
  q <- cowplot::ggdraw(p)+ cowplot::draw_grob(img,0.3,0.3,0.4,0.4)

  q

}
