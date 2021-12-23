*** Settings ***
Resource         ../resource/Resource.robot
Test Setup       Abrir navegador
Test Teardown    Fechar navegador

### SETUP ele roda keyword antes da suite ou antes de um teste
### TEARDOWN ele roda keyword depois de uma suite de um teste

*** Test Cases ***
Caso de Teste 01: Pesquisar produto existente
  ### Para rodar o setup em somente um teste (ou sobrescrever um listado nos settings), colocar o [Setup]
  ### [Setup]    Abrir navegador firefox 
  Acessar a página home do site
  Digitar o nome do produto "Blouse" no campo de pesquisa
  Clicar no botão pesquisar
  Conferir se o produto "Blouse" foi listado no site
  ### Mesma coisa para o Teardown
  ### [Teardown]    Fechar navegador firefox 

Caso de Teste 02: Pesquisar produto não existente
  Acessar a página home do site
  Digitar o nome do produto "itemNaoExistente" no campo de pesquisa
  Clicar no botão pesquisar
  Conferir mensagem de erro "No results were found for your search "itemNaoExistente""