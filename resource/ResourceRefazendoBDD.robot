*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${BROWSER}      chrome
${URL}          http://automationpractice.com

#### Ações
*** Keywords ***
#### Setup e Teardown
Abrir navegador
    Open Browser        about:blank   ${BROWSER}

Fechar navegador
    Close Browser
Dado que estou na página home do site
    Go To               ${URL}
    Wait Until Element Is Visible    xpath=//*[@id="block_top_menu"]/ul
    Title Should Be     My Store

Quando eu pesquisar pelo produto "${PRODUTO}"
    Input Text          name=search_query    ${PRODUTO}
    Click Element       name=submit_search

Então o produto "${PRODUTO}" deve ser listado na página de resultado da busca
    Wait Until Element Is Visible   css=#center_column > h1
    Title Should Be                 Search - My Store
    Page Should Contain Image       xpath=//*[@id="center_column"]//*[@src='${URL}/img/p/7/7-home_default.jpg']
    Page Should Contain Link        xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUTO}")]

Então a página deve exibir a mensagem "${MENSAGEM_ALERTA}"
    Wait Until Element Is Visible   xpath=//*[@id="center_column"]/p[@class='alert alert-warning']
    Element Text Should Be          xpath=//*[@id="center_column"]/p[@class='alert alert-warning']    ${MENSAGEM_ALERTA}

Quando eu acessar a categoria "${CATEGORIA}"
    Wait Until Element Is Visible   xpath=//*[@id="block_top_menu"]//a[@title="${CATEGORIA}"]
    Mouse Over                      xpath=//*[@id="block_top_menu"]//a[@title="${CATEGORIA}"]

E consultar a sub-categoria "${SUBCATEGORIA}"
    Wait Until Element Is Visible   xpath=//*[@id="block_top_menu"]//a[@title="${SUBCATEGORIA}"]
    Click Element                   xpath=//*[@id="block_top_menu"]//a[@title="${SUBCATEGORIA}"]

Então a página deve exibir os produtos da sub-categoria "${SUBCATEGORIA}"
    Page Should Contain Element    xpath=//*[@id="center_column"]/h1/span[contains(text(),"Summer Dresses")]
    Page Should Contain Element    xpath=//*[@id="center_column"]/ul/li[1]/div/div[2]/h5/a[@title="Printed Summer Dress"]
    Page Should Contain Element    xpath=//*[@id="center_column"]/ul/li[2]/div/div[2]/h5/a[@title="Printed Summer Dress"]
    Page Should Contain Element    xpath=//*[@id="center_column"]/ul/li[3]/div/div[2]/h5/a[@title="Printed Chiffon Dress"]

E adicionar o produto no carrinho
    Wait Until Element Is Visible   xpath=//*[@id="center_column"]//img[@alt="Faded Short Sleeve T-shirts"]
    Click Element                   xpath=//*[@id="center_column"]//img[@alt="Faded Short Sleeve T-shirts"]
    Wait Until Element Is Visible   xpath=//*[@id="add_to_cart"]/button
    Click Button                    xpath=//*[@id="add_to_cart"]/button
E existe o produto "${PRODUTO}" adicionado no carrinho
    Quando eu pesquisar pelo produto "${PRODUTO}"
    E adicionar o produto no carrinho
    Wait Until Element Is Visible   xpath=//*[@id="layer_cart"]//a[@title="Proceed to checkout"]
    Click Element                   xpath=//*[@id="layer_cart"]//a[@title="Proceed to checkout"]

Quando excluir o produto do carrinho
    Click Element    xpath=//*[@class="cart_quantity_delete"]
    Wait Until Element Is Visible   xpath=//*[@id="center_column"]/p[@class='alert alert-warning']
    Element Text Should Be          xpath=//*[@id="center_column"]/p[@class='alert alert-warning']    Your shopping cart is empty.

Quando eu solictar cadastro de novo cliente
    Click Element    xpath=//*[@id="header"]//*[@class="login"][contains(text(),"Sign in")]
    Wait Until Element Is Visible   id=email_create
    ${EMAIL}                        Generate Random String
    Input Text                      id=email_create    ${EMAIL}@testerobot.com
    Click Button    id=SubmitCreate
    Wait Until Element Is Visible     xpath=//*[@id="noSlide"]/h1
    Wait Until Element Is Visible     xpath=//*[@id="uniform-id_gender1"]
    Click Element                     id=uniform-id_gender1
    Input Text                      id=customer_firstname    May
    Input Text                      id=customer_lastname     Fernandes
    Input Text                      id=address1              Rua Framework, Bairro Robot
    Input Text                      id=city                  Floripa
    Input Text                        xpath=//*[@id="passwd"]      123456789
    Input Text                        xpath=//*[@id="firstname"]    Nometeste
    Input Text                        xpath=//*[@id="lastname"]    Sobrenome
    Input Text                        id=company    Nome da Empresa
    Input Text                        id=address1    Endereço da empresa
    Input Text                        id=address2    Segundo Endereço
    Input Text                        id=city    Nome da cidade
    Click Element                     id=uniform-id_state
    Scroll Element Into View          xpath=//*[@id="id_state"]/option[2]
    Click Element                     xpath=//*[@id="id_state"]/option[2]
    Input Text                        id=postcode    88888
    Scroll Element Into View          id=id_country
    Click Element                     id=id_country
    Input Text                        id=phone_mobile    884758696
    Input Text                        id=alias    77b9d35@mailboxy.fun
Então o cadastro deve ser efetuado com sucesso
    Click Button                      id=submitAccount
    Wait Until Element Is Visible    xpath=//*[@id="center_column"]/p
    Element Text Should Be           xpath=//*[@id="center_column"]/p
    ...    Welcome to your account. Here you can manage all of your personal information and orders.
    Element Text Should Be           xpath=//*[@id="header"]/div[2]//div[1]/a/span    May Fernandes
