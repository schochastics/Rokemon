.onAttach <- function(libname, pkgname) {

  if (interactive()) {
    packageStartupMessage(paste0("This package is in an early stage.\n",
                                 "Check out https://github.com/schochastics/Rokemon for developments"))
  }


  if (.Platform$OS.type == "windows")  { # nocov start
    if (interactive()) packageStartupMessage("Registering Windows fonts with R")
    extrafont::loadfonts("win", quiet = TRUE)
  }

  # if (getOption("poke.loadfonts", default = FALSE)) {
  #   if (interactive()) packageStartupMessage("Registering PDF & PostScript fonts with R")
  #   extrafont::loadfonts("pdf", quiet = TRUE)
  #   extrafont::loadfonts("postscript", quiet = TRUE)
  # }

  fnt <- extrafont::fonttable()
  if (!all(c("pokemon-font")%in% fnt$FamilyName)) {
    packageStartupMessage("NOTE: Pokemon font is required to use this package.")
    packageStartupMessage("      Please use Rokemon::import_pokefont() to install it")
  } # nocov end

}

