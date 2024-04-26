renderTableCamelRangosLimites <- function(dat, fontSize=8) {
    
    dat$INDICADOR <- gsub('indCap ', '',
                          gsub('indAct ', '',
                               gsub('indAdm ', '',
                                    gsub('indBenf ', '',
                                         gsub('indLq ', '',
                                              gsub('_',' ', dat$INDICADOR))))))
    
    require(knitr)
    require(kableExtra)
    require(huxtable)
    
    tableResult <- as_hux(dat)  
    n <- nrow(tableResult)
    
    tableResult <- tableResult  %>% 
      set_number_format(5) %>% 
      set_number_format(0, row=1, col=everywhere) %>% 
      set_bold(row = 1, col = everywhere) %>%
      set_top_border(row = 1, col = everywhere) %>%
      set_bottom_border(row = 1, col = everywhere) %>%
      set_bottom_border(row = n, col = everywhere) %>% 
      set_caption("Limites para indicadores CAMEL")
    
    font_size(tableResult) <- fontSize
    
    tableResult <- 
      tableResult %>% 
      as_flextable() %>%
      flextable::font(fontname = "Times New Roman")
    
    return(tableResult)
    
}