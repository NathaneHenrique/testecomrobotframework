
*** Settings ***
Library  SeleniumLibrary
Resource        ../resource/Resource.robot
Test Setup      Abrir navegador
Test Teardown   Fechar navegador

### Setup roda keyword antes da suite ou antes de um Teste
### TEARDOWN roda keyword depois de uma suite ou um Teste

*** Test Case ***
Caso de Teste 1: Pesquisar produto existente
    Acessar página home do site
### Conferir se a página home foi exibida
    Digitar o nome de produto "Blouse" no campo de pesquisa
    Clicar no botão de pesquisa
    Conferir se o produto "Blouse" foi listado no site

Caso de Teste 2: Pesquisar produto não existente
    Acessar página home do site
    Digitar o nome de produto "itemNãoExistente" no campo de pesquisa
    Clicar no botão de pesquisa
    Conferir mensagem de erro "No results were found for your search "itemNãoExistente""
