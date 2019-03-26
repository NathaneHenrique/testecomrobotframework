*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}     firefox
${URL}         http://automationpractice.com

*** Keywords ***
Abrir navegador
    Open Browser     about:blank    ${BROWSER}

#Fechar navegador
#     Close Browser

Dado que estou na página home do site
      Go To                           http://automationpractice.com
      Title Should Be                 My Store

Quando eu pesquisar pelo produto "${PRODUTO}"
      Input Text   name=search_query    ${PRODUTO}
      Wait Until Element Is Visible     //*[@id="searchbox"]/button
      Click Button                      name=submit_search

Então o produto "${PRODUTO}" deve ser listado na página de resultado da busca
      Wait Until Element Is Visible     css=#center_column > h1
      Title Should Be                   Search - My Store
      Page Should Contain Image         xpath=//*[@id="center_column"]//img[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]


Então a página deve exibir a mensagem "${PRODUTO_INEXISTENTE}"
      Wait Until Element Is Enabled      //*[@id="center_column"]/p[@class='alert alert-warning']
      Element Text Should Be             //*[@id="center_column"]/p[@class='alert alert-warning']      ${PRODUTO_INEXISTENTE}

E passar o mouse por cima da categoria "Womem" no menu principal
      Mouse Up                           xpath=//*[@id="block_top_menu"]/ul/li[1]/a

E clicar na sub categoria "${TIPO_PRODUTO}"
      Wait Until Element Is Visible       //*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a
      Click Link                          //*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a
      Wait Until Element Is Visible       //*[@id="center_column"]//span[@class="category-name"][contains(text(),"${TIPO_PRODUTO}")]

Então os produtos devem ser listados
      Page Should Contain Image           xpath=//*[@id="center_column"]//img[@src="http://automationpractice.com/img/p/1/2/12-home_default.jpg"]

E pesquisar pelo produto "${PRODUTO_BLUSAS}"
      Input Text   name=search_query      ${PRODUTO_BLUSAS}
      Wait Until Element Is Visible       //*[@id="searchbox"]/button
      Click Button                        name=submit_search
      Wait Until Element Is Visible       xpath=//*[@id="center_column"]//img[@src="http://automationpractice.com/img/p/1/1-home_default.jpg"]
      Page Should Contain Image           xpath=//*[@id="center_column"]//img[@src="http://automationpractice.com/img/p/1/1-home_default.jpg"]

E adicionar o produto ao carrinho
      Click Element                       xpath=//*[@id="center_column"]/ul/li/div/div[2]/div[2]/a[1]

Quando eu acessar o carrinho por procedd to checkout
      Wait Until Element Is Visible       xpath=//*[@id="layer_cart"]/div[1]/div[2]/div[4]/a/span
      Click Element                       xpath=//*[@id="layer_cart"]/div[1]/div[2]/div[4]/a/span

Então o produto deve ser listado no carrinho
      Wait Until Element Is Visible       xpath=//*[@id="product_1_1_0_0"]/td[1]/a/img
      Page Should Contain Image           xpath=//*[@id="product_1_1_0_0"]/td[1]/a/img
      Wait Until Element Is Visible       xpath=//*[@id="total_product_price_1_1_0"]
      Wait Until Element Is Visible       xpath=//*[@id="product_1_1_0_0"]/td[2]/p/a

E eu acessar o carrinho de comprar
    Click Element                         xpath=//*[@id="header"]/div[3]/div/div/div[3]/div/a

E remover o produtos
    Wait Until Element Is Visible         xpath=//*[@id="1_1_0_0"]
    Click Element                         xpath=//*[@id="1_1_0_0"]

Então deve ser exibida a mensagem "${PRODUTO_EXCLUIDO}"
    Wait Until Element Is Enabled      xpath=//*[@id="center_column"]/p
    Element Text Should Be             //*[@id="center_column"]/p[@class='alert alert-warning']      ${PRODUTO_EXCLUIDO}

E clicar no botão de login
    Click Element                     xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a

Quando eu registrar uma nova conta
    Input Text                        id=email_create    yizecano@network-source.com
    Click Element                     xpath=//*[@id="SubmitCreate"]/span
    Wait Until Element Is Visible     xpath=//*[@id="noSlide"]/h1
    Wait Until Element Is Visible     xpath=//*[@id="uniform-id_gender1"]
    Click Element                     id=uniform-id_gender1
    Input Text                        xpath=//*[@id="customer_firstname"]    Teste
    Input Text                        xpath=//*[@id="customer_lastname"]    Silva
    Input Text                        id=passwd    123456789
    Click Element                     id=uniform-days
    Click Element                     xpath=//*[@id="days"]/option[8]
    Click Element                     id=months
    Click Element                     xpath=//*[@id="months"]/option[8]
    Scroll Element Into View          xpath=//*[@id="years"]/option[31]
    Click Element                     xpath=//*[@id="years"]/option[31]
    Input Text                        xpath=//*[@id="firstname"]    Nometeste
    Input Text                        xpath=//*[@id="lastname"]    Sobrenome
    Input Text                        id=company    Nome da Empresa
    Input Text                        id=address1    Endereço da empresa
    Input Text                        id=address2    Segundo Endereço
    Input Text                        id=city    Nome da cidade
    Click Element                     id=uniform-id_state
    Scroll Element Into View          xpath=//*[@id="id_state"]/option[46]
    Click Element                     xpath=//*[@id="id_state"]/option[46]
    Input Text                        id=postcode    88888
    Scroll Element Into View          id=id_country
    Click Element                     id=id_country
    Input Text                        id=phone_mobile    884758696
    Input Text                        id=alias    77bd9a9d35@mailboxy.fun
    Click Button                      id=submitAccount




###USAR MOUSE UP PARA SIMULAR O MOUSE POR CIMA DO ELE
