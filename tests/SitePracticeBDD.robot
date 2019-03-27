*** Settings ***
Library  SeleniumLibrary
Resource        ../resource/ResourceBDD.robot
Suite Setup     Abrir navegador
#Suite Teardown  Fechar navegador


### Setup roda keyword antes da suite ou antes de um Teste
### TEARDOWN roda keyword depois de uma suite ou um Teste

*** Variables ***
${URL}        http://automationpractice.com
${BROWSER}    chrome

*** Test Case ***
#Cenário 1: Pesquisar produto existente
###[Setup]   Fechar navegador firefox  "Se caso necessitar fazer é uma suite específica"
#      Dado que estou na página home do site
#      Quando eu pesquisar pelo produto "Blouse"
#      Então o produto "Blouse" deve ser listado na página de resultado da busca
###[Teardown]   Fechar firefox "Se caso necessitar fazer é uma suite específica"
###Se a suite tiver o Setupe Teardown próprio ele ignora os que foram declarados acima

#Cenário 2: Pesquisar produto não existente
#      Dado que estou na página home do site
#      Quando eu pesquisar pelo produto "itemNãoExistente"
#      Então a página deve exibir a mensagem "No results were found for your search "itemNãoExistente""

#Cenário 3: Listar produtos
#      Dado que estou na página home do site
#      E passar o mouse por cima da categoria "Womem" no menu principal
#      E clicar na sub categoria "Summer Dresses"
#      Então os produtos devem ser listados

#Cenário 4: Adicionar produtos no carrinho
#      Dado que estou na página home do site
#      E pesquisar pelo produto "t-shirts"
#      E adicionar o produto ao carrinho
#      Quando eu acessar o carrinho por procedd to checkout
#      Então o produto deve ser listado no carrinho

#Cenário 5: Remover produtos
#      Dado que estou na página home do site
#      E eu acessar o carrinho de comprar
#      E remover o produtos
#      Então deve ser exibida a mensagem ""


Cenário 5: Adicionar cliente
      Dado que estou na página home do site
      E clicar no botão de login
      #E informar um email válido
      Quando eu registrar uma nova conta
#      Então a página de gerenciamento deve ser exibida
