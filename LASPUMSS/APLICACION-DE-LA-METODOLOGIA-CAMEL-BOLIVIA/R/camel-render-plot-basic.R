renderCamelPlotBasic <- function(plot, width = 5, height=7) {
  
  require(ggplot2)
  require(magick)
  require(knitr)
  
  pathDir <- 'tmp_files_imgs'
  if (!dir.exists(pathDir)) dir.create(pathDir)
  
  nImg <- length(list.files(pathDir)) + 1
  path = paste0(pathDir,'/img',nImg,'.png')
  
  ggsave(filename = path, 
         plot = plot,
         width = width, 
         height = height, 
         dpi=700)
  
  # Asegurar el formato de la imagen
  error_file = magick::image_read(path)
  right_png <- magick::image_convert(error_file, "png")
  magick::image_write(right_png, path = path, format = "png")
  
  rootPlot <- normalizePath(path, winslash = "/")
  
  return(knitr::include_graphics(rootPlot))
  
}
