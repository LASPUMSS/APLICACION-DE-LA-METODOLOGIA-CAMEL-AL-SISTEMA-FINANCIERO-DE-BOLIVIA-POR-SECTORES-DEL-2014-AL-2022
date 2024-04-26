renderListTablesInd <- function(listResult , c, fontSize=8) {
    
  require(dplyr)
  require(knitr)
  require(kableExtra)
  require(huxtable)
    
    listTables <- list()
    n <- length(listResult)
    datTrendIndTotal <- data.frame()
    
    for (i in seq(n)) {
        
        id <- listResult[[i]][['id']]
        datTrendInd <- listResult[[i]][['datTrendInd']]
        datTrendInd <- datTrendInd %>% select(-c(MINIMO, MAXIMO))
        
        datTrendIndTotal <-  bind_rows(datTrendIndTotal,datTrendInd)
    }
    
    names(datTrendIndTotal) <- gsub('_',' ', names(datTrendIndTotal))
    
    tableResult <- as_hux(datTrendIndTotal) 
    
    nCn <- 1
    
    for (i in seq(n)) {
      
      nameIndById <- listResult[[i]][['nameIndById']]
      nameIndById <- str_to_upper(nameIndById)
    
      new_row <- c(nameIndById, "","","")
      
      tableResult <-  
        tableResult %>%
        insert_row(new_row, after = nCn)  %>%
        set_bold(row = nCn+1, col = everywhere) 
      
      nCn <- nCn + c+1
    }
    
    tableResult <- 
      tableResult %>%
      set_number_format(5) %>%
      set_bold(row = 1, col = everywhere) %>%
      set_top_border(row = 1, col = everywhere) %>%
      set_bottom_border(row = 1, col = everywhere) %>%
      set_bottom_border(row = nrow(tableResult), col = everywhere)
    
    font_size(tableResult) <- fontSize
    
    tableResult <- 
      tableResult %>% 
      as_flextable() %>%
      flextable::font(fontname = "Times New Roman")
    
    return(tableResult)
}


renderListTablesInd2 <- function(listResult , c, fontSize=8) {
  
  require(dplyr)
  require(knitr)
  require(kableExtra)
  require(huxtable)
  
  listTables <- list()
  n <- length(listResult)
  datTrendIndTotal <- data.frame()
  
  for (i in seq(n)) {
    
    id <- listResult[[i]][['id']]
    datTrendInd <- listResult[[i]][['datTrendInd']]
    datTrendInd <- datTrendInd %>% select(-c(MINIMO, MAXIMO))
    
    datTrendIndTotal <-  bind_rows(datTrendIndTotal,datTrendInd)
  }
  
  names(datTrendIndTotal) <- gsub('_',' ', names(datTrendIndTotal))
  
  tableResult <- as_hux(datTrendIndTotal) 
  
  nCn <- 1
  
  for (i in seq(n)) {
    
    nameIndById <- listResult[[i]][['nameIndById']]
    nameIndById <- str_to_upper(nameIndById)
    
    new_row <- c(nameIndById, "","","")
    
    tableResult <-  
      tableResult %>%
      insert_row(new_row, after = nCn)  %>%
      set_bold(row = nCn+1, col = everywhere) 
    
    nCn <- nCn + c+1
  }
  
  tableResult <- 
    tableResult %>%
    set_number_format(5) %>%
    set_number_format(0, row=everywhere, col=3) %>% 
    set_bold(row = 1, col = everywhere) %>%
    set_top_border(row = 1, col = everywhere) %>%
    set_bottom_border(row = 1, col = everywhere) %>%
    set_bottom_border(row = nrow(tableResult), col = everywhere)
  
  font_size(tableResult) <- fontSize
  
  tableResult <- 
    tableResult %>% 
    as_flextable() %>%
    flextable::font(fontname = "Times New Roman")
  
  return(tableResult)
}
