# CNAE 2.0: Códigos e classificações

# Pacotes
library(dplyr)
library(readxl)

# Link do Excel com as informações
url <- "https://concla.ibge.gov.br/images/concla/documentacao/CNAE20_EstruturaDetalhada.xls"

arquivo <- "tabela_cnae.xls"

# Baixar o arquivo para Excel
download.file(url, destfile = arquivo, mode = "wb")

# Ler a planilha do Excel
cnae_tabela <- read_excel(arquivo)

# Visualizar as primeiras linhas da tabela
print(head(cnae_tabela))

# Seleciona apenas a coluna com as cnaes de 5 dígitos
cnae_tabela <- cnae_tabela[,c(4,5)]

# Omite o excedente
cnae_tabela <- na.omit(cnae_tabela)

cnae_tabela <- cnae_tabela %>%
  filter(...4 != "Classe")

# Renomenado
cnae_tabela <- cnae_tabela %>%
  rename(cod_classe = ...4, classe = ...5)

# Visualizar os grupos
print(head(cnae_tabela))

# Remover símbolos
cnae_tabela$cod_classe <- sub("[^0-9]", "", cnae_tabela$cod_classe)

# Exportar para Excel
writexl::write_xlsx(cnae_tabela, "cnae_classes.xlsx")

