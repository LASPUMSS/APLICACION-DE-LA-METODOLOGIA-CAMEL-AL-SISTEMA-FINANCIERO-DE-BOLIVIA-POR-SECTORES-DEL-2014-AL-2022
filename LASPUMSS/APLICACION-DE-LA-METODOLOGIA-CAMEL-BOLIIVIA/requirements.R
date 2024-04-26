# PAQUETES NECESARIAS CRAN

pkgs <-  data.frame(utils::installed.packages())[,'Package']
pkgs_required <- c('openxlsx','dplyr')
pkgs_miss <- pkgs_required[!(pkgs_required %in% pkgs)]

if (length(pkgs_miss)>=1) {
  print('Se instalara los paquetes de CRAN necesarios.')
  print(pkgs_miss)
  install.packages(pkgs_miss)
}else{
  print('Ya existe todos los paquete necesarios.')
}

lapply(pkgs_required, require, character.only = TRUE)

rm(list = c('pkgs','pkgs_required','pkgs_miss'))
