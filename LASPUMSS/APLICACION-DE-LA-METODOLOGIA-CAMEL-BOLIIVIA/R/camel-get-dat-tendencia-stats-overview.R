getDatTrendStatsOverviewInd <- function(id='indCap_CAP', datCamelIndNorm, roundInd=TRUE, idsDecreasing = FALSE) {
  
  source('LASPUMSS/APLICACION-DE-LA-METODOLOGIA-CAMEL-BOLIIVIA/R/camel-get-dat-tendencia-indicadores.R')
  source('LASPUMSS/APLICACION-DE-LA-METODOLOGIA-CAMEL-BOLIIVIA/R/camel-get-dat-estadistica-descriptiva-indicadores.R')
    
    
    datTrend <- getDatTrendInd(id, datCamelIndNorm,idsDecreasing)
    datStats <- getDatStatsOverviewInd(id, datCamelIndNorm, roundInd,idsDecreasing)
    
    datResult <- 
        left_join(datStats, 
                  datTrend, 
                  by = join_by(TIPO_DE_ENTIDAD == TIPO_DE_ENTIDAD), 
                  relationship = 'one-to-one', 
                  suffix = c("_x", "")) %>% 
        select(-ends_with("_x")) %>% 
        relocate(TENDENCIA, .after = TIPO_DE_ENTIDAD)

    
    
}
