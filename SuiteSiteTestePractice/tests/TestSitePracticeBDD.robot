*** Settings ***
Resource         ../resource/Resource.robot
Test Setup       Abrir navegador
Test Teardown    Fechar navegador

### SETUP ele roda keyword antes da suite ou antes de um teste
### TEARDOWN ele roda keyword depois de uma suite de um teste

*** Test Cases ***
Cenário 01: Pesquisar produto existente
  ### Para rodar o setup em somente um teste (ou sobrescrever um listado nos settings), colocar o [Setup]
  ### [Setup]    Abrir navegador firefox 
  Dado que estou na página home do site
  Quando eu pesquisar pelo produto "Blouse"
  Então o produto "Blouse" deve ser listado na página de resultado da busca
  ### Mesma coisa para o Teardown
  ### [Teardown]    Fechar navegador firefox 

Cenário 02: Pesquisar produto não existente
  Dado que estou na página home do site
  Quando eu pesquisar pelo produto "itemNaoExistente"
  Então a página deve exibir a mensagem de erro "No results were found for your search "itemNaoExistente""


*** Keywords ***
Dado que estou na página home do site
    Acessar a página home do site

Quando eu pesquisar pelo produto "${PRODUTO}"
    Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão pesquisar

Então o produto "${PRODUTO}" deve ser listado na página de resultado da busca
    Conferir se o produto "${PRODUTO}" foi listado no site

Então a página deve exibir a mensagem de erro "${MENSAGEM_ALERTA}"
    Conferir mensagem de erro "${MENSAGEM_ALERTA}"
