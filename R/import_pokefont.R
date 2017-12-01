#'Import Pokefonts
#'
#'Use this function to import the Pokemon Fonts to R.
#'@export
import_pokefont <- function() {

  poke_font_dir <- system.file("fonts", package="Rokemon")

  suppressWarnings(suppressMessages(extrafont::font_import(poke_font_dir, prompt=FALSE)))

  message(
    sprintf(
      "You might need to install the font on your system too.\n\nYou can find them in [%s]",
      poke_font_dir )
  )

}
