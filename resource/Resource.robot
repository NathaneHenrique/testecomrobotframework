*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}     firefox
${URL}         http://automationpractice.com

*** Keywords ***
### Setup e Teardown ###
Abrir navegador
    Open Browser     about:blank    ${BROWSER}

Fechar navegador
     Close Browser

#### Passo a Passo
Acessar página home do site
      Go To               http://automationpractice.com
      Title Should Be     My Store

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
      Input Text   name=search_query    ${PRODUTO}

Clicar no botão de pesquisa
      Wait Until Element Is Visible     //*[@id="searchbox"]/button
      Click Element     name=submit_search

Conferir se o produto "${OBJETO}" foi listado no site
      Wait Until Element Is Visible     css=#center_column > h1
      Title Should Be                   Search - My Store
      Page Should Contain Image         xpath=//*[@id="center_column"]//img[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
      Page Should Contain Link          xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"${OBJETO}")]

Conferir mensagem de erro "${PRODUTO_INEXISTENTE}"
      Input Text   name=search_query      ${PRODUTO_INEXISTENTE}
      Wait Until Element Is Visible       //*[@id="center_column"]/p[@class='alert alert-warning']
      Element Text Should Be              //*[@id="center_column"]/p[@class='alert alert-warning']      ${PRODUTO_INEXISTENTE}
