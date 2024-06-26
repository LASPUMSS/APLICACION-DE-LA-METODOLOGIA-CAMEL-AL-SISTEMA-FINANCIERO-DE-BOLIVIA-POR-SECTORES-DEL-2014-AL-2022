getDatEEFF <- function() {
    
    require(openxlsx)
    require(dplyr)
 
    rootFile <- 'LASPUMSS/APLICACION-DE-LA-METODOLOGIA-CAMEL-BOLIVIA/DATA/BBDD_ESTADOS_FINANCIEROS.xlsx'
    dat <- read.xlsx(rootFile)

    dat$FECHA <- convertToDate(dat$FECHA)
    
    # Limpieza final de datos
    
    dat$TIPO_DE_ENTIDAD <- gsub('COPERATIVAS_DE_AHORRO_Y_CREDITO',
                                'COOPERATIVAS_DE_AHORRO_Y_CREDITO',
                                dat$TIPO_DE_ENTIDAD)
    
    dat$ENTIDIDAD <- gsub('CSN \\(1\\)','CSN', dat$ENTIDIDAD)
    
    dat$GESTION <- as.character(dat$GESTION)
    dat$MES <- as.character(dat$MES)
    dat$DIA <- as.character(dat$DIA)
    
    # Igualar la unidad de cuenta de todas las cuentas a bolivianos
    
    datEMB <- dat %>% 
        filter(EXPRESADO=='EN_MILES_DE_BOLIVIANOS') %>% 
        mutate(across(.cols = where(is.numeric), ~ .x * 1000 ))
    
    datEB <- dat %>% 
        filter(EXPRESADO=='EN_BOLIVIANOS')
    
    dat <- bind_rows(datEMB,datEB)
    
    dat$EXPRESADO <- rep('EN_BOLIVIANOS',nrow(dat))
    
    dat$GESTION <- as.numeric(dat$GESTION)
    dat$MES <- as.numeric(dat$MES)
    dat$DIA <- as.numeric(dat$DIA)
    
    # Remplazar dato NA por 0
    
    dat <- dat %>% replace(is.na(.), 0)
    
    return(dat)
    
}
