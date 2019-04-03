*** Settings ***
Documentation   Exemplo de uso de variáveis como argumentos em Keywords
Library    SeleniumLibrary
Library    String

*** Variable ***
&{PESSOA} nome=May    sobrenome=Fernandes    email=mayfernandes@exemplo.com.br    idade=12   sexo=feminino

*** Test Cases ***
Caso de teste exemplo 01
    Uma Keyword qualquer 01

*** Keywords ***
Uma Keyword qualquer 01
    Uma subkeyword com argumentos ${PESSOA.nome}    ${PESSOA.email}
    ${MENSAGEM_ALERTA}    Uma subkeyword com retorno    ${PESSOA.nome}    ${PESSOA.idade}
    Log    ${MENSAGEM_ALERTA}

Uma subkeyword com argumentos
    [Arguments]   ${NOME_USUARIO}    ${EMAIL_USUARIO}
    Log    Nome Usuário: ${NOME_USUARIO}
    Log    Email: ${EMAIL_USUARIO}

Uma subkeyword com retorno
    [Arguments]    ${NOME_USUARIO}    ${IDADE_USUARIO}    ${IDADE_USUARIO}
    ${MENSAGEM}    Set Variable If    ${IDADE_USUARIO}<18    Não autorizado! O usuário ${NOME_USUARIO} é menor de idade!

#####################EXEMPLOS#############
#    Crie uma nova keyword na suite de testes web que fizemos, onde ela nos retorne um e-mail
#     customizado para ser utilizado na keyword "Informar um e-mail válido". Essa
#     customização deve ter o nome + sobrenome do cliente + uma string aleatória +
#     @testerobot.com. Exemplo: MayFernandesWedd34Dd@testerobot.com

#    Obs.: A sua keyword deve receber argumentos e retornar o e-mail resultante.
#    Informar um e-mail válido
#        Wait Until Element Is Visible   id=email_create
#        ${EMAIL}                        Generate Random String
#        Input Text
#        email personalizado
#          [arguments]             ${PRIMEIRO-NOME}  ${ULTIMO-NOME}
#          ${PARTE-ALEATÓRIA}      Generate Random String
#          ${EMAIL-PERSONALIZADO}  Set Variable  ${PRIMEIRO-NOME}${ULTIMO-NOME}${PARTE-ALEATÓRIA}@testerobot.com
#          [return]                ${EMAIL-PERSONALIZADO}

#*** Variables ***

#  ${Nome}  Gabriele

#  ${Sobrenome}  Vieira

#  ${Email_valido}  @exemplo


#  *** Keyword ***

#  [Arguments]  ${Nome}  ${Sobrenome}

#  ${StringAleatoria}  Generate Random String

#  ${Email}  Set Varible ${Nome}${Sobrenome}${StringAleatoria}${Email_valido}

#  Log   ${Email}

#  Return  ${Email}
